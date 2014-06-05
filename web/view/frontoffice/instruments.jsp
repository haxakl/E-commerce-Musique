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
        <div class="row">
            <div id="whatever">
                <div class="col-md-3">
                    <div class="item">
                        <img src="http://thehub.musiciansfriend.com/images/electronic-drums-guide/pearl-e-pro-live-electronic-acoustic-drum-set-artisan-ii.jpg" />
                        <div item="drums" class="caption" style="display: none;">
                            <h2>Drums</h2>
                        </div>
                        <div class='legend'>Drums</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="item">
                        <img src="http://www.guitar-warehouse.ie/prodimgs/internet/TEB-044%20Bk_Close.jpg" />
                        <div item="bass" class="caption" style="display: none;">
                            <h2>Bass</h2>
                        </div>
                        <div class='legend'>Bass</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="item">
                        <img src="http://images.thomann.de/pics/prod/153725.jpg" />
                        <div item="snare" class="caption" style="display: none;">
                            <h2>Snare</h2>
                        </div>
                        <div class='legend'>snare</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="item">
                        <img src="http://static.bootic.com/_pictures/1512803/zildjian-a-custom-rezo-hi-hats-15.jpg" />
                        <div item="hi-hat" class="caption" style="display: none;">
                            <h2>Hi-hat</h2>
                        </div>
                        <div class='legend'>Hi-hat</div>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${not empty requestScope['listeDesMusiques']}">
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
        </c:if>
        <script src="/tp2webmiage/ressources/library/hoverGrid/hoverGrid.js"></script>
        <script>
            $(document).ready(function() {
                $('#whatever').hoverGrid();
            });

            $(".caption").click(function() {
                location = "/tp2webmiage/instruments/" + $(this).attr("item");
            });
        </script>

    </jsp:body>
</t:frontoffice>
