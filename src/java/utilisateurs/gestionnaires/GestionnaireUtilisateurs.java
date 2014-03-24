package utilisateurs.gestionnaires;

import java.util.Collection;
import java.util.Iterator;
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

    // Créer une masse d'utilisateur
    public void creerUtilisateursDeTest() {
        creeUtilisateur("John", "Lennon", "jlennon", "test");
        creeUtilisateur("Paul", "Mac Cartney", "pmc", "test");
        creeUtilisateur("Ringo", "Starr", "rstarr", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
        creeUtilisateur("Georges", "Harisson", "georgesH", "test");
    }

    // Test si l'utilisateur existe et si le mot de passe correspond
    public boolean connexion(String login, String password) {
        Query q = em.createQuery("select u from Utilisateur u where u.login = :clogin and u.password = :cpassword").setParameter("clogin", login).setParameter("cpassword", password);
        
        Collection<Utilisateur> users = q.getResultList();
        
        return !users.isEmpty();
    }
    
    // Créer un utilisateur
    public Utilisateur creeUtilisateur(String nom, String prenom, String login, String password) {
        Utilisateur u = new Utilisateur(prenom, nom, login, password);
        em.persist(u);
        return u;
    }
    
    // Modifier un utilisateur
    public Utilisateur modifierUtilisateur(int id, String nom, String prenom, String login, String password) {
        Utilisateur u = getUser(id);
        u.setPrenom(prenom);
        u.setNom(nom);
        u.setLogin(login);
        u.setPassword(password);
        em.persist(u);
        return u;
    }

    // Retourne les utilisateurs avec un index et un offset
    public Collection<Utilisateur> getUsers(int index, int offset) {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Utilisateur u").setMaxResults(offset).setFirstResult(index);
        return q.getResultList();
    }
    
    // Retourne tous les utilisateurs
    public Collection<Utilisateur> getAllUsers() {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Utilisateur u");
        return q.getResultList();
    }
    
    // Supprime un utilisateur
    public void deleteUtilisateur(int id) {
        Query q = em.createQuery("delete from Utilisateur u where u.id = :cid").setParameter("cid", id);
        q.executeUpdate();
    }
    
    // Retourne l'utilisateur demandé grâce à son login
    public Utilisateur getUser(String login) {
        Query q = em.createQuery("select u from Utilisateur u where u.login = :clogin").setParameter("clogin", login);
        
        Collection<Utilisateur> users = q.getResultList();
        Iterator iterator = users.iterator();
        
        return (Utilisateur) iterator.next();
    }

    // Retourne l'utilisateur demandé grâce à son id
    public Utilisateur getUser(int id) {
        Query q = em.createQuery("select u from Utilisateur u where u.id = :cid").setParameter("cid", id);
        
        Collection<Utilisateur> users = q.getResultList();
        Iterator iterator = users.iterator();
        
        return (Utilisateur) iterator.next();
    }

    public void persist1(Object object) {
        em.persist(object);
    }

}
