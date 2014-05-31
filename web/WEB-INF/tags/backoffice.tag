<%@tag pageEncoding="UTF-8" %>
<%@attribute name="breadcrumb" fragment="true" %>
<%@attribute name="sans_corps" fragment="true" %>

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
        <link href="/tp2webmiage/ressources/library/fontawesome/font-awesome.css" rel="stylesheet">
        <link href="/tp2webmiage/ressources/library/fontello/fontello.css" rel="stylesheet">
        <link href="/tp2webmiage/ressources/library/bootstrap/bootsrap-override.css" rel="stylesheet">
        
        <script src="/tp2webmiage/ressources/library/jquery/jquery.js"></script>
    </head>
    <body>
        <div class="leftpanel">
            <div class="logopanel">
                <h1>Administration</h1>
            </div><!-- logopanel -->
            <div class="leftpanelinner">
                <h5 class="sidebartitle">Navigation</h5>
                <ul class="nav nav-pills nav-stacked nav-bracket">
                    <li><a href="/tp2webmiage/admin/utilisateurs"><i class="fa fa-user"></i> <span>Utilisateurs</span></a></li>
                    <li><a href="/tp2webmiage/admin/musiques"><i class="fa fa-music"></i> <span>Musiques</span></a></li>
                    <li><a href="/tp2webmiage/"><i class="fa fa-arrow-circle-left"></i> <span>Retour au client</span></a></li>
                </ul>
            </div>
        </div>

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
                                    <li><a href="/tp2webmiage/logout"><i class="fa fa-sign-out"></i> Déconnexion</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="pageheader">
                <jsp:invoke fragment="breadcrumb"/>
            </div>

            <div class="contentpanel">
                <jsp:doBody/>
            </div>

        <script src="/tp2webmiage/ressources/library/jquery/bootstrap.min.js"></script>
        <script src="/tp2webmiage/ressources/library/jquery/jquery-ui-1.10.3.min.js"></script>
        <script src="/tp2webmiage/ressources/library/jquery/toggles.min.js"></script>
    </body>
</html>