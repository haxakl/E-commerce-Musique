<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:backoffice>
    <jsp:attribute name="breadcrumb">
        <h2><i class="fa fa-home"></i> Artiste <span>Ajouter un artiste</span></h2>
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="/tp2webmiage/admin">Accueil</a></li>
                <li><a href="/tp2webmiage/admin/artistes">Artistes</a></li>
                <li class="active">Ajouter</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:body>
        <form id="basicForm" method="post" class="form-horizontal" role="form">
            <h3>Informations</h3>
            <div class="form-group">
                <label for="nom" class="col-sm-2 control-label">Nom</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="nom" id="nom" placeholder="Nom">
                </div>
            </div>
            <div class="form-group">
                <label for="description" class="col-sm-2 control-label">Description</label>
                <div class="col-sm-10">
                    <textarea type="text" class="form-control" name="description" id="description" placeholder="Description de l'artiste"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="photo" class="col-sm-2 control-label">Url Photo</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="photo" id="photo" placeholder="Url de la photo"/>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-9"></div>
                <div class="col-lg-3">
                    <button class="btn btn-success btn-block pull-right">Ajouter l'artiste</button>
                </div>
            </div>
        </form><br/>
    </jsp:body>
</t:backoffice>