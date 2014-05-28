<%@tag pageEncoding="UTF-8" %>
<%@attribute name="breadcrumb" fragment="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="/tp2webmiage/images/favicon.png" type="image/png">

        <title>Administration</title>

        <link href="/tp2webmiage/ressources/library/musiccomposer/style.default.css" rel="stylesheet">
        
        <script src="/tp2webmiage/ressources/library/jquery/jquery-1.10.2.min.js"></script>
    </head>
    <body>

        <!-- Preloader -->
        <div id="preloader">
            <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
        </div>

        <div class="leftpanel">

            <div class="logopanel">
                <h1>Administration</h1>
            </div><!-- logopanel -->

            <div class="leftpanelinner">

                <h5 class="sidebartitle">Navigation</h5>
                <ul class="nav nav-pills nav-stacked nav-bracket">
                    <li><a href="/tp2webmiage/utilisateurs"><i class="fa fa-user"></i> <span>Utilisateurs</span></a></li>
                    <li><a href="/tp2webmiage/musiques"><i class="fa fa-music"></i> <span>Musiques</span></a></li>
                </ul>

            </div><!-- leftpanelinner -->
        </div><!-- leftpanel -->

        <div class="mainpanel">
            <div class="headerbar">
                <a class="menutoggle"><i class="fa fa-bars"></i></a>

                <div class="header-right">
                    <ul class="headermenu">
                        <li>
                            <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                    ${user.getPrenom()} ${user.getNom()}
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                                    <li><a href="/tp2webmiage/logout"><i class="glyphicon glyphicon-log-out"></i> Déconnexion</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div><!-- header-right -->

            </div><!-- headerbar -->

            <div class="pageheader">
                <jsp:invoke fragment="breadcrumb"/>
            </div>

            <div class="contentpanel">
                <jsp:doBody/>
            </div>

        </div><!-- Main Panel -->
        <script src="/tp2webmiage/ressources/library/jquery/jquery-1.10.2.min.js"></script>
        <script src="/tp2webmiage/ressources/library/jquery/jquery-migrate-1.2.1.min.js"></script>
        <script src="/tp2webmiage/ressources/library/jquery/jquery.validate.min.js"></script>
        <script src="/tp2webmiage/ressources/library/jquery/bootstrap.min.js"></script>
        <script src="/tp2webmiage/ressources/library/jquery/modernizr.min.js"></script>
        <script src="/tp2webmiage/ressources/library/jquery/jquery.sparkline.min.js"></script>
        <script src="/tp2webmiage/ressources/library/jquery/toggles.min.js"></script>
        <script src="/tp2webmiage/ressources/library/jquery/retina.min.js"></script>
        <script src="/tp2webmiage/ressources/library/jquery/jquery.cookies.js"></script>
        <script src="/tp2webmiage/ressources/library/jquery/custom.js"></script>
        <script src="/tp2webmiage/ressources/library/jquery/jquery.maskedinput.min.js"></script>
        <script src="/tp2webmiage/ressources/library/jquery/chosen.jquery.min.js"></script>
    </body>
</html>