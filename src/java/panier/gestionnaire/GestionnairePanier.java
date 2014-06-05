/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package panier.gestionnaire;

import java.util.ArrayList;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import musique.modeles.Musique;

/**
 *
 * @author julien
 */
public class GestionnairePanier {

    @PersistenceContext(unitName = "TP_2_GitPU")
    private EntityManager em;

    private ArrayList<Musique> musiques;

    /**
     * Constructeur par défaut
     */
    public GestionnairePanier() {
        musiques = new ArrayList<>();
    }

    public ArrayList<Musique> getMusiques() {
        return musiques;
    }

    public void setMusiques(ArrayList<Musique> musiques) {
        this.musiques = musiques;
    }

    public boolean isEmpty() {
        return musiques.isEmpty();
    }
    
    public void addToCart(Musique musique) {
        if (musique != null) {
            musiques.add(musique);
        }

    }
    public void makeEmpty(){
        musiques.clear();
    }

    public void persist(Object object) throws RuntimeException {
        em.persist(object);
    }
}
