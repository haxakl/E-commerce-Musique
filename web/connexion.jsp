<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Golfieri Guillaume Blacas Julien">

        <title>Connexion à l'interface administrateur</title>

        <link href="css/style.default.css" rel="stylesheet">
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
                        <c:set var="message" scope="session" value="${requestScope['message']}"/>
                        <c:if test="${message.equals('invalide')}">
                        <div class="alert alert-danger">
                            Mauvais login/mot de passe
                        </div>
                        </c:if>
                        <c:if test="${message.equals('deconnexion')}">
                        <div class="alert alert-success">
                            Vous vous êtes bien deconnecté.
                        </div>
                        </c:if>
                        <p class="mt5 mb20">Connexion pour accéder à l'interface administrateur.</p>

                        <input type="text" name="login" class="form-control uname" placeholder="Login" />
                        <input type="password" name="password" class="form-control pword" placeholder="Password" /><br/>
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
