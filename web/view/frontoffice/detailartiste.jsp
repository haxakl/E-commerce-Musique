<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:frontoffice>
    <jsp:attribute name="breadcrumb">
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="/tp2webmiage/">Accueil</a></li>
                <li><a href="/tp2webmiage/artistes">Artistes</a>
                <li class="active">Détail de l'artiste</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:body>

        <div class="page-header">
            <h3>Détail de l'artiste</h3>
        </div>
        
        <div class="row" style="margin-bottom: 20px;">
            <div class="col-lg-5">
                <img width="95%" src="${artiste.photo}"/>
            </div>
            <div class="col-lg-7">
                ${artiste.resume}
            </div>
        </div>
        
        <table class="table table-striped">  
            <!-- La ligne de titre du tableau des comptes -->  
            <tr>  
                <td><b>Liste des musiques</b></td>
            </tr>  

            <c:forEach var="m" items="${requestScope['listeDesMusiques']}">
                <tr>
                    <td><a href="/tp2webmiage/musiques/${m.id}" style="color:#E90303">${m.titre}</a></td>
                </tr>
                <c:set var="total" value="${total+1}"/>
            </c:forEach>
            <!-- Affichage du solde total dans la dernière ligne du tableau -->  
        </table>

    </jsp:body>
</t:frontoffice>