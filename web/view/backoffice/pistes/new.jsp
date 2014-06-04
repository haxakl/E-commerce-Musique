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
                <label for="musique" class="col-sm-2 control-label">Musique</label>
                <div class="col-sm-10">
                    <select name="musique" class="form-control">
                        <option value="">Aucune musique</option>
                        <c:forEach var="m" items="${requestScope['listeDesMusiques']}">
                            <option value="${m.id}">${m.titre}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="nom" class="col-sm-2 control-label">Nom</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="nom" id="titre" placeholder="Nom">
                </div>
            </div>
            <div class="form-group">
                <label for="annee" class="col-sm-2 control-label">Difficulté</label>
                <div class="col-sm-10">
                    <select class="form-control">
                        <%--<c:for var="0" items="${requestScope['listeDesMusiques']}">--%>
                            <!--<option value="${m.id}">${m.titre}</option>-->
                        <%--</c:forEach>--%>
                    </select>
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