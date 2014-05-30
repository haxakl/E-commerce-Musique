<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:frontoffice>
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
            <p>
                <a class="btn btn-sm btn-primary pull-right">Acheter</a><br/><br/>
            </p>
        </div>
    </jsp:body>
</t:frontoffice>