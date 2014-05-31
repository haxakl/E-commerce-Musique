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
        <div class="container" style="background-color: white;">
            <div class="row">
                <div class="col-sm-12 col-md-10 col-md-offset-1">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th class="text-center">Price</th>
                                <th class="text-center">Total</th>
                                <th> </th>
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
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td>
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
                    <form action = "" method = "post">
                        <input type="hidden" name="action" value="buy">
                        <input type ="submit" class="btn btn-success pull-left form-control" value="Acheter">
                    </form>
                </div>
            </div>
            </br></br>
        </div>
    </jsp:body>
</t:frontoffice>