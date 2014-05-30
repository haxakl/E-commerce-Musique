/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package musique.gestionnaires;

import java.util.ArrayList;
import java.util.Collection;
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

    // =============================
    //  Musiques
    // =============================
    
    /**
     * Créer une musique
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
        if(q.getResultList().isEmpty()) {
            return null;
        }
        return (Musique) q.getResultList().get(0);
    }

    /**
     * Retourne les musiques d'un genre précis
     * @param idgenre Le numéro du genre
     * @return Les musiques d'un genre précis
     */
    public Collection<Musique> getMusiqueByGenre(int idgenre) {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select m from Musique m where m.genre.id = :cidgenre").setParameter("cidgenre", idgenre);
        return q.getResultList();
    }

    /**
     * Retourne les musiques d'un genre précis avec une plage
     * @param idgenre Le numéro du genre
     * @return Les musiques d'un genre précis avec une plage
     */
    public Collection<Musique> getMusiqueByGenre(int idgenre, int index, int offset) {
        Query q = em.createQuery("select m from Musique m where m.genre.id = :cidgenre").setMaxResults(offset).setFirstResult(index).setParameter("cidgenre", idgenre);
        return q.getResultList();
    }
    
    // =============================
    //  Pistes
    // =============================
    
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

    // Créer un utilisateur
    public Piste creerPiste(Musique musique, String nom) {

        Piste m = new Piste(musique, nom);

        em.persist(m);
        return m;
    }

    // =============================
    //  Artiste
    // =============================
    
    /**
     * Retourne tous les artistes
     *
     * @return Tous les artistes
     */
    public Collection<Artiste> getAllArtistes() {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select a from Artiste a");
        return q.getResultList();
    }

}