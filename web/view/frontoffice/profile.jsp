<%-- 
    Document   : profile
    Created on : 30 mai 2014, 01:10:16
    Author     : julien
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:frontoffice>
    <jsp:attribute name="breadcrumb">
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="index.jsp">Accueil</a></li>
                <li class="active">Mon profile</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6">            
                <div class="well well-sm">
                    <div class="row">
                        <div class="text-center">
                            <h2>Mon profil</h2>
                        </div>
                        <div class="col-md-8">
                            <h3>${user.prenom} ${user.nom}</h3>
                            <p>
                                ${user.email}
                            </p>
                            <br/>
                            <div>
                                <c:if test="${not empty user.abonnement}">
                                    <p>
                                        ${user.abonnement.name}<br/>
                                        <c:if test="${user.abonnement.nbmusicallowed == -1}">
                                            Aucune limite de téléchargements
                                        </c:if>
                                    </c:if>
                                    <c:if test="${empty user.abonnement}">
                                    <p>
                                        Aucun abonnement<br/>
                                    </c:if>

                                    <c:if test="${user.abonnement.nbmusicallowed != -1}">
                                        ${user.nbMusiqueAchat} musiques restantes
                                    </c:if>
                                </p>
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
                                    <p>
                                        <a href="/tp2webmiage/musiques/${m.id}">${m.titre}</a>
                                    </p>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty user.purshased}">
                                <p>
                                    Aucun achat.
                                </p>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:frontoffice>
