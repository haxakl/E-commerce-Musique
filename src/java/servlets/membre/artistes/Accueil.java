package servlets.membre.artistes;

import java.io.IOException;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import musique.gestionnaires.GestionnaireMusiques;
import musique.modeles.Artiste;
import utilisateurs.gestionnaires.GestionnaireUtilisateurs;

/**
 *
 * @author Guillaume
 */
@WebServlet(name = "AdminListerArtistes", urlPatterns = {"/admin/artistes"})
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

        // Un état
        if (request.getParameter("etat") != null) {
            request.setAttribute("etat", request.getParameter("etat"));
        }

        // Page affichée
        int numPage = 1;
        if(request.getParameter("page") != null) {
            numPage = Integer.parseInt(request.getParameter("page"));
        }
        
        // Nombre affichée par page
        int nbAffiche;
        if(request.getParameter("nbAffiche") != null) {
            nbAffiche = Integer.parseInt(request.getParameter("nbAffiche"));
            System.out.println("nbAffiche : " + nbAffiche);
        }
        else{
            nbAffiche = 30;
        }
        Collection<Artiste> liste = gestionnaireMusiques.getArtistes((numPage-1)*nbAffiche, nbAffiche);
        // Recupère tous les utilisateurs
        Collection<Artiste> listeAllUsers = gestionnaireMusiques.getAllArtistes();
        double totalUser = listeAllUsers.size();
        
        if(totalUser == 0){
            request.setAttribute("nbPages", Math.ceil(liste.size()/nbAffiche));
        }
        else{
            request.setAttribute("nbPages", (int) Math.ceil(totalUser/nbAffiche));    
        }
        request.setAttribute("page", numPage);
        request.setAttribute("nbAffiche", nbAffiche);
        request.setAttribute("listeDesArtistes", liste);
        request.getRequestDispatcher("/view/backoffice/artistes/accueil.jsp").forward(request, response);
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
