/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.membre;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import javax.ejb.EJB;
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

        // Un état
        if (request.getParameter("etat") != null) {
            request.setAttribute("etat", request.getParameter("etat"));
        }

        // On désire ajouter un article dans le panier
        if (request.getParameter("idmus") != null) {

            // On récupère la musique
            Musique msc = gestionnaireMusiques.getMusique(Integer.valueOf(request.getParameter("idmus")));

            // On récupère le panier
            GestionnairePanier panier_tmp = (GestionnairePanier) request.getSession().getAttribute("panier");

            // On teste si la musique est déjà dans le panier
            boolean trouve = false;
            for (Musique musique : panier_tmp.getMusiques()) {
                if (musique.getId() == msc.getId()) {
                    trouve = true;
                }
            }

            // Sinon on ajoute la musique au panier
            if (!trouve) {
                panier_tmp.addToCart(msc);
                response.sendRedirect("/tp2webmiage/panier");
            } else {
                response.sendRedirect("/tp2webmiage/panier?etat=dejapresent");
            }

        } else {
            if (request.getParameter("action") != null && request.getParameter("action").equalsIgnoreCase("empty")) {
                request.getSession().setAttribute("panier", null);
                this.getServletContext().getRequestDispatcher("/view/frontoffice/panier.jsp").forward(request, response);
            } else {
                this.getServletContext().getRequestDispatcher("/view/frontoffice/panier.jsp").forward(request, response);
            }
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

        GestionnairePanier panier_tmp = (GestionnairePanier) request.getSession().getAttribute("panier");
        
        // Acheter
        if (request.getParameter("action") != null && request.getParameter("action").equalsIgnoreCase("buy")) {
            Utilisateur current_user = (Utilisateur) request.getSession().getAttribute("user");

            if (current_user != null) {
                Collection<Musique> musics_tmp = panier_tmp.getMusiques();

                // Test s'il reste du crédit sur l'utilisateur
                if (current_user.getAbonnement() != null && current_user.getAbonnement().getName().compareTo("ILLIMITED") == 0) {
                    gestionnaireUtilisateurs.addPurshased(current_user, musics_tmp);
                    request.getSession().setAttribute("panier", null);
                    response.sendRedirect("/tp2webmiage/profile");
                } // Sinon on test qu'il reste du crédit
                else if (current_user.getNbMusiqueAchat() >= musics_tmp.size()) {
                    current_user.setNbMusiqueAchat(current_user.getNbMusiqueAchat() - musics_tmp.size());
                    gestionnaireUtilisateurs.merge(current_user);
                    gestionnaireUtilisateurs.addPurshased(current_user, musics_tmp);
                    request.getSession().setAttribute("panier", null);
                    response.sendRedirect("/tp2webmiage/profile");
                } // Sinon on dit qu'il ne reste plus assez de crédit
                else {
                    response.sendRedirect("/tp2webmiage/panier?etat=plusdecredit");
                }
            } else {
                response.sendRedirect("/tp2webmiage/connexion?etat=achat");
            }
        } else if (request.getParameter("action") != null && request.getParameter("action").equalsIgnoreCase("suppr")) {
            panier_tmp.getMusiques().remove(gestionnaireMusiques.getMusique(Integer.valueOf(request.getParameter("item"))));
            ArrayList<Musique> musiques = panier_tmp.getMusiques();
            panier_tmp.setMusiques(musiques);
            request.getSession().setAttribute("panier", panier_tmp);
            response.sendRedirect("/tp2webmiage/panier?etat=supprMusique");
        } else {
            processRequest(request, response);
        }
    }
}
