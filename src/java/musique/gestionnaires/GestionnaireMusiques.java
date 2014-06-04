package musique.gestionnaires;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import musique.modeles.Artiste;
import musique.modeles.Genre;
import musique.modeles.Musique;
import musique.modeles.Piste;

/**
 *
 * @author Guillaume
 */
@Stateless
public class GestionnaireMusiques {

    @PersistenceContext(unitName = "TP_2_GitPU")
    private EntityManager em;

    public void persist(Object object) {
        em.persist(object);
    }

    public void merge(Object object) {
        em.merge(object);
    }

    // =============================
    //  Musiques
    // =============================
    /**
     * Créer une musique
     *
     * @param artiste Artiste
     * @param titre Titre
     * @param nbpiste Nombre de pistes
     * @param annee Année
     * @param url Url wikipedia de la musique
     * @param genre Genre
     * @return Une musique
     */
    public Musique creerMusique(Artiste artiste, String titre, int nbpiste, int annee, String url, Genre genre) {
        Musique m = new Musique(titre, nbpiste, annee, url);
        m.setArtiste(artiste);
        m.setGenre(genre);
        em.persist(m);
        return m;
    }

    /**
     * Créer une musique
     *
     * @param titre
     * @param annee
     * @param url
     * @return
     */
    public Musique creerMusique(String titre, int annee, String url) {
        Musique m = new Musique(titre, 0, annee, url);
        em.persist(m);
        return m;
    }

    /**
     * Retourne toutes les musiques
     *
     * @return Toutes les musiques
     */
    public Collection<Musique> getAllMusiques() {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select m from Musique m");
        return q.getResultList();
    }

    /**
     * Retourne les musiques dans une plage
     *
     * Utilisé lors des listes pour la pagination
     *
     * @param index Départ de la plage
     * @param offset Fin de la plage
     * @return Les musiques dans une plage
     */
    public Collection<Musique> getMusiques(int index, int offset) {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Musique u").setMaxResults(offset).setFirstResult(index);
        return q.getResultList();
    }

    /**
     * Retourne les musiques d'un artiste
     *
     * Utilisé lors des listes pour la pagination
     *
     * @param idArtiste Numéro de l'artiste
     * @return Les musiques dans une plage
     */
    public Collection<Musique> getMusiques(int idArtiste) {
        Artiste artiste = getArtiste(idArtiste);

        if (artiste != null) {
            // Exécution d'une requête équivalente à un select
            Query q = em.createQuery("select p from Musique p where p.artiste = :artiste").setParameter("artiste", artiste);
            return q.getResultList();
        }
        return new ArrayList<>();
    }

    /**
     * Retourne la musique cherchée
     *
     * Utilisé lors des listes pour la pagination
     *
     * @param idMusique Numéro de la musique
     * @return Les musiques dans une plage
     */
    public Musique getMusique(int idMusique) {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Musique u where u.id = :idMusique").setParameter("idMusique", idMusique);
        if (q.getResultList().isEmpty()) {
            return null;
        }
        return (Musique) q.getResultList().get(0);
    }

    /**
     * Retourne les musiques d'un genre précis
     *
     * @param idgenre Le numéro du genre
     * @return Les musiques d'un genre précis
     */
    public Collection<Musique> getMusiqueByGenre(int idgenre) {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select m from Musique m where m.genre.id = :cidgenre").setParameter("cidgenre", idgenre);
        return q.getResultList();
    }

    /**
     * Modifier la musique
     *
     * @param idMusique Numéro de la musique
     * @param artiste Artiste de la musique
     * @param genre Genre de la musique
     * @param titre Titre de la musique
     * @param annee Année de la musique
     * @param url Url de la musique
     */
    public void modifierMusique(int idMusique, Artiste artiste, Genre genre, String titre, int annee, String url) {
        Musique musique = getMusique(idMusique);
        musique.setArtiste(artiste);
        musique.setGenre(genre);
        musique.setTitre(titre);
        musique.setAnnee(annee);
        musique.setUrl(url);
        em.merge(musique);
    }

    /**
     * Supprimer une musique
     *
     * @param idMusique Numéro de la musique
     */
    public void deleteMusique(int idMusique) {
        Query q = em.createQuery("delete from Piste p where p.musique.id = :idMusique").setParameter("idMusique", idMusique);
        q.executeUpdate();

        Query q2 = em.createQuery("delete from Musique u where u.id = :idMusique").setParameter("idMusique", idMusique);
        q2.executeUpdate();
    }

    /**
     * Retourne les musiques d'un genre précis avec une plage
     *
     * @param idgenre Le numéro du genre
     * @param index Début de la plage
     * @param offset Fin de la plage
     * @return Les musiques d'un genre précis avec une plage
     */
    public Collection<Musique> getMusiqueByGenre(int idgenre, int index, int offset) {
        Query q = em.createQuery("select m from Musique m where m.genre.id = :cidgenre").setMaxResults(offset).setFirstResult(index).setParameter("cidgenre", idgenre);
        return q.getResultList();
    }

    // =============================
    //  Genres
    // =============================
    /**
     * Créer un genre de musique
     *
     * @param nom Nom du genre
     * @return Un genre
     */
    public Genre creerGenre(String nom) {
        Genre g = new Genre(nom);
        em.persist(g);
        return g;
    }

    /**
     * Modifier un genre de musique
     *
     * @param idGenre Numéro du genre
     * @param nom Nom du genre
     */
    public void modifierGenre(int idGenre, String nom) {
        Genre g = getGenre(idGenre);
        g.setNom(nom);
        em.merge(g);
    }

    /**
     * Retourne le genre cherché
     *
     * Utilisé lors des listes pour la pagination
     *
     * @param idGenre Numéro du genre
     * @return Un artiste
     */
    public Genre getGenre(int idGenre) {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select g from Genre g where g.id = :idGenre").setParameter("idGenre", idGenre);
        if (q.getResultList().isEmpty()) {
            return null;
        }
        return (Genre) q.getResultList().get(0);
    }

    /**
     * Retourne tous les genres
     *
     * @return Une collection de genre
     */
    public Collection<Genre> getAllGenres() {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select g from Genre g");
        return q.getResultList();
    }

    /**
     * Supprimer un genre
     *
     * @param idGenre Numéro du genre
     */
    public void deleteGenre(int idGenre) {
        Query q = em.createQuery("update Musique set genre = null where genre.id = :idGenre").setParameter("idGenre", idGenre);
        q.executeUpdate();

        Query q2 = em.createQuery("delete from Genre u where u.id = :idGenre").setParameter("idGenre", idGenre);
        q2.executeUpdate();
    }

    /**
     * Retourne les genres dans une plage
     *
     * Utilisé lors des listes pour la pagination
     *
     * @param index Départ de la plage
     * @param offset Fin de la plage
     * @return Les genres dans une plage
     */
    public Collection<Genre> getGenres(int index, int offset) {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Genre u").setMaxResults(offset).setFirstResult(index);
        return q.getResultList();
    }

    // =============================
    //  Pistes
    // =============================
    
    /**
     * Retourne la piste
     *
     * @param idPiste Numéro de la piste
     * @return Une piste
     */
    public Piste getPiste(int idPiste) {
        // Exécution d'une requête équivalente à un select
        Query q = em.createQuery("select p from Piste p where p.id = :idPiste").setParameter("idPiste", idPiste);

        if (q.getResultList().isEmpty()) {
            return null;
        }
        return (Piste) q.getResultList().get(0);
    }

    /**
     * Retourne toutes les pistes
     *
     * @param idMusique Numéro de la musique
     * @return Toutes les pistes
     */
    public Collection<Piste> getPistes(int idMusique) {
        Musique musique = getMusique(idMusique);

        if (musique != null) {
            // Exécution d'une requête équivalente à un select
            Query q = em.createQuery("select p from Piste p where p.musique = :pidmusique").setParameter("pidmusique", musique);
            return q.getResultList();
        }
        return new ArrayList<>();
    }

    /**
     * Créer une piste
     *
     * @param musique Musique de la piste
     * @param nom Nom de la piste
     * @return Une piste
     */
    public Piste creerPiste(Musique musique, String nom, int note) {

        Piste m = new Piste(musique, nom, note);

        em.persist(m);
        return m;
    }

    /**
     * Retourne les pistes dans une plage
     *
     * Utilisé lors des listes pour la pagination
     *
     * @param index Départ de la plage
     * @param offset Fin de la plage
     * @return Les piste dans une plage
     */
    public Collection<Piste> getPistes(int index, int offset) {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Piste u").setMaxResults(offset).setFirstResult(index);
        return q.getResultList();
    }

    /**
     * Retourne tous les pistes
     *
     * @return Une collection de piste
     */
    public Collection<Piste> getAllPistes() {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select a from Piste a");
        return q.getResultList();
    }

    // =============================
    //  Artiste
    // =============================
    /**
     * Créer une artiste
     *
     * @param nom Nom de l'artiste
     * @param description Description de l'artiste
     * @param photo Lien de la photo
     * @return Un artiste
     */
    public Artiste creerArtiste(String nom, String description, String photo) {
        Artiste a = new Artiste(nom, description, photo);
        em.persist(a);
        return a;
    }

    /**
     * Retourne l'artiste cherché
     *
     * Utilisé lors des listes pour la pagination
     *
     * @param idArtiste Numéro de l'artiste
     * @return Un artiste
     */
    public Artiste getArtiste(int idArtiste) {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select a from Artiste a where a.id = :idArtiste").setParameter("idArtiste", idArtiste);
        if (q.getResultList().isEmpty()) {
            return null;
        }
        return (Artiste) q.getResultList().get(0);
    }

    /**
     * Retourne l'artiste cherché
     *
     * Utilisé lors des listes pour la pagination
     *
     * @param nomArtiste Nom de l'artiste
     * @return Un artiste
     */
    public Artiste getArtiste(String nomArtiste) {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select a from Artiste a where a.nom = :nomArtiste").setParameter("nomArtiste", nomArtiste);
        if (q.getResultList().isEmpty()) {
            return null;
        }
        return (Artiste) q.getResultList().get(0);
    }

    /**
     * Retourne tous les artistes
     *
     * @return Une collection d'artiste
     */
    public Collection<Artiste> getAllArtistes() {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select a from Artiste a");
        return q.getResultList();
    }

    /**
     * Retourne les artistes dans une plage
     *
     * Utilisé lors des listes pour la pagination
     *
     * @param index Départ de la plage
     * @param offset Fin de la plage
     * @return Les musiques dans une plage
     */
    public Collection<Artiste> getArtistes(int index, int offset) {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Artiste u").setMaxResults(offset).setFirstResult(index);
        return q.getResultList();
    }

    /**
     * Supprimer un artiste
     *
     * @param idArtiste Numéro de l'artiste
     */
    public void deleteArtiste(int idArtiste) {
        Query q = em.createQuery("update Musique set artiste = null where artiste.id = :idArtiste").setParameter("idArtiste", idArtiste);
        q.executeUpdate();

        Query q2 = em.createQuery("delete from Artiste u where u.id = :idArtiste").setParameter("idArtiste", idArtiste);
        q2.executeUpdate();
    }

    /**
     * Modifier l'artiste
     *
     * @param idArtiste Numéro de l'artiste
     * @param nom Nom de l'artiste
     * @param description Description de l'artiste
     * @param photo Photo de l'artiste
     */
    public void modifierArtiste(int idArtiste, String nom, String description, String photo) {
        Artiste artiste = getArtiste(idArtiste);
        artiste.setNom(nom);
        artiste.setResume(description);
        artiste.setPhoto(photo);
        em.merge(artiste);
    }

    // =============================
    //  Recherche de patterns
    // =============================
    /**
     * Retourne les musiques dont le genre a un pattern précis
     *
     * @param pattern
     * @return
     */
    public Collection<Musique> searchGenre(String pattern) {
        Query q = em.createQuery("select m from Musique m where m.genre.nom LIKE :cpattern").setParameter("cpattern", "%" + pattern + "%");
        return q.getResultList();
    }

    /**
     * Retourne les musiques qui suivent un pattern précis
     *
     * @param pattern Le motif a rechercher
     * @return Les musiques qui ont le pattern
     */
    public Collection<Musique> searchMusique(String pattern) {
        Query q = em.createQuery("select m from Musique m where m.titre LIKE :cpattern").setParameter("cpattern", "%" + pattern + "%");
        return q.getResultList();
    }

    public Collection<Musique> searchArtist(String pattern) {
        Query q = em.createQuery("select m from Musique m where m.artiste.nom LIKE :cpattern").setParameter("cpattern", "%" + pattern + "%");
        return q.getResultList();
    }

    public Collection<Musique> searchAnnee(int pattern) {
        Query q = em.createQuery("select m from Musique m where m.annee = :cpattern").setParameter("cpattern", pattern);
        return q.getResultList();
    }

    // =============================
    //  Piste
    // =============================
    public Collection<Musique> getMusiqueByInstrument(String nom) {
        String lower = nom.toLowerCase();
        Query q = em.createQuery("select distinct p.musique from Piste p where lower(p.nom) LIKE :cnom").setParameter("cnom", "%" + nom + "%");
        return q.getResultList();
    }
}
