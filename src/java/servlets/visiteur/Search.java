/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets.visiteur;

import java.io.IOException;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import musique.gestionnaires.GestionnaireMusiques;
import musique.modeles.Musique;

/**
 *
 * @author julien
 */
@WebServlet(name = "Search", urlPatterns = {"/search"})
public class Search extends HttpServlet{
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
        Collection<Musique> liste = null;
        
        if(request.getParameter("searchtitle") != null){
            String pattern = request.getParameter("searchtitle");
            liste = gestionnaireMusiques.searchMusique(pattern);
            System.out.println(liste);
        }
        else if(request.getParameter("searchgenre") != null){
           String pattern = request.getParameter("searchgenre");
           liste = gestionnaireMusiques.searchGenre(pattern);
        }
        else if(request.getParameter("searchartist") != null){
           String pattern = request.getParameter("searchartist");
           liste = gestionnaireMusiques.searchArtist(pattern);
        }
        else if(request.getParameter("searchannee") != null){
            int pattern = Integer.parseInt(request.getParameter("searchannee"));
            liste = gestionnaireMusiques.searchAnnee(pattern);
        }
        else{
            liste = gestionnaireMusiques.getAllMusiques();
        }
        
        
        request.setAttribute("nbPages", 1);
        request.setAttribute("page", 1);
        request.setAttribute("nbAffiche", 30);
        request.setAttribute("listeDesMusiques", liste);
        this.getServletContext().getRequestDispatcher("/view/frontoffice/musiques.jsp").forward(request, response);
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
