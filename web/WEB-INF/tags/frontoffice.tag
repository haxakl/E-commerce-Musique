<%@tag pageEncoding="UTF-8" %>
<%@attribute name="breadcrumb" fragment="true" %>

<!DOCTYPE html>
<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Golfieri Guillaume Blacas Julien">

        <title>MultiTracksSongs</title>

        <link href="css/style.default.css" rel="stylesheet">
    </head>

    <body class="signin">
        <div class="panel panel-default">

            <div class="panel panel-primary">
                <div class="panel-heading">Links</div>
                <div class="panel-body">
                    <a class="btn btn-sm btn-primary"><i class="fa fa-euro"></i> Pricing</a>
                    <a class="btn btn-sm btn-primary"><i class="fa fa-music"></i> Music list</a>
                    <a class="btn btn-sm btn-success"><i class="fa fa-shopping-cart"></i> Cart</a>
                    <a href="/tp2webmiage/connexion" class="btn btn-sm btn-primary pull-right"><i class="fa fa-user"></i> Login</a>
                </div>
            </div>
            <div class="contentpanel">
                <jsp:doBody/>
            </div>
        </div>

        <script src="js/jquery-1.10.2.min.js"></script>
        <script src="js/jquery-migrate-1.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/modernizr.min.js"></script>
        <script src="js/retina.min.js"></script>
    </body>
</html>