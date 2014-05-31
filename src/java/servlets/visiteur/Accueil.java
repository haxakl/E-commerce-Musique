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
 * Clé d'api:
 * 
 * API Key: c1ed12bbe627d4e5f486aeae944ebbbd
 * Secret: is 97c6d3af8f265f1d4d846e4c5f6cffa5
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
