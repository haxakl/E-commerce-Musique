/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package panier.modeles;

import java.io.IOException;
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

/**
 *
 * @author julien
 */
@WebServlet(name = "cart", urlPatterns = {"/Panier"})
public class ShoppingCartClient extends HttpServlet {
    GestionnairePanier gestionnairePanier = lookupGestionnairePanierBean();
    
    
    
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
            throws ServletException, IOException{
            System.out.println("===== Servlet CART =====");
            System.out.println(request.getParameter("idmus"));
            
            if(request.getParameter("idmus") != null) {
                int idmusique = Integer.parseInt(request.getParameter("idmus"));
                Musique msc = gestionnaireMusiques.getMusique(idmusique);
                ShoppingCartImpl mycart = new ShoppingCartImpl();
                mycart.create();
                mycart.addToCart(msc);
                gestionnairePanier.persist(mycart);
                System.out.println("Artiste : " + msc.getArtiste());
                System.out.println("Titre : " + msc.getTitre());
                System.out.println("IDMUSIQUE" + request.getParameter("idmus"));
                System.out.println("My cart :" + mycart.getItem(0).getTitre());
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
        processRequest(request, response);
    }

    private GestionnairePanier lookupGestionnairePanierBean() {
        try {
            Context c = new InitialContext();
            return (GestionnairePanier) c.lookup("java:global/TP_2_Git/GestionnairePanier!panier.gestionnaire.GestionnairePanier");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
