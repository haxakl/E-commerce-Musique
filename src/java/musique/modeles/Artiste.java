/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package musique.modeles;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author julien
 */
@Entity
public class Artiste implements Serializable {
    @OneToMany(mappedBy = "artiste")
    private List<Musique> musiques;
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String nom;
    @Column(length=3000)
    private String resume;
    private String photo;
    private int nbmusique;

    public Artiste() {
    }

    public Artiste(String nom, String resume, String photo){
        this.nom = nom;
        this.resume = resume;
        this.photo = photo;
        this.nbmusique = 0;
    }

    public void incrNbMusique() {
        this.nbmusique++;
    }
    
    public int getNbmusique() {
        return nbmusique;
    }

    public void setNbmusique(int nbmusique) {
        this.nbmusique = nbmusique;
    }

    public List<Musique> getMusiques() {
        return musiques;
    }

    public void setMusiques(List<Musique> musiques) {
        this.musiques = musiques;
    }
    
    public void addMusique(Musique m){
        musiques.add(m);
    }
    
    public void removeMusique(Musique m ){
        musiques.remove(m);
    }
    /**
     * Get the value of photo
     *
     * @return the value of photo
     */
    public String getPhoto() {
        return photo;
    }

    /**
     * Set the value of photo
     *
     * @param photo new value of photo
     */
    public void setPhoto(String photo) {
        this.photo = photo;
    }

    /**
     * Get the value of resume
     *
     * @return the value of resume
     */
    public String getResume() {
        return resume;
    }

    /**
     * Set the value of resume
     *
     * @param resume new value of resume
     */
    public void setResume(String resume) {
        this.resume = resume;
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
        if (!(object instanceof Artiste)) {
            return false;
        }
        Artiste other = (Artiste) object;
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
