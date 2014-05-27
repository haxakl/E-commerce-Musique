package utilisateurs.gestionnaires;

import adresse.modeles.Adresse;
import java.util.Collection;
import java.util.Iterator;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import musique.modeles.Artiste;
import musique.modeles.Genre;
import musique.modeles.Musique;
import telephone.modeles.Telephone;
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

        // On cree des adresses et on les insère dans la base  
        Adresse biot = new Adresse("Biot", "06410");
        em.persist(biot);
        Adresse valbonne = new Adresse("Valbonne", "06560");
        em.persist(valbonne);
        Adresse nice = new Adresse("Nice", "06000");
        em.persist(nice);

        Telephone untel = new Telephone("0634220204");
        em.persist(untel);

        Telephone untel2 = new Telephone("0618967542");
        em.persist(untel);

        creeUtilisateur("John", "Lennon", "jlennon", "test", nice, untel);
        creeUtilisateur("Paul", "Mac Cartney", "pmc", "test", valbonne, untel);
        creeUtilisateur("Ringo", "Starr", "rstarr", "test", nice, untel);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
        creeUtilisateur("Georges", "Harisson", "georgesH", "test", biot, untel2);
    }

    // Test si l'utilisateur existe et si le mot de passe correspond
    public boolean connexion(String login, String password) {
        Query q = em.createQuery("select u from Utilisateur u where u.login = :clogin and u.password = :cpassword").setParameter("clogin", login).setParameter("cpassword", password);

        Collection<Utilisateur> users = q.getResultList();

        return !users.isEmpty();
    }

    // Créer un utilisateur
    public Utilisateur creeUtilisateur(String nom, String prenom, String login, String password, Adresse a, Telephone tel) {

        Utilisateur u = new Utilisateur(prenom, nom, login, password);
        // On met à jour la relation, elle est déjà en base  
        u.setAdresse(a);
        u.setTelephone(tel);

        // a est déjà en base et connectée, donc la ligne suivante modifie les   
        // données pour relier l'adresse à l'utilisateur 
        a.addUtilisateur(u);

        tel.setUtilisateur(u);

        // On persiste l'utilisateur, la relation est déjà en base, cela va donc  
        // ajouter une ligne dans la table des utilisateur avec une clé étrangère  
        // correspondant à l'adresse  
        em.persist(u);
        return u;
    }

    public void creerMusiquesDeTest() {

        Artiste acdc = new Artiste("AC-DC", "Groupe de rock connu", "/photos/acdc");
        Artiste afi = new Artiste("AFI", "AFI", "/photos/afi");
        Artiste aero = new Artiste("Aerosmith", "Aerosmith", "/photos/aerosmith");
        Artiste alicecopper = new Artiste("Alice Copper", "Alice Copper", "/photos/alicecopper");

        em.persist(acdc);
        em.persist(afi);
        em.persist(aero);
        em.persist(alicecopper);

        Genre rock = new Genre("rock");
        em.persist(rock);

    }

    // Créer un utilisateur
    public Musique creerMusique(Artiste artiste, String titre, int nbpiste, int annee, String url, Genre genre) {

        Musique m = new Musique(titre, nbpiste, annee, url);
        m.setArtiste(artiste);
        m.setGenre(genre);

        // a est déjà en base et connectée, donc la ligne suivante modifie les   
        // données pour relier l'adresse à l'utilisateur 
        // On persiste l'utilisateur, la relation est déjà en base, cela va donc  
        // ajouter une ligne dans la table des utilisateur avec une clé étrangère  
        // correspondant à l'adresse  
        em.persist(m);
        return m;
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

    public Collection<Musique> getAllMusiques() {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select m from Musique m");
        return q.getResultList();
    }

    public Collection<Musique> getMusiqueByGenre(int idgenre) {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select m from Musique m where m.genre.id = :cidgenre").setParameter("cidgenre", idgenre);
        return q.getResultList();
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

    public Collection<Adresse> getVilles() {
        Query q = em.createQuery("select a from Adresse a");

        return q.getResultList();
    }

    public Collection<Utilisateur> getUsersParVille(int idVille) {
        Adresse a = em.find(Adresse.class, idVille);

        // a est connecté, le get va déclencher un select  
        return a.getUtilisateurs();
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
