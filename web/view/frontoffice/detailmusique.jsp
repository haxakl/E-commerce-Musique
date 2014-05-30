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

    </jsp:body>
</t:frontoffice>