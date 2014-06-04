package utilisateurs.modeles;

import abonnement.modeles.Abonnement;
import java.io.Serializable;
import java.util.Collection;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import musique.modeles.Musique;

@Entity
public class Utilisateur implements Serializable {

    @ManyToOne(cascade = CascadeType.PERSIST)
    private Adresse adresse;
    private String telephone;
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String prenom;
    private String nom;
    private String login;
    private String email;
    private String password;
    @ManyToMany
    private Collection<Musique> purshased;
    @ManyToOne
    private Abonnement abonnement;
    private int groupe;

    public Utilisateur() {

    }

    public Utilisateur(final String prenom, final String nom, final String login, final String password, final Abonnement abo) {
        this(prenom, nom, login, password, "", abo, 0);
    }

    public Utilisateur(final String prenom, final String nom, final String login, final String password, final String email, final Abonnement unabo, int groupe) {
        this.login = login;
        this.prenom = prenom;
        this.nom = nom;
        this.email = nom;
        this.password = password;
        this.groupe = groupe;
        this.abonnement = unabo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Adresse getAdresse() {
        return adresse;
    }

    public void setAdresse(Adresse adresse) {
        this.adresse = adresse;
    }

    public int getGroupe() {
        return groupe;
    }

    public void setGroupe(int groupe) {
        this.groupe = groupe;
    }

    public boolean isAdmin() {
        return this.groupe == 1;
    }

    public void setAbonnement(Abonnement abonnement) {
        this.abonnement = abonnement;
    }

    public Abonnement getAbonnement() {
        return abonnement;
    }

    public Collection<Musique> getPurshased() {
        return purshased;
    }

    public void setPurshased(Collection<Musique> purshased) {
        this.purshased = purshased;
    }
    
    public void addPurshased(Collection<Musique> purshased) {
        for(Musique msc : purshased){
            this.purshased.add(msc);
        } 
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) id;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Utilisateur)) {
            return false;
        }
        Utilisateur other = (Utilisateur) object;
        return this.id == other.id;
    }

    @Override
    public String toString() {
        return "utilisateurs.modeles.Utilisateur[ id=" + id + " ]";
    }

}
