package servlets.membre.utilisateurs;

import utilisateurs.modeles.Adresse;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utilisateurs.gestionnaires.GestionnaireUtilisateurs;

/**
 *
 * @author Guillaume
 */
@WebServlet(name = "AjouterUtilisateur", urlPatterns = {"/admin/utilisateurs/new"})
public class New extends HttpServlet {

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
        request.setAttribute("listeVilles", gestionnaireUtilisateurs.getVilles());

        this.getServletContext().getRequestDispatcher("/view/backoffice/utilisateurs/new.jsp").forward(request, response);
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

        this.getServletContext().log(request.getParameter("nom"));
        this.getServletContext().log(request.getParameter("prenom"));

        // Récupération de l'utilisateur
        gestionnaireUtilisateurs.creeUtilisateur(
                request.getParameter("nom"),
                request.getParameter("prenom"),
                request.getParameter("login"),
                request.getParameter("password"),
                request.getParameter("email"),
                new Adresse(request.getParameter("ville"), request.getParameter("cp")),
                request.getParameter("phone"));

        // Redirection
        response.sendRedirect("/tp2webmiage/admin/utilisateurs");
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
