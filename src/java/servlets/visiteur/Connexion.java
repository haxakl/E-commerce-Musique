package servlets.visiteur;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utilisateurs.gestionnaires.GestionnaireUtilisateurs;
import utilisateurs.modeles.Utilisateur;

/**
 *
 * @author Guillaume
 */
@WebServlet(name = "Connexion", urlPatterns = {"/connexion"})
public class Connexion extends HttpServlet {

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
            request.setAttribute("message", request.getParameter("etat"));
        }
        
        this.getServletContext().getRequestDispatcher("/view/frontoffice/connexion.jsp").forward(request, response);
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
            this.getServletContext().getRequestDispatcher("/view/frontoffice/connexion.jsp").forward(request, response);
        }
    }

}
