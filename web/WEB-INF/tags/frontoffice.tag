<%@tag pageEncoding="UTF-8" %>
<%@attribute name="breadcrumb" fragment="true" %>
<%@attribute name="sans_corps" fragment="true" %>
<%@attribute name="script" fragment="true" %>
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

        <link href="/tp2webmiage/ressources/library/musiccomposer/theme.css" rel="stylesheet">
        <link href="/tp2webmiage/ressources/library/musiccomposer/systeme.css" rel="stylesheet">
        <link href="/tp2webmiage/ressources/library/fontello/fontello.css" rel="stylesheet">
        <link href="/tp2webmiage/ressources/library/fontawesome/font-awesome.css" rel="stylesheet">
        <link href="/tp2webmiage/ressources/library/bootstrap/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
        <aside id="logo-bar">
            <div id="logo">
                <a href="/tp2webmiage/">
                    <img src="/tp2webmiage/ressources/logo.png" alt="LOGO">
                </a>
            </div>
        </aside>
        <section id="page-global">

            <!-- ## NAV HEADER ## -->
            <header id="nav-header" class="clearfix">
                <!-- ## PRIMARY NAV ## -->
                <nav id="primary-nav">
                    <ul class="clearfix">
                        <li>
                            <a href="/tp2webmiage/artistes">
                                <i class="icon-cd"></i>
                                <p>Artistes</p>
                            </a>
                        </li>
                        <li>
                            <a href="/tp2webmiage/musiques">
                                <i class="icon-music-1"></i>
                                <p>Musiques</p>
                            </a>
                            <ul>
                                <li><a href="/tp2webmiage/musiques">Toutes</a></li>
                                <li><a href="/tp2webmiage/musiques?order=genre">Par genre</a></li>
                                <li><a href="/tp2webmiage/musiques?order=artiste">Par artiste</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/tp2webmiage/abonnement">
                                <i class="icon-tag-1"></i>
                                <p>Mes abonnements</p>
                            </a>
                        </li>
                        <li style='float: right; margin-right: 200px;'>
                            <c:if test="${user != null}" >
                                <c:if test="${user.getNom() == 'Administrateur'}" >
                                    <a class="pull-right" href="/tp2webmiage/utilisateurs">
                                        <i class="fa fa-sign-out"></i> <p>Accès Backoffice</p>
                                    </a>
                                </li>
                                <li style='float: right;'>
                                </c:if>

                                <a class="pull-right" href="/tp2webmiage/logout">
                                    <i class="fa fa-sign-out"></i> <p>Déconnexion</p>
                                </a>
                            </li>
                            <li  style='float: right;'>
                                <a class="pull-right" href="/tp2webmiage/profile">
                                    <i class="fa fa-user"></i> <p>Mon profil</p>
                                </a>
                            </li>
                        </c:if>

                        <c:if test="${user == null}" >
                            <a href="/tp2webmiage/inscription">
                                <i class="fa fa-3x fa-user"></i>
                                <p>Inscription</p>
                            </a>
                            </li>
                            <li  style='float: right;'>
                                <a href="/tp2webmiage/connexion">
                                    <i class="fa fa-sign-in"></i>
                                    <p>Connexion</p>
                                </a>
                            </c:if>
                        </li>
                        <li style="right: 0px; position: absolute;">
                            <ul class="itemList">
                                <c:choose>
                                    <c:when test="${panier != null}">
                                        <c:if test="${panier.isEmpty()}" >
                                            <li>
                                                Aucun objet dans votre panier.
                                            </li>
                                        </c:if>
                                    </c:when>
                                    <c:otherwise>
                                        <li>Aucun objet dans votre panier.</li>
                                        </c:otherwise>
                                    </c:choose>
                            </ul>
                            <a href="/tp2webmiage/panier">
                                <i class="icon-cart"></i>
                                <p>Mon Panier</p>
                            </a>
                        </li>
                    </ul>
                </nav>

                <!-- ## SEC NAV ## -->
                <nav id="sec-nav">
                    <ul class="clearfix"></ul>
                </nav>

                <div id="logo"><a href="./index.html"><img src="./assets/img/placeholder/logo.png" alt="LOGO"></a></div></header>
        </section>

        <div class="contentpanel">
            <jsp:invoke fragment="sans_corps"/>

            <c:if test="${accueil == null}" >
                <div class="corps">
                    <div class="container">
                        <jsp:invoke fragment="breadcrumb"/>

                        <jsp:doBody/>
                    </div>
                </div>
            </c:if>
        </div>

        <script src="/tp2webmiage/ressources/library/jquery/jquery.js"></script>
        <script src="/tp2webmiage/ressources/library/bootstrap/bootstrap.js"></script>
        <script src="/tp2webmiage/ressources/library/mixit-up/jquery.mixitup.js"></script>

        <jsp:invoke fragment="script"/>
    </body>
</html>