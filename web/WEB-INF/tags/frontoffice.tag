<%@tag pageEncoding="UTF-8" %>
<%@attribute name="breadcrumb" fragment="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Golfieri Guillaume Blacas Julien">

        <title>MultiTracksSongs</title>

        <link href="/tp2webmiage/ressources/library/fontawesome/font-awesome.css" rel="stylesheet">
        <link href="/tp2webmiage/ressources/library/bootstrap/bootstrap.css" rel="stylesheet">

        <link href="/tp2webmiage/ressources/library/musiccomposer/systeme.css" rel="stylesheet">

    </head>

    <body class="container">
        <div id="header">
            <c:if test="${user != null}" >
            <div class="membre_connecte">
                <a class="pull-right" href="/tp2webmiage/logout"><i class="fa fa-sign-out"></i> Déconnexoin</a>
                <a class="pull-right" href="/tp2webmiage/membre" style="margin-right: 20px;">
                    <i class="fa fa-user"></i> ${user.getPrenom()} ${user.getNom()}
                </a>
            </div>
            </c:if>
            
            <c:if test="${user == null}" >
            <a class="pull-right" href="/tp2webmiage/connexion"><i class="fa fa-sign-in"></i> Connexion</a>
            <a class="pull-right" href="/tp2webmiage/inscription" style="margin-right: 20px;"><i class="fa fa-user"></i> Inscription</a>
            </c:if>
        </div>

        <div id="menu">
            <ul id="nav">
                <li><a href="/tp2webmiage/">Accueil</a></li>
                <li><a href="/tp2webmiage/musiques">Musiques</a></li>
                <li><a href="/tp2webmiage/abonnement">Abonnement</a></li>
                <li class="pull-right"><a href="/tp2webmiage/panier"><i class="fa fa-shopping-cart"></i> Panier</a></li>
            </ul>
        </div>

        <div class="contentpanel">
            <jsp:doBody/>
        </div>

        <script src="/tp2webmiage/ressources/library/jquery/jquery.js"></script>
        <script src="/tp2webmiage/ressources/library/bootstrap/bootstrap.js"></script>
    </body>
</html>