<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:frontoffice>
    <jsp:body>
        <div class='corps'>
            <div class='page-header'>
                <h3>Inscription</h3>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <form method="post" class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="nom" class="col-sm-2 control-label">Nom</label>
                            <div class="col-sm-10">
                                <input type="nom" name="nom" class="form-control" id="nom" placeholder="Nom">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="prenom" class="col-sm-2 control-label">Prénom</label>
                            <div class="col-sm-10">
                                <input type="text" name="prenom" class="form-control" id="prenom" placeholder="Prénom">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email" placeholder="Email">
                            </div>
                        </div>

                        <hr>
                        <div class="form-group">
                            <!--
                            <label for="instrument" class="col-sm-2 control-label">Instruments</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email" placeholder="Email">
                            </div> -->
                            <label for="instrument" class="col-sm-2 control-label">Instruments</label>
                            <div class="dropdown" id="instrument">
                                <a class="dropdown-toggle btn" data-toggle="dropdown" href="#">
                                    Veuillez choisir vos instruments favoris
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-form" role="menu">
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox">
                                            Drums
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox">
                                            Bass
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox">
                                            Snare
                                        </label>
                                    </li>
                                    <li>
                                        <label class="checkbox">
                                            <input type="checkbox">
                                            Hi-hat
                                        </label>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="login" class="col-sm-2 control-label">Login</label>
                            <div class="col-sm-10">
                                <input type="text" name="login" class="form-control" id="login" placeholder="Login">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confirmation" class="col-sm-2 control-label">Confirmation</label>
                            <div class="col-sm-10">
                                <input type="password" name="confirmation" class="form-control" id="confirmation" placeholder="Confirmation">
                            </div>
                        </div>

                        <br/>
                        <button style="margin: 20px;" class="btn btn-success btn-block">Inscription</button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            $('.dropdown-menu').on('click', function(e) {
                if ($(this).hasClass('dropdown-menu-form')) {
                    e.stopPropagation();
                }
            });
        </script>
    </jsp:body>
</t:frontoffice>