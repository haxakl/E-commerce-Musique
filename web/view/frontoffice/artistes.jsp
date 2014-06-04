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

        <div>
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

        <div id="whatever">
            <c:forEach var="a" items="${requestScope['listeDesArtistes']}">
                <div class="item">
                    <img src="http://www.veryicon.com/icon/png/System/User%20task%20report/User%20Anonymous%20Disabled.png" />
                    <img src="${a.photo}" />
                    <div item="${a.id}" class="caption" style="display: none;">
                        <h2>${a.nom}</h2>
                        <p>${a.nbmusique} musiques</p>
                    </div>
                    <div class='legend'>${a.nom}</div>
                </div>
            </c:forEach>
        </div>

        <script src="/tp2webmiage/ressources/library/hoverGrid/hoverGrid.js"></script>
        <script>
            $(document).ready(function() {
                $('#whatever').hoverGrid();
            });
            
            $(".caption").click(function() {
                location = "/tp2webmiage/artistes/" + $(this).attr("item");
            });
        </script>
    </jsp:body>
</t:frontoffice>