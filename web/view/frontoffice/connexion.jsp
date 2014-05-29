<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:frontoffice>
    <jsp:body>
        <div class='corps'>
            <div class='page-header'>
                <h3>Connexion</h3>
            </div>
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
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <form method="post" class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="login" class="col-sm-2 control-label">Login</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="login" placeholder="Login">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password" placeholder="Password">
                            </div>
                        </div>

                        <p>
                            Vous n'avez de compte ? <a href="/tp2webmiage/inscription">Créer un compte</a>
                        </p>

                        <br/>
                        <button style="margin: 20px;" class="btn btn-success btn-block">Inscription</button>
                    </form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:frontoffice>