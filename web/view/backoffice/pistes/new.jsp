<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:backoffice>
    <jsp:attribute name="breadcrumb">
        <h2><i class="fa fa-home"></i> Musique <span>Ajouter une musique</span></h2>
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="/tp2webmiage/admin">Accueil</a></li>
                <li><a href="/tp2webmiage/admin/musiques">Musiques</a></li>
                <li class="active">Ajouter</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:body>
        <form id="basicForm" method="post" class="form-horizontal" role="form">
            <h3>Informations</h3>
            <div class="form-group">
                <label for="artiste" class="col-sm-2 control-label">Artiste</label>
                <div class="col-sm-10">
                    <select name="artiste" class="form-control">
                        <option value="">Aucun artiste</option>
                        <c:forEach var="a" items="${requestScope['listeDesArtistes']}">
                            <option value="${a.id}">${a.nom}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="genre" class="col-sm-2 control-label">Genre</label>
                <div class="col-sm-10">
                    <select name="genre" class="form-control">
                        <option value="">Aucun genre</option>
                        <c:forEach var="g" items="${requestScope['listeDesGenres']}">
                            <option value="${g.id}">${g.nom}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="titre" class="col-sm-2 control-label">Titre</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="titre" id="titre" placeholder="Titre">
                </div>
            </div>
            <div class="form-group">
                <label for="url" class="col-sm-2 control-label">Url</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="url" id="url" placeholder="Url">
                </div>
            </div>
            <div class="form-group">
                <label for="annee" class="col-sm-2 control-label">Année</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" name="annee" id="annee">
                </div>
            </div>

            <div class="row">
                <div class="col-lg-9"></div>
                <div class="col-lg-3">
                    <button class="btn btn-success btn-block pull-right">Ajouter la musique</button>
                </div>
            </div>
        </form><br/>
    </jsp:body>
</t:backoffice>