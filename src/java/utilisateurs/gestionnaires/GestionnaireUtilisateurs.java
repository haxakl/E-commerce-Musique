package utilisateurs.gestionnaires;

import java.util.Collection;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import utilisateurs.modeles.Utilisateur;

@Stateless
public class GestionnaireUtilisateurs {
    @PersistenceContext(unitName = "TP_2_GitPU")
    private EntityManager em;

    public void persist(Object object) {
        em.persist(object);
    }

    public void creerUtilisateursDeTest() {
        creeUtilisateur("John", "Lennon", "jlennon", "test");
        creeUtilisateur("Paul", "Mac Cartney", "pmc", "test");
        creeUtilisateur("Ringo", "Starr", "rstarr", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
    }

    public Utilisateur creeUtilisateur(String nom, String prenom, String login, String password) {
        Utilisateur u = new Utilisateur(nom, prenom, login, password);
        em.persist(u);
        return u;
    }

    public Collection<Utilisateur> getAllUsers() {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Utilisateur u");
        return q.getResultList();
    }

    public void persist1(Object object) {
        em.persist(object);
    }

    public void persist2(Object object) {
        em.persist(object);
    }

}
