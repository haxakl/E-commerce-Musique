<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:backoffice>
    <jsp:attribute name="breadcrumb">
        <h2><i class="fa fa-home"></i> Utilisateurs <span>Modifier un utilisateur</span></h2>
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="index.jsp">Accueil</a></li>
                <li class="active">Utilisateurs</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:body>
        <form method="post" class="form-horizontal" role="form">
            <div class="form-group">
                <label for="prenom" class="col-sm-2 control-label">Prénom</label>
                <div class="col-sm-10">
                    <input type="text" value="${modif_user.prenom}" class="form-control" name="prenom" id="prenom" placeholder="Prénom">
                </div>
            </div>
            <div class="form-group">
                <label for="nom" class="col-sm-2 control-label">Nom</label>
                <div class="col-sm-10">
                    <input type="text" value="${modif_user.nom}" class="form-control" name="nom" id="nom" placeholder="Nom">
                </div>
            </div>
            <div class="form-group">
                <label for="login" class="col-sm-2 control-label">Login</label>
                <div class="col-sm-10">
                    <input type="text" value="${modif_user.login}" class="form-control" name="login" id="login" placeholder="Prénom">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">Password</label>
                <div class="col-sm-10">
                    <input type="password" value="${modif_user.password}" class="form-control" name="password" id="password" placeholder="Password">
                </div>
            </div>
            
            <button class="btn btn-success btn-block pull-right">Modifier l'utilisateur</button>
        </form><br/>

    </jsp:body>
</t:backoffice>