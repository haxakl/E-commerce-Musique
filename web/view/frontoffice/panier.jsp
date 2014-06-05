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
                    <form action = "" method = "post">
                        <!--<input type="hidden" name="action" value="buy">-->
                        <input class="btn btn-success pull-left form-control" data-toggle="modal" data-target="#myModal" value="Acheter">
                    </form>
                </div>
            </div>
            <br/><br/>
        </div>
        
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Ã—</button>
                        <h4 class="modal-title" id="myModalLabel">Achat d'un titre</h4>
                    </div>
                    <div class="modal-body">
                        <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
                            <input type='hidden' value="${panier.getMusiques().size() * 3.99}" name="amount" />
                            <input name="currency_code" type="hidden" value="EUR" />
                            <input name="return" type="hidden" value="http://localhost:8080/tp2webmiage/musiques" />
                            <input name="cancel_return" type="hidden" value="http://localhost:8080/tp2webmiage/musiques" />
                            <input name="notify_url" type="hidden" value="http://votredomaine/validationPaiement.php" />
                            <input name="cmd" type="hidden" value="_xclick" />
                            <input name="business" type="hidden" value="julienblacas@gmail.com" />
                            <input name="item_name" type="hidden" value="Panier MusicComposer" />
                            <input name="no_note" type="hidden" value="${panier.getMusiques().size()}" />
                            <input name="lc" type="hidden" value="FR" />
                            <input name="bn" type="hidden" value="PP-BuyNowBF" />
                            <input name="custom" type="hidden" value="ID_ACHETEUR" />
                            <input name="submit" class="btn btn-primary" type="image" value="Payer avec paypal"/>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <form action = "" method = "post">
                            <input type="hidden" name="action" value="buy">
                            <input type="submit" class="btn btn-success pull-left" data-toggle="modal" data-target="#myModal" value="Acheter">
                        </form>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div><!-- modal-content -->
            </div><!-- modal-dialog -->
        </div>

    </jsp:body>
</t:frontoffice>