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
                            <a href="/tp2webmiage/view/frontoffice/profile.jsp">
                                <i class="icon-tag-1"></i>
                                <p>Mon profil</p>
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
                            <a href="./artists.html">
                                <i class="icon-tag-1"></i>
                                <p>Mes abonnements</p>
                            </a>
                            <ul>
                                <li><a href="./artist-single.html">Artist Single</a></li>
                                <li><a href="#">Newest</a></li>
                                <li><a href="#">Popular</a></li>
                            </ul>					
                        </li>
                        <li style="right: 0px; position: absolute;">
                            <ul class="itemList">
                                <li>
                                    <img style="float:left; padding-right:10px" src="images/item1.jpg" width="64" height="64" alt="Item1" /> 
                                    Lorem ipsum dolor<br />
                                    99:-<br />
                                    Read More</li>
                                <li>
                                    <img style="float:left; padding-right:10px" src="images/item1.jpg" width="64" height="64" alt="Item1" /> 
                                    Dolor sit amet<br />
                                    99:-<br />
                                    Read More</li>
                            </ul>
                            <a href="/tp2webmiage/view/frontoffice/panier.jsp">
                                <i class="icon-cart"></i>
                                <p>Mon Panier</p>
                            </a>
                        </li>
                    </ul>
                </nav>
                <div id="header">
                    <c:if test="${user != null}" >
                        <div class="membre_connecte">
                            <c:if test="${user.getNom() == 'Administrateur'}" >
                                <a class="pull-right" href="/tp2webmiage/utilisateurs" style="margin-right: 20px;"><i class="fa fa-sign-out"></i> Accès Backoffice</a>  
                            </c:if>
                            <a class="pull-right" href="/tp2webmiage/logout" style="margin-right: 20px;"><i class="fa fa-sign-out"></i> Déconnexion</a>
                            <a class="pull-right" href="/tp2webmiage/membre" style="margin-right: 20px;">
                                <i class="fa fa-user"></i> ${user.getPrenom()} ${user.getNom()}
                            </a>
                        </div>
                    </c:if>

                    <c:if test="${user == null}" >
                        <a class="pull-right" href="/tp2webmiage/connexion" style="margin-right: 20px;"><i class="fa fa-sign-in"></i> Connexion</a>
                        <a class="pull-right" href="/tp2webmiage/inscription" style="margin-right: 20px;"><i class="fa fa-user"></i> Inscription</a>
                    </c:if>
                </div>
                <!-- ## SEC NAV ## -->
                <nav id="sec-nav">
                    <ul class="clearfix"></ul>
                </nav>

                <!-- ## MOBILE NAV ## -->
                <ul id="mobileNav">
                    <li><a href="#"><i class="icon-menu"></i> Navigation <i class="icon-down-open-big"></i></a>
                        <ul class="clearfix"><li><a href="./albums.html">
                                    <i class="icon-music-1"></i>
                                    <p>Albums</p>
                                </a></li><li><a href="./album-single.html" class="child">&nbsp;- Album Single</a></li><li><a href="#" class="child">&nbsp;- Newest</a></li><li><a href="#" class="child">&nbsp;- Popular</a></li><li><a href="./artists.html">
                                    <i class="icon-user-1"></i>
                                    <p>Artists</p>
                                </a></li><li><a href="./artist-single.html" class="child">&nbsp;- Artist Single</a></li><li><a href="#" class="child">&nbsp;- Newest</a></li><li><a href="#" class="child">&nbsp;- Popular</a></li><li><a href="./events.html">
                                    <i class="icon-calendar-2"></i>
                                    <p>Events</p>
                                </a></li><li><a href="./event-single.html" class="child">&nbsp;- Event Single</a></li><li><a href="#" class="child">&nbsp;- Newest</a></li><li><a href="#" class="child">&nbsp;- Ending Soon</a></li><li><a href="./blog.html">
                                    <i class="icon-book-open"></i>
                                    <p>Blog</p>
                                </a></li><li><a href="./blog-single.html" class="child">&nbsp;- Blog Single</a></li><li><a href="#" class="child">&nbsp;- Newest</a></li><li><a href="#" class="child">&nbsp;- Popular</a></li><li><a href="./gallery.html">
                                    <i class="icon-picture"></i>
                                    <p>Gallery</p>
                                </a></li><li><a href="./gallery.html" class="child">&nbsp;- Newest</a></li><li><a href="./gallery.html" class="child">&nbsp;- Popular</a></li><li><a href="#">
                                    <i class="icon-plus-squared"></i>
                                    <p>Pages</p>
                                </a></li><li><a href="./fullwidth.html" class="child">&nbsp;- Fullwidth</a></li><li><a href="./404.html" class="child">&nbsp;- 404 Error</a></li>
                            <li>
                                <a href="./contact.html">
                                    <i class="icon-email"></i>
                                    <p>Contact</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>

                <div id="logo"><a href="./index.html"><img src="./assets/img/placeholder/logo.png" alt="LOGO"></a></div></header>
        </section>

        <div class="contentpanel">
            <jsp:doBody/>
        </div>

        <script src="/tp2webmiage/ressources/library/jquery/jquery.js"></script>
        <script src="/tp2webmiage/ressources/library/bootstrap/bootstrap.js"></script>
    </body>
</html>