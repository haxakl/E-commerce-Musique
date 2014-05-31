<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:frontoffice>
    <jsp:attribute name="breadcrumb">
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="index.jsp">Accueil</a></li>
                <li class="active">Musiques</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:body>
        <div class="page-header">
            <h3>Liste des musiques</h3>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <ul class="pagination">
                    <!--                Définition du nombre d'élément par page -->
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
        </div>
        <div class="row">
            <div class="col-lg-3">
                <form action="./search" method="post">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Titre</span>
                            <input type="text" class="form-control" required name="searchtitle">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-3">
                <form action="./search" method="post">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Genre</span>
                            <input type="text" class="form-control" required name="searchgenre">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-3">
                <form action="./search" method="post">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Artiste</span>
                            <input type="text" class="form-control" required name="searchartist">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-3">
                <form action="./search" method="post">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Année</span>
                            <input type="text" class="form-control" required name="searchannee">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->  
        <table class="table table-striped">  
            <!-- La ligne de titre du tableau des comptes -->  
            <tr>  
                <td><b>Artiste</b></td>
                <td><b>Titre</b></td>
                <td><b>Nb Pistes</b></td>
                <td><b>Annee</b></td>
                <td><b>Genre</b></td>
                <td><b>Acheter</b></td>

            </tr>  

            <!-- Ici on affiche les lignes, une par utilisateur -->  
            <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->  
            <c:set var="total" value="0"/>  

            <c:forEach var="m" items="${requestScope['listeDesMusiques']}">
                <tr>
                    <td>${m.artiste.nom}</td> 
                    <td><a href="/tp2webmiage/musiques/${m.id}" style="color:#E90303">${m.titre}</a></td>
                    <td>${m.nbpiste}</td>
                    <td>${m.annee}</td>
                    <td><a href="musiques?genre=${m.genre.id}" style="color:#E90303">${m.genre.nom}</a></td>
                    <td>
                        <a href="/tp2webmiage/panier?idmus=${m.id}" class="btn btn-sm btn-primary"><i class="fa fa-plus"></i> Ajouter au panier</a>
                    </td>
                </tr>
                <c:set var="total" value="${total+1}"/>
            </c:forEach>
            <!-- Affichage du solde total dans la dernière ligne du tableau -->  
            <tr><td><b>TOTAL</b></td><td></td><td></td><td></td><td><b>${total}</b></td><td></td></tr>
        </table>
    </jsp:body>
</t:frontoffice>