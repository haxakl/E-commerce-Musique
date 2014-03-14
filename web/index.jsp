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

    <body class="signin">

        <!-- Preloader -->
        <div id="preloader">
            <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
        </div>

    <section>
        <div class="signinpanel">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <form method="post">
                        <h4 class="nomargin">Connexion</h4><br/>
                        <p class="mt5 mb20">Connexion pour accéder à l'interface administrateur.</p>
                        <p><a href="connecte.jsp">Court-circuité vers l'interface admin</a></p>

                        <input type="text" class="form-control uname" placeholder="Username" />
                        <input type="password" class="form-control pword" placeholder="Password" /><br/>
                        <button class="btn btn-success btn-block">Accéder</button>

                    </form>
                </div>
            </div>
        </div>
    </section>


    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/modernizr.min.js"></script>
    <script src="js/retina.min.js"></script>

    <script src="js/custom.js"></script>
</body>
</html>
