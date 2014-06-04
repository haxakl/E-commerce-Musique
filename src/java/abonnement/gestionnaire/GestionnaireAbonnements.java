/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abonnement.gestionnaire;

import abonnement.modeles.Abonnement;
import java.util.Collection;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import utilisateurs.modeles.Utilisateur;

/**
 *
 * @author julien
 */
@Stateless
public class GestionnaireAbonnements {
    
    
    @PersistenceContext(unitName = "TP_2_GitPU")
    private EntityManager em;

    public void persist(Object object) {
        em.persist(object);
    }

    public void merge(Object object) {
        em.merge(object);
    }

    public void creerAbonnement(){
        Abonnement basic = new Abonnement(3, "BASIC");
        em.persist(basic);
        Abonnement limited =  new Abonnement(50, "LIMITED");
        em.persist(limited);
        Abonnement unlimited = new Abonnement(-1, "UNLIMITED");
        em.persist(unlimited);
    }
    
    public Collection<Abonnement> getAbonnements(){ 
        Query q = em.createQuery("select a from Abonnement a");
        return q.getResultList();
    }
    
    public Abonnement seekAbonnement(String research){
        Query q = em.createQuery("select a from Abonnement a where a.name = :research").setParameter("research", research);
       if (q.getResultList().isEmpty()) {
            return null;
        }
        return (Abonnement) q.getResultList().get(0);
    }
    
    public void addUtilisateur(Abonnement abo, Utilisateur user){
        abo.addUtilisateur(user);
        user.setAbonnement(abo);
        em.merge(abo);
        em.merge(user);
    }
    
}
