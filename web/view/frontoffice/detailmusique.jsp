<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:frontoffice>
    <jsp:attribute name="breadcrumb">
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="/tp2webmiage/">Accueil</a></li>
                <li><a href="/tp2webmiage/musiques">Musiques</a>
                <li class="active">Détail de la musique</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:body>

        <div class="page-header">
            <h3>Détail de la musique</h3>
        </div>
        
        <table class="table table-striped">  
            <!-- La ligne de titre du tableau des comptes -->  
            <tr>  
                <td><b>Nom</b></td>
                <td><b>Note</b></td>
            </tr>  

            <c:forEach var="m" items="${requestScope['listeDesPistes']}">
                <tr>
                    <td>${m.nom}</td>
                    <td>
                        <c:forEach var="entry" begin="0" end="4">
                            <c:choose>
                                <c:when test="${entry < m.note}">
                                    <i class="fa fa-star"></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="fa fa-star-o"></i>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </td>
                </tr>
                <c:set var="total" value="${total+1}"/>
            </c:forEach>
            <!-- Affichage du solde total dans la dernière ligne du tableau -->  
        </table>

    </jsp:body>
</t:frontoffice>