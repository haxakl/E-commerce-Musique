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
                            <h4 class="nomargin">Inscription</h4><br/>
                            <p class="mt5 mb20">Formulaire d'inscription pour accéder à l'espace membre.</p>

                            <input type="text" name="nom" class="form-control uname" placeholder="Nom" />
                            <input type="text" name="prenom" class="form-control uname" placeholder="Prénom" />
                            <input type="text" name="email" class="form-control uname" placeholder="Email" />
                            <hr>
                            <input type="text" name="login" class="form-control uname" placeholder="Login" />
                            <input type="password" name="password" class="form-control pword" placeholder="Password" />
                            <input type="password" name="confirmation" class="form-control pword" placeholder="Confirmation" /><br/>
                            <button class="btn btn-success btn-block">Inscription</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </jsp:body>
</t:frontoffice>