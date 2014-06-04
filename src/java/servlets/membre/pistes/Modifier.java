package servlets.membre.pistes;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import musique.gestionnaires.GestionnaireMusiques;
import musique.modeles.Artiste;
import musique.modeles.Genre;
import musique.modeles.Musique;
import musique.modeles.Piste;
import utilisateurs.gestionnaires.GestionnaireUtilisateurs;

/**
 *
 * @author julien
 */
@WebServlet(name = "ModifierMusique", urlPatterns = {"/admin/pistes/modifier/*"})
public class Modifier extends HttpServlet {
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
        int idPiste = Integer.valueOf(url.substring(url.lastIndexOf("/") + 1));
        
        Piste piste = gestionnaireMusiques.getPiste(idPiste);
        
        request.setAttribute("listeDesMusiques", gestionnaireMusiques.getAllMusiques());
        request.setAttribute("piste", piste);
        this.getServletContext().getRequestDispatcher("/view/backoffice/pistes/modifier.jsp").forward(request, response);
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
        Artiste artiste = null;
        Genre genre = null;
        
        String inputArtiste = request.getParameter("artiste");
        String inputGenre = request.getParameter("genre");
        String inputAnnee = request.getParameter("annee");
        int annee = 0;
        
        if(inputArtiste != null && !inputArtiste.isEmpty()) {
            artiste = gestionnaireMusiques.getArtiste(Integer.parseInt(inputArtiste));
        }
        
        if(inputGenre != null && !inputGenre.isEmpty()) {
            genre = gestionnaireMusiques.getGenre(Integer.parseInt(inputGenre));
        }
        
        if(!inputAnnee.isEmpty()) {
            annee = Integer.parseInt(request.getParameter("annee"));
        }
        
        // Modification de l'utilisateur
        gestionnaireMusiques.modifierMusique(
                Integer.parseInt(request.getPathInfo().replaceAll("/", "")),
                artiste,
                genre,
                request.getParameter("titre"),
                annee,
                request.getParameter("url"));

        // Redirection
        response.sendRedirect("/tp2webmiage/admin/musiques?etat=modifier");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
