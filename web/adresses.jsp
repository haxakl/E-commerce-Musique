<!-- By Julien -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="breadcrumb">
        <h2><i class="fa fa-home"></i> Utilisateurs <span>Lister les utilisateurs</span></h2>
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="index.jsp">Accueil</a></li>
                <li class="active">Utilisateurs</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:body>
        <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->  
        <table class="table">  
            <!-- La ligne de titre du tableau des comptes -->  
            <tr>  
                <td><b>Modifier</b></td>
                <td><b>Login</b></td>
                <td><b>Nom</b></td>
                <td><b>Prénom</b></td>
                <td><b>Ville</b></td>  
                <td><b>Code postal</b></td> 
                <td><b>Supprimer</b></td>
            </tr>  

            <!-- Ici on affiche les lignes, une par utilisateur -->  
            <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->  
            <c:set var="total" value="0"/>  

            <c:forEach var="u" items="${requestScope['listeDesUsers']}">
                <tr>
                    <td><a href="/tp2webmiage/utilisateurs/modify/${u.id}" class="btn btn-primary btn-sm"><i class="fa fa-cog"></i> Modifier</a></td>
                    <td>${u.login}</td>
                    <td>${u.nom}</td>
                    <td>${u.prenom}</td>
                    <td>
                        <a href="ListerAvecAdresse?action=listerUtilisateursParVille&idville=${u.adresse.id}">
                            ${u.adresse.ville}
                        </a>
                    </td>  
                    <td>${u.adresse.codePostal}</td> 
                    <td><a href="/tp2webmiage/utilisateurs/delete/${u.id}" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> Supprimer</a></td>
                    <!-- On compte le nombre de users -->  
                    <c:set var="total" value="${total+1}"/>
                </tr>
            </c:forEach>

            <!-- Affichage du solde total dans la dernière ligne du tableau -->  
            <tr><td><b>TOTAL</b></td><td></td><td></td><td><b>${total}</b></td><td></td></tr>
        </table>
    </jsp:body>
</t:template>