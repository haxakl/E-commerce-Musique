package servlets.visiteur;

import utilisateurs.modeles.Adresse;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import javax.ejb.EJB;
import javax.json.Json;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import musique.gestionnaires.GestionnaireMusiques;
import musique.modeles.Artiste;
import musique.modeles.Genre;
import musique.modeles.Musique;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import utilisateurs.modeles.Telephone;
import utilisateurs.gestionnaires.GestionnaireUtilisateurs;
import utilisateurs.modeles.Utilisateur;

/**
 *
 * @author Guillaume
 */
@WebServlet(name = "Accueil", urlPatterns = {"/index.jsp"})
public class Accueil extends HttpServlet {
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

        if (gestionnaireMusiques.getAllMusiques().isEmpty()) {
            JSONParser parser = new JSONParser();
            String chaine = "";
            try {
                InputStream ips = new FileInputStream(getServletContext().getRealPath("") + "\\ressources\\musique.json");
                InputStreamReader ipsr = new InputStreamReader(ips);
                BufferedReader br = new BufferedReader(ipsr);
                String ligne;
                while ((ligne = br.readLine()) != null) {
                    chaine += ligne + "\n";
                }
                br.close();
            } catch (Exception e) {
                System.out.println(e.toString());
            }

            try {
                Object obj = parser.parse(chaine);
                JSONArray array = (JSONArray) obj;
                Artiste acdc = new Artiste("AC-DC", "Groupe de rock connu", "/photos/acdc");
                gestionnaireMusiques.persist(acdc);
                Genre rock = new Genre("rock");
                gestionnaireMusiques.persist(rock);
                for (int i = 0; i < array.size(); i++) {
                    JSONObject objet = (JSONObject) array.get(i);
                    JSONArray compositions = (JSONArray) objet.get("composition");

                    Musique musique = gestionnaireMusiques.creerMusique(acdc, (String) objet.get("nom"), compositions.size(), 2000, "", rock);

                    // Boucle sur les compositions
                    int nbpiste = 0;
                    for (int j = 0; j < compositions.size(); j++) {
                        String piste = compositions.get(j).toString();
                        if (piste.lastIndexOf('.') != -1 && piste.substring(piste.lastIndexOf('.') + 1).toLowerCase().compareTo("mp3") == 0) {
                            gestionnaireMusiques.creerPiste(musique, (String) compositions.get(j));
                            nbpiste++;
                        }
                    }
                    
                    musique.setNbpiste(nbpiste);
                }
            } catch (ParseException pe) {
                System.out.println("position: " + pe.getPosition());
                System.out.println(pe);
            }
        }

        request.setAttribute("accueil", "true");

        this.getServletContext().getRequestDispatcher("/accueil.jsp").forward(request, response);
    }

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
        request.setAttribute("message", "");
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

        if (gestionnaireUtilisateurs.connexion(request.getParameter("login"), request.getParameter("password"))) {

            // Récupération de l'utilisateur
            Utilisateur user = gestionnaireUtilisateurs.getUser(request.getParameter("login"));

            // Stocker les informations de l'utilisateur
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Redirection
            ServletContext context = getServletContext();
            response.sendRedirect("/tp2webmiage/");

        } else {
            request.setAttribute("message", "invalide");
            this.getServletContext().getRequestDispatcher("/connexion.jsp").forward(request, response);
        }
    }

}
