<%@tag pageEncoding="UTF-8" %>
<%@attribute name="breadcrumb" fragment="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="images/favicon.png" type="image/png">

        <title>Administration</title>

        <link href="/tp2webmiage/css/style.default.css" rel="stylesheet">
        <link href="/tp2webmiage/css/style.css" rel="stylesheet">
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

        <script src="/tp2webmiage/js/jquery-1.10.2.min.js"></script>
        <script src="/tp2webmiage/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="/tp2webmiage/js/bootstrap.min.js"></script>
        <script src="/tp2webmiage/js/modernizr.min.js"></script>
        <script src="/tp2webmiage/js/jquery.sparkline.min.js"></script>
        <script src="/tp2webmiage/js/toggles.min.js"></script>
        <script src="/tp2webmiage/js/retina.min.js"></script>
        <script src="/tp2webmiage/js/jquery.cookies.js"></script>
        <script src="/tp2webmiage/js/custom.js"></script>
    </body>
</html>