package servlets.visiteur;

import adresse.modeles.Adresse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import telephone.modeles.Telephone;
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

        // L'utilisateur est connecté
        if ((Utilisateur) request.getSession().getAttribute("user") != null) {

            // Récupération de l'utilisateur
            Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");

            this.getServletContext().getRequestDispatcher("/view/backoffice/connecte.jsp").forward(request, response);
        }

        // Il n'y a pas d'utilisateurs
        if (gestionnaireUtilisateurs.getAllUsers().isEmpty()) {
            Adresse nice = new Adresse("NICE", "06480");
            Telephone tel = new Telephone("22");
            gestionnaireUtilisateurs.creeUtilisateur("Administrateur", "", "admin", "admin", nice, tel);
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
            this.getServletContext().getRequestDispatcher("/tp2webmiage/view/frontoffice/connexion.jsp").forward(request, response);
        }
    }

}
