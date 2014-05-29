package servlets.visiteur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import musique.modeles.Musique;
import utilisateurs.gestionnaires.GestionnaireUtilisateurs;
import utilisateurs.modeles.Utilisateur;

/**
 *
 * @author julien
 */
@WebServlet(name = "Musiques", urlPatterns = {"/musiques"})
public class Musiques extends HttpServlet {

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

        Collection<Musique> liste;
        // Page affichée
        int numPage = 1;
        if (request.getParameter("page") != null) {
            numPage = Integer.parseInt(request.getParameter("page"));
        }
        // Nombre affichée par page
        int nbAffiche = 0;
        if (request.getParameter("nbAffiche") != null) {
            nbAffiche = Integer.parseInt(request.getParameter("nbAffiche"));
            System.out.println("nbAffiche : " + nbAffiche);
        } else {
            nbAffiche = 30;
        }

        // Recupère tous les utilisateurs
        Collection<Musique> listeAllMusiques = gestionnaireUtilisateurs.getAllMusiques();
        double totalMusiques = listeAllMusiques.size();

        if (request.getParameter("genre") != null) {
            int genre = Integer.parseInt(request.getParameter("genre"));
            liste = gestionnaireUtilisateurs.getMusiqueByGenre(genre, (numPage - 1) * nbAffiche, nbAffiche);
            System.out.println(liste);
        } else {
            liste = gestionnaireUtilisateurs.getMusiques((numPage - 1) * nbAffiche, nbAffiche);
        }
        if (totalMusiques == 0) {
            request.setAttribute("nbPages", Math.ceil(liste.size() / nbAffiche));
        } else {
            request.setAttribute("nbPages", (int) Math.ceil(totalMusiques / nbAffiche));
        }
        request.setAttribute("page", numPage);
        request.setAttribute("nbAffiche", nbAffiche);
        request.setAttribute("listeDesMusiques", liste);
        this.getServletContext().getRequestDispatcher("/view/frontoffice/musiques.jsp").forward(request, response);
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
