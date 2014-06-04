/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.membre;

import java.io.IOException;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import musique.gestionnaires.GestionnaireMusiques;
import musique.modeles.Musique;
import panier.gestionnaire.GestionnairePanier;
import utilisateurs.gestionnaires.GestionnaireUtilisateurs;
import utilisateurs.modeles.Utilisateur;

/**
 *
 * @author julien
 */
@WebServlet(name = "Panier", urlPatterns = {"/panier"})
public class Panier extends HttpServlet {

    @EJB
    private GestionnaireUtilisateurs gestionnaireUtilisateurs;
    @EJB
    private GestionnaireMusiques gestionnaireMusiques;

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
        System.out.println("===== Servlet CART =====");

        if (request.getParameter("idmus") != null) {
            Musique msc = gestionnaireMusiques.getMusique(Integer.valueOf(request.getParameter("idmus")));
            System.out.println("Ajout au panier de la musique: " + msc.getTitre());
            GestionnairePanier panier_tmp = (GestionnairePanier) request.getSession().getAttribute("panier");
            panier_tmp.addToCart(msc);
        }
        if (request.getParameter("action") != null && request.getParameter("action").equalsIgnoreCase("empty")) {
            System.out.println("TEST");
            GestionnairePanier panier_tmp = (GestionnairePanier) request.getSession().getAttribute("panier");
            panier_tmp.makeEmpty();
        } else {
            this.getServletContext().getRequestDispatcher("/view/frontoffice/panier.jsp").forward(request, response);
        }

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

        // Acheter
        if (request.getParameter("action") != null && request.getParameter("action").equalsIgnoreCase("buy")) {
            Utilisateur current_user = (Utilisateur) request.getSession().getAttribute("user");

            if (current_user != null) {
                GestionnairePanier panier_tmp = (GestionnairePanier) request.getSession().getAttribute("panier");
                Collection<Musique> musics_tmp = panier_tmp.getMusiques();
                System.out.println(current_user);
                gestionnaireUtilisateurs.addPurshased(current_user, musics_tmp);
                request.getSession().setAttribute("panier", null);
                response.sendRedirect("/tp2webmiage/profile");
            } else {
                response.sendRedirect("/tp2webmiage/connexion?etat=achat");
            }
        } else {
            processRequest(request, response);
        }
    }
}
