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
        <link href="/tp2webmiage/ressources/library/fontello/fontello.css" rel="stylesheet">
        <link href="/tp2webmiage/ressources/library/fontawesome/font-awesome.css" rel="stylesheet">
        <link href="/tp2webmiage/ressources/library/bootstrap/bootstrap.min.css" rel="stylesheet">

    </head>

    <body>
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

        <aside id="logo-bar">
            <div id="logo"><a href="./index.html"><img src="/tp2webmiage/ressources/logo.png" alt="LOGO"></a></div>
            <div id="ajax-load"></div>
        </aside>
        <section id="page-global">

            <!-- ## NAV HEADER ## -->
            <header id="nav-header" class="clearfix">
                <!-- ## PRIMARY NAV ## -->
                <nav id="primary-nav">
                    <ul class="clearfix">
                        <li>
                            <a href="./artists.html">
                                <i class="icon-tag-1"></i>
                                <p>Mon profil</p>
                            </a>
                        </li>
                        <li>
                            <a href="./albums.html">
                                <i class="icon-music-1"></i>
                                <p>Musiques</p>
                            </a>
                            <ul>
                                <li><a href="./album-single.html">Toutes</a></li>
                                <li><a href="#">Par genre</a></li>
                                <li><a href="#">Par artiste</a></li>
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
                        <li>
                            <a href="./blog.html">
                                <i class="icon-book-open"></i>
                                <p>Blog</p>
                            </a>
                            <ul>
                                <li><a href="./blog-single.html">Blog Single</a></li>
                                <li><a href="#">Newest</a></li>
                                <li><a href="#">Popular</a></li>
                            </ul>					
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-plus-squared"></i>
                                <p>Pages</p>
                            </a>
                            <ul>
                                <li><a href="./fullwidth.html">Fullwidth</a></li>
                                <li><a href="./404.html">404 Error</a></li>
                            </ul>					
                        </li>				
                        <li>
                            <a href="./contact.html">
                                <i class="icon-email"></i>
                                <p>Contact</p>
                            </a>
                        </li>
                        <li style="right: 0px; position: absolute;">
                            <a href="./contact.html">
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
                                </a></li><li><a href="./fullwidth.html" class="child">&nbsp;- Fullwidth</a></li><li><a href="./404.html" class="child">&nbsp;- 404 Error</a></li><li><a href="./contact.html">
                                    <i class="icon-email"></i>
                                    <p>Contact</p>
                                </a></li></ul>
                    </li>
                </ul>

                <div id="logo"><a href="./index.html"><img src="./assets/img/placeholder/logo.png" alt="LOGO"></a></div></header>
            <!-- ## NAV HEADER END ## -->

            <!-- ## MUSIC ## -->
            <div id="music">
                <div id="jquery_jplayer_1" class="jp-jplayer" style="width: 0px; height: 0px;"><img id="jp_poster_0" style="width: 0px; height: 0px; display: none;"><audio id="jp_audio_0" preload="metadata" src="http://3.s3.envato.com/files/5513511/preview.mp3"></audio></div>
                <div id="jp_interface_1">
                    <a href="#" class="jp-play" style="display: inline;"><i class="icon-play"></i> Play</a>
                    <a href="#" class="jp-pause" style="display: none;"><i class="icon-pause"></i> Pause</a>
                    <a href="#" class="music-title">- Bang Bang by David Guetta</a>
                </div>
            </div>	
            <!-- ## MUSIC END ## -->


            <!--
                         FEATURE BAR ## 
                        <section id="featuredBar">
                            <div class="container">
                                <ul class="clearfix">	
                                    <li>
                                        <a href="#">
                                            <i class="icon-music-1"></i><p><span>Latest Album : </span>Wake me up by Avicii</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="icon-calendar-2"></i><p><span>Upcoming Event : </span>Sunburn Arena 8, Mumbai</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="icon-book-open"></i><p><span>Latest News : </span>Lorem ipsum dolor sit amet</p>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </section>-->
            <!-- FEATURE BAR END ## -->	

        </section>
        <ul id="supersized" class="quality" style="visibility: visible;"><li class="slide-0 prevslide" style="visibility: visible; opacity: 1;"><a target="_blank"><img src="http://themeforest.quadcodes.com/site/musicvent/assets/img/placeholder/full-bg-2.jpg" style="width: 1366px; left: 0px; top: -123.5px; height: 846.92px;"></a></li><li class="slide-1 activeslide" style="visibility: visible; opacity: 1;"><a target="_blank"><img src="http://themeforest.quadcodes.com/site/musicvent/assets/img/placeholder/full-bg-4.jpg" style="width: 1366px; height: 860.58px; left: 0px; top: -130.5px;"></a></li></ul>
        <!--        <div id="menu">
                    <ul id="nav">
                        <li><a href="/tp2webmiage/">Accueil</a></li>
                        <li><a href="/tp2webmiage/musiques">Musiques</a></li>
                        <li><a href="/tp2webmiage/abonnement">Abonnement</a></li>
                        <li class="pull-right"><a href="/tp2webmiage/panier"><i class="fa fa-shopping-cart"></i> Panier</a></li>
                    </ul>
                </div>-->

        <div class="contentpanel">
            <jsp:doBody/>
        </div>

        <script src="/tp2webmiage/ressources/library/jquery/jquery.js"></script>
        <script src="/tp2webmiage/ressources/library/bootstrap/bootstrap.js"></script>
    </body>
</html>