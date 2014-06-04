package servlets.membre.artistes;

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
import utilisateurs.gestionnaires.GestionnaireUtilisateurs;

/**
 *
 * @author julien
 */
@WebServlet(name = "ModifierArtiste", urlPatterns = {"/admin/artistes/modifier/*"})
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
        int idArtiste = Integer.valueOf(url.substring(url.lastIndexOf("/") + 1));
        
        request.setAttribute("artiste", gestionnaireMusiques.getArtiste(idArtiste));
        this.getServletContext().getRequestDispatcher("/view/backoffice/artistes/modifier.jsp").forward(request, response);
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
        
        // Récupérations des infos
        String inputNom = request.getParameter("nom");
        String inputDescription = request.getParameter("description");
        String inputPhoto = request.getParameter("photo");
        
        // Modification de l'utilisateur
        gestionnaireMusiques.modifierArtiste(
                Integer.parseInt(request.getPathInfo().replaceAll("/", "")),
                inputNom,
                inputDescription,
                inputPhoto);

        // Redirection
        response.sendRedirect("/tp2webmiage/admin/artistes?etat=modifier");
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
