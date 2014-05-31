package utilisateurs.modeles;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Utilisateur implements Serializable {

    @ManyToOne(cascade = CascadeType.PERSIST)
    private Adresse adresse;
    @OneToOne(cascade = CascadeType.PERSIST)
    private Telephone telephone;
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String prenom;
    private String nom;
    private String login;
    private String email;
    private String password;

    private static enum type_abo {
        NONE, BASIC, LIMITED, UNLIMITED
    };
    private String current_abo;
    private int groupe;

    public Utilisateur() {

    }

    public Utilisateur(final String prenom, final String nom, final String login, final String password) {
        this(prenom, nom, login, password, "", type_abo.NONE.name(), 0);
    }

    public Utilisateur(final String prenom, final String nom, final String login, final String password, final String email, final String unabo, int groupe) {
        this.login = login;
        this.prenom = prenom;
        this.nom = nom;
        this.email = nom;
        this.password = password;
        this.groupe = groupe;
        this.current_abo = unabo;
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

    public Telephone getTelephone() {
        return telephone;
    }

    public void setTelephone(Telephone telephone) {
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

    public String getCurrent_abo() {
        return current_abo;
    }

    public void setCurrent_abo(String current_abo) {
        this.current_abo = current_abo;
    }

    public boolean isAdmin() {
        if (this.groupe == 1) {
            return true;
        } else {
            return false;
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
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "utilisateurs.modeles.Utilisateur[ id=" + id + " ]";
    }

}
