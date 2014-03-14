/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilisateurs.gestionnaires;

import java.util.Collection;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import utilisateurs.modeles.Utilisateur;

/**
 *
 * @author Guillaume
 */
@Stateless
public class GestionnaireUtilisateurs {

    @PersistenceContext(unitName = "WebApplication1PU")
    private EntityManager em;

    public void persist(Object object) {
        em.persist(object);
    }

    public void creerUtilisateursDeTest() {
        creeUtilisateur("John", "Lennon", "jlennon");
        creeUtilisateur("Paul", "Mac Cartney", "pmc");
        creeUtilisateur("Ringo", "Starr", "rstarr");
        creeUtilisateur("Georges", "Harisson", "georgesH");
    }

    public Utilisateur creeUtilisateur(String nom, String prenom, String login) {
        Utilisateur u = new Utilisateur(nom, prenom, login);
        em.persist(u);
        return u;
    }

    public Collection<Utilisateur> getAllUsers() {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Utilisateur u");
        return q.getResultList();
    }

}
