<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="images/favicon.png" type="image/png">

        <title>Bracket Responsive Bootstrap3 Admin</title>

        <link href="css/style.default.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <!-- Preloader -->
        <div id="preloader">
            <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
        </div>

    <section>

        <div class="leftpanel">

            <div class="logopanel">
                <h1>Administrateur</h1>
            </div><!-- logopanel -->

            <div class="leftpanelinner">

                <!-- This is only visible to small devices -->
                <div class="visible-xs hidden-sm hidden-md hidden-lg">   
                    <div class="media userlogged">
                        <img alt="" src="images/photos/loggeduser.png" class="media-object">
                        <div class="media-body">
                            <h4>John Doe</h4>
                            <span>"Life is so..."</span>
                        </div>
                    </div>

                    <h5 class="sidebartitle actitle">Account</h5>
                    <ul class="nav nav-pills nav-stacked nav-bracket mb30">
                        <li><a href="profile.html"><i class="fa fa-user"></i> <span>Profile</span></a></li>
                        <li><a href="#"><i class="fa fa-cog"></i> <span>Account Settings</span></a></li>
                        <li><a href="#"><i class="fa fa-question-circle"></i> <span>Help</span></a></li>
                        <li><a href="signout.html"><i class="fa fa-sign-out"></i> <span>Sign Out</span></a></li>
                    </ul>
                </div>

                <h5 class="sidebartitle">Navigation</h5>
                <ul class="nav nav-pills nav-stacked nav-bracket">
                    <li><a href="utilisateurs.jsp"><i class="fa fa-user"></i> <span>Utilisateurs</span></a></li>
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
                                    John Doe
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                                    <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Compte</a></li>
                                    <li><a href="signin.html"><i class="glyphicon glyphicon-log-out"></i> Déconnexion</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div><!-- header-right -->

            </div><!-- headerbar -->

            <div class="pageheader">
                <h2><i class="fa fa-home"></i> Accueil <span>Page de départ</span></h2>
                <div class="breadcrumb-wrapper">
                    <span class="label">Vous êtes ici</span>
                    <ol class="breadcrumb">
                        <li class="active">Accueil</li>
                    </ol>
                </div>
            </div>

            <div class="contentpanel">
                Première page
            </div>

        </div><!-- mainpanel -->

    </section>

    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/modernizr.min.js"></script>
    <script src="js/jquery.sparkline.min.js"></script>
    <script src="js/toggles.min.js"></script>
    <script src="js/retina.min.js"></script>
    <script src="js/jquery.cookies.js"></script>

    <script src="js/custom.js"></script>

</body>
</html>
