<%-- 
    Document   : payment
    Created on : 4 avr. 2014, 17:18:06
    Author     : julien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="breadcrumb">
        <h2><i class="fa fa-music"></i> Musiques <span>Lister les musiques</span></h2>
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="index.jsp">Accueil</a></li>
                <li class="active">Musiques</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:body>
      <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->  
            <table class="table">  
                <!-- La ligne de titre du tableau des comptes -->  
                <tr>  
                    <td><b>Artiste</b></td>
                    <td><b>Titre</b></td>
                    <td><b>Nb Pistes</b></td>
                    <td><b>Annee</b></td>
                    <td><b>Genre</b></td>
                    <td><b>URL</b></td>
                    <td><b>Acheter</b></td>

                </tr>  

                <!-- Ici on affiche les lignes, une par utilisateur -->  
                <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->  
            <c:set var="total" value="0"/>  

            <c:forEach var="m" items="${requestScope['listeDesMusiques']}">
                <tr>
                    <td>${m.artiste.nom}</td> 
                    <td>${m.titre}</td>
                    <td>${m.nbpiste}</td>
                    <td>${m.annee}</td>
                    <td><a href="musiques?genre=${m.genre.id}">${m.genre.nom}</a></td>
                    <td>${m.url}</td> 
                    <td><a class="btn btn-primary"><span class="glyphicon glyphicon-shopping-cart"></span></a></td>
                </tr>
            </c:forEach>
        </table>  
    </jsp:body>
</t:template>
