/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.membre;

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
import panier.gestionnaire.GestionnairePanier;
import utilisateurs.gestionnaires.GestionnaireUtilisateurs;
import utilisateurs.modeles.Utilisateur;

/**
 *
 * @author julien
 */
@WebServlet(name = "Paiement", urlPatterns = {"/paiement"})
public class Paiement extends HttpServlet {

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
        GestionnairePanier panier_tmp = (GestionnairePanier) request.getSession().getAttribute("panier");
        request.setAttribute("panier",  panier_tmp);
        Utilisateur current_user = (Utilisateur) request.getSession().getAttribute("user");
        request.getParameter("achat");
        if (current_user != null && request.getParameter("achat") != null && request.getParameter("achat").equals("success")) {
            Collection<Musique> musics_tmp = panier_tmp.getMusiques();
            // Test s'il reste du crédit sur l'utilisateur
            if (current_user.getAbonnement() != null && current_user.getAbonnement().getName().compareTo("ILLIMITED") == 0) {
                gestionnaireUtilisateurs.addPurshased(current_user, musics_tmp);
                request.getSession().setAttribute("panier", null);
                response.sendRedirect("/tp2webmiage/profile");
            } // Sinon on test qu'il reste du crédit
            else if (current_user.getNbMusiqueAchat() >= musics_tmp.size()){
                current_user.setNbMusiqueAchat(current_user.getNbMusiqueAchat() - musics_tmp.size());
                gestionnaireUtilisateurs.merge(current_user);
                gestionnaireUtilisateurs.addPurshased(current_user, musics_tmp);
                request.getSession().setAttribute("panier", null);
                response.sendRedirect("/tp2webmiage/profile");
            }
        }else{
            this.getServletContext().getRequestDispatcher("/view/frontoffice/paiement.jsp").forward(request, response);
        }
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
