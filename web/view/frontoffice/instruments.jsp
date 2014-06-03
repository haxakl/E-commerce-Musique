<%-- 
    Document   : instruments
    Created on : 3 juin 2014, 17:00:16
    Author     : julien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>

<t:frontoffice>
    <jsp:attribute name="breadcrumb">
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="index.jsp">Accueil</a></li>
                <li class="active">Instruments</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:body>
        <div class="page-header">
            <h3>Liste des musiques par instrument <c:if test="${filtername != null}">"${filtername}"</c:if></h3>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Zone qui affiche les musiques si le paramètre action vaut listerMusiques -->  
                    <table class="table table-striped">  
                        <thead>
                            <!-- La ligne de titre du tableau des comptes -->  
                            <tr>
                                <td><b>Artiste</b></td>
                                <td><b>Titre</b></td>
                            </tr>  
                        </thead>
                        <tbody>
                        <c:forEach var="m" items="${requestScope['listeDesMusiques']}">
                            <tr>
                                <td><a href="/tp2webmiage/musiques/artistes/${m.artiste.id}" style="color:#E90303">${m.artiste.nom}</a></td>
                                <td><a href="/tp2webmiage/musiques/${m.id}" style="color:#E90303">${m.titre}</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </jsp:body>
</t:frontoffice>
