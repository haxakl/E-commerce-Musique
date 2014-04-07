<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:template>
    <jsp:attribute name="breadcrumb">
        <h2><i class="fa fa-home"></i> Utilisateurs <span>Ajouter un utilisateur</span></h2>
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
            <h3>Informations</h3>
            <div class="form-group">
                <label for="prenom" class="col-sm-2 control-label">
                    Prénom
                </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="prenom" id="prenom" placeholder="Prénom">
                </div>
            </div>
            <div class="form-group">
                <label for="nom" class="col-sm-2 control-label">
                    Nom
                </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="nom" id="nom" placeholder="Nom">
                </div>
            </div>
            <div class="form-group">
                <label for="login" class="col-sm-2 control-label">
                    <label class="label label-danger">Obligatoire</label> Login
                </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="login" id="login" placeholder="Login" required>
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">
                    <label class="label label-danger">Obligatoire</label> Password
                </label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                </div>
            </div>
            <hr>
            <h3>Adresse</h3>
            <div class="form-group">
                <label for="login" class="col-sm-2 control-label">
                    Ville existante
                </label>
                <div class="col-sm-10">
                    <select class="form-control chosen-select" name="ville_existante" data-placeholder="Choisissez une ville existante">
                        <option value=""></option>
                        <c:forEach var="a" items="${requestScope['listeVilles']}">
                            <option value="${a.ville}">${a.ville}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <h6>ou</h6>
            <div class="form-group">
                <label for="login" class="col-sm-2 control-label">
                    Code Postal
                </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="cp" id="cp" placeholder="Code Postal">
                </div>
            </div>
            <div class="form-group">
                <label for="ville" class="col-sm-2 control-label">
                    Ville
                </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="ville" id="ville" placeholder="Ville">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-9"></div>
                <div class="col-lg-3">
                    <button class="btn btn-success btn-block pull-right">Enregistrer l'utilisateur</button>
                </div>
            </div>
        </form><br/>

        <script>
            // Basic Form
            jQuery(document).ready(function() {
                jQuery(".chosen-select").chosen({'width': '100%', 'white-space': 'nowrap'});

                jQuery("#basicForm").validate({
                    highlight: function(element) {
                        jQuery(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                    },
                    success: function(element) {
                        jQuery(element).closest('.form-group').removeClass('has-error');
                    }
                });
            });
        </script>

    </jsp:body>
</t:template>