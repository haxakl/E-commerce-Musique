package servlets.visiteur;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import musique.gestionnaires.GestionnaireMusiques;
import musique.modeles.Artiste;
import musique.modeles.Musique;
import musique.modeles.Piste;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import static servlets.visiteur.AccueilFilter.convertStreamToString;
import utilisateurs.gestionnaires.GestionnaireUtilisateurs;
import utilisateurs.modeles.Utilisateur;

/**
 *
 * @author julien
 */
@WebServlet(name = "Détail artiste", urlPatterns = {"/artistes/*"})
public class DetailArtiste extends HttpServlet {

    @EJB
    private GestionnaireMusiques gestionnaireMusiques;

    @EJB
    private GestionnaireUtilisateurs gestionnaireUtilisateurs;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = request.getRequestURL().toString();
        System.out.println(url);
        int idArtiste = Integer.valueOf(url.substring(url.lastIndexOf("/") + 1));

        Artiste artiste = gestionnaireMusiques.getArtiste(idArtiste);

        if (artiste.getResume().isEmpty()) {
            try {
                URL url_artiste = new URL("http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=" + URLEncoder.encode(artiste.getNom(), "UTF-8") + "&api_key=c1ed12bbe627d4e5f486aeae944ebbbd&format=json");
                final URLConnection urlConnection = url_artiste.openConnection();
                urlConnection.setDoOutput(true);
                urlConnection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
                urlConnection.connect();
                final OutputStream outputStream = urlConnection.getOutputStream();
                final InputStream inputStream = urlConnection.getInputStream();

                String json = convertStreamToString(inputStream);
                JSONParser parser = new JSONParser();
                JSONObject obj = (JSONObject) parser.parse(json);
                JSONObject tmp_artiste = (JSONObject) obj.get("artist");
                JSONObject tmp_bio = (JSONObject) tmp_artiste.get("bio");
                
                JSONArray tmp_images = (JSONArray) tmp_artiste.get("image");
                JSONObject tmp_image = (JSONObject) tmp_images.get(tmp_images.size()-1);
                
                String descr = ((String) tmp_bio.get("content")).substring(0, 254);
                artiste.setResume(descr);
                artiste.setPhoto((String) tmp_image.get("#text"));
                gestionnaireMusiques.merge(artiste);
            } catch (ParseException pe) {
                System.out.println("position: " + pe.getPosition());
                System.out.println(pe);
            } catch (IOException exception) {
                System.out.println(exception);
            }
        }

        // Recupère les musiques
        Collection<Musique> listeDesMusiques = gestionnaireMusiques.getMusiques(idArtiste);

        request.setAttribute("artiste", artiste);
        request.setAttribute("listeDesMusiques", listeDesMusiques);
        this.getServletContext().getRequestDispatcher("/view/frontoffice/detailartiste.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
