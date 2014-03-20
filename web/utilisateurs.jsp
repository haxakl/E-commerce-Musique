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

                <h5 class="sidebartitle">Navigation</h5>
                <ul class="nav nav-pills nav-stacked nav-bracket">
                    <li><a href="utilisateurs"><i class="fa fa-user"></i> <span>Utilisateurs</span></a></li>
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
                                    <li><a href="compte"><i class="glyphicon glyphicon-cog"></i> Compte</a></li>
                                    <li><a href="index.jsp"><i class="glyphicon glyphicon-log-out"></i> Déconnexion</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div><!-- header-right -->

            </div><!-- headerbar -->

            <div class="pageheader">
                <h2><i class="fa fa-home"></i> Utilisateurs <span>Lister les utilisateurs</span></h2>
                <div class="breadcrumb-wrapper">
                    <span class="label">Vous êtes ici</span>
                    <ol class="breadcrumb">
                        <li class="active">Accueil</li>
                    </ol>
                </div>
            </div>

            <div class="contentpanel">
                
                <a href="utilisateurs/new" class="btn btn-primary btn-sm">Ajouter un utilisateur</a>
                
                <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->  
                <table class="table">  
                    <!-- La ligne de titre du tableau des comptes -->  
                    <tr>  
                        <td><b>Login</b></td>  
                        <td><b>Nom</b></td>  
                        <td><b>Prénom</b></td>  
                    </tr>  

                    <!-- Ici on affiche les lignes, une par utilisateur -->  
                    <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->  
                    <c:set var="total" value="0"/>  

                    <c:forEach var="u" items="${requestScope['listeDesUsers']}">  
                        <tr>  
                            <td>${u.login}</td>  
                            <td>${u.firstname}</td>  
                            <td>${u.lastname}</td>  
                            <!-- On compte le nombre de users -->  
                            <c:set var="total" value="${total+1}"/>  
                        </tr>  
                    </c:forEach>  

                    <!-- Affichage du solde total dans la dernière ligne du tableau -->  
                    <tr><td><b>TOTAL</b></td><td></td><td><b>${total}</b></td><td></td></tr>  
                </table>  
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
