package servlets.visiteur;

import abonnement.gestionnaire.GestionnaireAbonnements;
import abonnement.modeles.Abonnement;
import java.io.IOException;
import javax.ejb.EJB;
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
@WebServlet(name = "Prix", urlPatterns = {"/abonnement"})
public class ServletAbonnement extends HttpServlet {
    @EJB
    private GestionnaireAbonnements gestionnaireAbonnements;

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

        HttpServletRequest httprequest = (HttpServletRequest) request;
        HttpSession session = httprequest.getSession();
        Utilisateur current_user = (Utilisateur) session.getAttribute("user");
        
        
        if (current_user == null) {
            // Si l'utilisateur n'est pas connecté
            request.setAttribute("checkconnect", "no");
        } else {
            // Si l'utilisateur est connecté
            if (request.getParameter("type_abo") != null) {
                Abonnement find_abo = gestionnaireAbonnements.seekAbonnement(request.getParameter("type_abo"));
                System.out.println("FIND ABO : "+find_abo);
                gestionnaireAbonnements.addUtilisateur(find_abo, current_user);
            }
            request.setAttribute("checkconnect", "yes");
        }
        this.getServletContext().getRequestDispatcher("/view/frontoffice/abonnement.jsp").forward(request, response);
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
        processRequest(request, response);
    }

}
