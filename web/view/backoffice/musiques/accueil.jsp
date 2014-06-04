<%-- 
    Document   : payment
    Created on : 4 avr. 2014, 17:18:06
    Author     : julien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:backoffice>
    <jsp:attribute name="breadcrumb">
        <h2><i class="fa fa-music"></i> Musiques <span>Lister les musiques</span></h2>
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="/tp2webmiage/admin">Accueil</a></li>
                <li class="active">Musiques</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:body>
        <c:if test="${not empty etat}">
            <div class="alert alert-success">
                <c:choose>
                    <c:when test="${etat.equals('ajouter')}">
                        <p>Une musique a été ajoutée</p>
                    </c:when>
                    <c:when test="${etat.equals('modifier')}">
                        <p>La musique a été modifiée</p>
                    </c:when>
                    <c:when test="${etat.equals('supprimer')}">
                        <p>La musique a été supprimée</p>
                    </c:when>
                </c:choose>
            </div>
        </c:if>
        
        <p>
            <a href="/tp2webmiage/admin/musiques/add" class="btn btn-sm btn-primary"><i class="fa fa-plus"></i> Nouvelle musique</a>
        </p>

        <div class="col-lg-6">
            <ul class="pagination">
                <!--                 Définition du nombre d'élément par page -->
                <c:choose>
                    <c:when test="${nbAffiche != 30}">
                        <c:set var="nbElement" value="${param.nbAffiche}">          
                        </c:set>
                    </c:when>
                    <c:otherwise>
                        <c:set var="nbElement" value="30">          
                        </c:set>
                    </c:otherwise>
                </c:choose>

                <!--                 Bouton "précédent" -->
                <c:choose>
                    <c:when test="${page == '1'}">
                        <li><a href="?page=${page}&nbAffiche=${nbElement}">&laquo;</a></li>
                        </c:when>
                        <c:otherwise>
                        <li><a href="?page=${page - 1}&nbAffiche=${nbElement}">&laquo;</a></li>
                        </c:otherwise>
                    </c:choose>
                <!--                 fin bouton "précedent"  -->

                <c:forEach var="entry" begin="1" end="${nbPages}">
                    <li
                        <c:if test="${page.equals(entry)}">
                            class="active"
                        </c:if>
                        ><a href="?page=${entry}&nbAffiche=${nbElement}">${entry}</a></li>
                    </c:forEach>

                <!--                 Bouton suivant -->
                <c:choose>
                    <c:when test="${page.equals(nbPages)}">
                        <li><a href="?page=${page}&nbAffiche=${nbElement}">&raquo;</a></li>
                        </c:when>
                        <c:otherwise>
                        <li><a href="?page=${page + 1}&nbAffiche=${nbElement}">&raquo;</a></li>
                        </c:otherwise>
                    </c:choose>
                <!--                 Fin bouton suivant  -->
            </ul>
        </div>
        <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->  
        <table class="table">  
            <!-- La ligne de titre du tableau des comptes -->  
            <tr>
                <th style="width: 100px;"></th>
                <th><b>Artiste</b></th>
                <th><b>Titre</b></th>
                <th><b>Nb Pistes</b></th>
                <th><b>Annee</b></th>
                <th><b>Genre</b></th>
                <th style="width: 100px;"></th>
            </tr>  

            <!-- Ici on affiche les lignes, une par utilisateur -->  
            <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->  
            <c:set var="total" value="0"/>  

            <c:forEach var="m" items="${requestScope['listeDesMusiques']}">
                <tr>
                    <td><a class="btn btn-sm btn-primary" href="/tp2webmiage/admin/musiques/modifier/${m.id}"><i class="fa fa-cog"></i> Modifier</a></td>
                    <td><a href="/tp2webmiage/admin/artiste/${m.artiste.id}">${m.artiste.nom}</a></td> 
                    <td>${m.titre}</td>
                    <td>${m.nbpiste}</td>
                    <td>${m.annee}</td>
                    <td><a href="/tp2webmiage/admin/musiques?genre=${m.genre.id}">${m.genre.nom}</a></td>
                    <td><a class="btn btn-danger btn-sm" href="/tp2webmiage/admin/musiques/delete/${m.id}"><i class="fa fa-times"></i> Supprimer</a></td>
                </tr>
            </c:forEach>
        </table>
    </jsp:body>
</t:backoffice>
