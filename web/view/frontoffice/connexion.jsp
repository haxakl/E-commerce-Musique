<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:frontoffice>
    <jsp:body>
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
    </jsp:body>
</t:frontoffice>