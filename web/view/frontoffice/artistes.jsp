<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:frontoffice>
    <jsp:attribute name="breadcrumb">
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="index.jsp">Accueil</a></li>
                <li class="active">Aristes</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:body>
        <div class="page-header">
            <h3>Liste des artistes</h3>
        </div>

        <div class="col-lg-6">
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

        <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->  
        <table class="table table-striped">
            <thead>
                <tr>  
                    <td></td>
                    <td><b>Artiste</b></td>
                    <td><b>Description</b></td>
                    <td><b>Nombre de musiques</b></td>
                </tr>
            </thead>

            <tbody>
                <!-- Ici on affiche les lignes, une par utilisateur -->  
                <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->  
                <c:set var="total" value="0"/>  
                <c:forEach var="a" items="${requestScope['listeDesArtistes']}">
                    <tr>
                        <td class="text-center"><img height="100" src="${a.photo}"/></td>
                        <td><a href="/tp2webmiage/artistes/${a.id}" style="color:#E90303">${a.nom}</a></td>
                        <td>${a.resume}</td>
                        <td>${a.nbmusique}</td>
                    </tr>
                    <c:set var="total" value="${total+1}"/>
                </c:forEach>
            </tbody>
            <!-- Affichage du solde total dans la dernière ligne du tableau -->  
            <tfoot>
                <tr>
                    <td colspan="2"><b>TOTAL</b>
                    <td><b>${total}</b></td>
                </tr>
            </tfoot>
        </table>
    </jsp:body>
</t:frontoffice>