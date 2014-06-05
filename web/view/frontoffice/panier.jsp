<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:frontoffice>
    <jsp:attribute name="breadcrumb">
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="index.jsp">Accueil</a></li>
                <li class="active">Panier</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:body>
        <c:if test="${not empty etat}">
            <c:choose>
                <c:when test="${etat.equals('dejapresent')}">
                    <div class="alert alert-danger">
                        La musique est déjà dans le panier
                    </div>
                </c:when>
                <c:when test="${etat.equals('plusdecredit')}">
                    <div class="alert alert-danger">
                        Pas assez de crédit pour acheter les musiques
                    </div>
                </c:when>
                <c:when test="${etat.equals('supprMusique')}">
                    <div class="alert alert-success">
                        La musique a été supprimée du panier
                    </div>
                </c:when>
                <c:otherwise></c:otherwise>
            </c:choose>
        </c:if>
        <div class="container" style="background-color: white;">
            <div class="row">
                <div class="col-sm-12 col-md-10 col-md-offset-1">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th class="text-center">Price</th>
                                <th style='width: 100px;'></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${panier != null}">
                                    <c:choose>
                                        <c:when test="${panier.isEmpty()}" >
                                            <tr>
                                                <td colspan="5">
                                                    Aucun objet dans votre panier.
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="m" items="${panier.getMusiques()}">
                                                <tr>
                                                    <td>${m.titre}</td>
                                                    <td class='text-center'>3.99€</td>
                                                    <td>
                                                        <form method="post">
                                                            <input type="hidden" name="action" value="suppr">
                                                            <input type='hidden' name="item" value='${m.id}'/>
                                                            <input type="submit" class="btn btn-sm btn-danger form-control" value="Supprimer">
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan='3'>
                                            Aucun objet dans votre panier.
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <!-- BOUTON VIDER -->
                <div class="col-md-1 col-md-offset-1">
                    <form action = "" method = "post">
                        <input type="hidden" name="action" value="empty">
                        <input type ="submit" class="btn btn-primary pull-left form-control" value="Vider">
                    </form>
                </div>
                <!-- BOUTON ACHETER -->
                <div class="col-md-2 col-md-offset-7">
                    <c:if test="${user != null}">
                            <!--<input type="hidden" name="action" value="buy">-->
                            <a href="/tp2webmiage/paiement" class="btn btn-success pull-left form-control"> Acheter </a>
                    </c:if>
                </div>
            </div>
            <br/><br/>
        </div>

    </jsp:body>
</t:frontoffice>