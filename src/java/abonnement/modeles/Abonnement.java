package abonnement.modeles;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import utilisateurs.modeles.Utilisateur;

/**
 *
 * @author julien
 */
@Entity
public class Abonnement implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private int nbmusicallowed;
    @OneToMany(mappedBy = "abonnement")
    private Collection<Utilisateur> utilisateur;
    
    public Abonnement() {
    }

    public Abonnement(int nbmusicallowed, String name) {
        this.nbmusicallowed = nbmusicallowed;
        this.name = name;
    }
    
    public int getNbmusicallowed() {
        return nbmusicallowed;
    }

    public void setNbmusicallowed(int nbmusicallowed) {
        this.nbmusicallowed = nbmusicallowed;
    }

    public Collection<Utilisateur> getUtilisateur() {
        return utilisateur;
    }
    
    public void addUtilisateur(Utilisateur user){
        utilisateur.add(user);
    }

    public void setUtilisateur(Collection<Utilisateur> utilisateur) {
        this.utilisateur = utilisateur;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
        if (!(object instanceof Abonnement)) {
            return false;
        }
        Abonnement other = (Abonnement) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "abonnement.Abonnement[ id=" + id + " ]";
    }

}
