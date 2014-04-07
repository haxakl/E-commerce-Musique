/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package musique.modeles;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author julien
 */
@Entity
public class Musique implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    private Artiste artiste;
    @ManyToOne
    private Genre genre;
    private String titre;
    private int nbpiste; 
    private int annee;
    private String url;

    public Musique() {
    }

    public Musique(String titre, int nbpiste, int annee, String url) {
        this.titre = titre;
        this.nbpiste = nbpiste;
        this.annee = annee;
        this.url = url;
    }
    
    /**
     * Get the value of url
     *
     * @return the value of url
     */
    public String getUrl() {
        return url;
    }

    /**
     * Set the value of url
     *
     * @param url new value of url
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * Get the value of annee
     *
     * @return the value of annee
     */
    public int getAnnee() {
        return annee;
    }

    /**
     * Set the value of annee
     *
     * @param annee new value of annee
     */
    public void setAnnee(int annee) {
        this.annee = annee;
    }

    /**
     * Get the value of nbpiste
     *
     * @return the value of nbpiste
     */
    public int getNbpiste() {
        return nbpiste;
    }

    /**
     * Set the value of nbpiste
     *
     * @param nbpiste new value of nbpiste
     */
    public void setNbpiste(int nbpiste) {
        this.nbpiste = nbpiste;
    }

    /**
     * Get the value of titre
     *
     * @return the value of titre
     */
    public String getTitre() {
        return titre;
    }

    /**
     * Set the value of titre
     *
     * @param titre new value of titre
     */
    public void setTitre(String titre) {
        this.titre = titre;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public Artiste getArtiste() {
        return artiste;
    }

    public void setArtiste(Artiste artiste) {
        this.artiste = artiste;
    }
    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Musique)) {
            return false;
        }
        Musique other = (Musique) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "musique.modeles.musique[ id=" + id + " ]";
    }
    
}
