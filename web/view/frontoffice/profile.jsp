<%-- 
    Document   : profile
    Created on : 30 mai 2014, 01:10:16
    Author     : julien
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:frontoffice>
    <jsp:body>
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6">
                <div class="well well-sm">
                    <div class="row">
                        <div class="col-sm-6 col-md-4">
                            <img src="http://placehold.it/380x500" alt="" class="img-rounded img-responsive" />
                        </div>
                        <div class="col-sm-6 col-md-8">
                            <h3>
                                ${user.nom} ${user.nom}
                            </h3>
                            <h4>
                                <c:if test="${user.abonnement.name == null}">
                                    Aucun abonnement
                                </c:if>
                                <c:if test="${user.abonnement.name == 'BASIC'}">
                                    Abonnement basique
                                </c:if> 
                                <c:if test="${user.abonnement.name == 'LIMITED'}">
                                    Abonnement limité
                                </c:if> 
                                <c:if test="${user.abonnement.name == 'UNLIMITED'}">
                                    Abonnement sans limites
                                </c:if> 
                            </h4>
                            <small><cite title="San Francisco, USA">San Francisco, USA <i class="fa fa-map-marker"></i>
                                </cite></small>
                            <p>
                                <i class="fa fa-envelope-o"></i>email@example.com
                                <br />
                                <i class="fa fa-globe"></i><a href="http://www.jquery2dotnet.com">www.jquery2dotnet.com</a>
                                <br />
                                <i class="fa fa-gift"></i>June 02, 1988</p>
                            <!-- Split button -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary">
                                    Social</button>
                                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                    <span class="caret"></span><span class="sr-only">Social</span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Twitter</a></li>
                                    <li><a href="https://plus.google.com/+Jquery2dotnet/posts">Google +</a></li>
                                    <li><a href="https://www.facebook.com/jquery2dotnet">Facebook</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Github</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>      
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6">            
                <div class="well well-sm">
                    <div class="row">
                        <div class="text-center">
                            <h2> Mes achats </h2>
                        </div>
                        <div class="col-md-8">
                            <c:if test="${not empty user.purshased}">
                                <c:forEach var="m" items="${user.purshased}">
                                    <p><a href="/tp2webmiage/musiques/${m.id}">${m.titre}</a></p>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:frontoffice>
