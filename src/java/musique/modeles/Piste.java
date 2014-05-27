/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package musique.modeles;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 *
 * @author julien
 */
@Entity
public class Piste implements Serializable {
    @ManyToOne
    @JoinColumn(name = "pistes", referencedColumnName = "id")
    private Musique musique;
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String nom;

    public Piste() {
    }

    public Piste(Musique musique, String nom){
        this.musique = musique;
        this.nom = nom;
    }

    public Musique getMusique() {
        return musique;
    }

    public void setMusique(Musique musique) {
        this.musique = musique;
    }

    /**
     * Get the value of nom
     *
     * @return the value of nom
     */
    public String getNom() {
        return nom;
    }

    /**
     * Set the value of nom
     *
     * @param nom new value of nom
     */
    public void setNom(String nom) {
        this.nom = nom;
    }
 
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
        if (!(object instanceof Piste)) {
            return false;
        }
        Piste other = (Piste) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "musique.modeles.artiste[ id=" + id + " ]";
    }
    
}
