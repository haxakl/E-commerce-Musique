<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:frontoffice>
    <jsp:attribute name="breadcrumb">
        <h2><i class="fa fa-music"></i> Musiques <span>Lister les musiques</span></h2>
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="index.jsp">Accueil</a></li>
                <li class="active">Musiques</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:body>
        <div class="corps">
            <div class="page-header">
                <h3>Liste des musiques</h3>
            </div>

            <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->  
            <table class="table table-striped">  
                <!-- La ligne de titre du tableau des comptes -->  
                <tr>  
                    <td><b>Artiste</b></td>
                    <td><b>Titre</b></td>
                    <td><b>Nb Pistes</b></td>
                    <td><b>Annee</b></td>
                    <td><b>Genre</b></td>
                    <td><b>Acheter</b></td>

                </tr>  

                <!-- Ici on affiche les lignes, une par utilisateur -->  
                <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->  
                <c:set var="total" value="0"/>  

                <c:forEach var="m" items="${requestScope['listeDesMusiques']}">
                    <tr>
                        <td>${m.artiste.nom}</td> 
                        <td><a href="http://localhost:8080/tp2webmiage/musiques/${m.id}">${m.titre}</a></td>
                        <td>${m.nbpiste}</td>
                        <td>${m.annee}</td>
                        <td><a href="musiques?genre=${m.genre.id}">${m.genre.nom}</a></td>
                        <td><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
                                <span class="fa fa-shopping-cart"></span> 3.99 €</button></td>
                    </tr>
                </c:forEach>
            </table>

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myModalLabel">Achat d'un titre</h4>
                        </div>
                        <div class="modal-body">
                            <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
                                <input type='hidden' value="2.2" name="amount" />
                                <input name="currency_code" type="hidden" value="EUR" />
                                <input name="return" type="hidden" value="http://localhost:8080/tp2webmiage/musiques" />
                                <input name="cancel_return" type="hidden" value="http://localhost:8080/tp2webmiage/musiques" />
                                <input name="notify_url" type="hidden" value="http://votredomaine/validationPaiement.php" />
                                <input name="cmd" type="hidden" value="_xclick" />
                                <input name="business" type="hidden" value="julienblacas@gmail.com" />
                                <input name="item_name" type="hidden" value="Une musique" />
                                <input name="no_note" type="hidden" value="1" />
                                <input name="lc" type="hidden" value="FR" />
                                <input name="bn" type="hidden" value="PP-BuyNowBF" />
                                <input name="custom" type="hidden" value="ID_ACHETEUR" />
                                <input alt="Effectuez vos paiements via PayPal : une solution rapide, gratuite et sécurisée" name="submit" src="https://www.paypal.com/fr_FR/FR/i/btn/btn_buynow_LG.gif" type="image" /><img src="https://www.paypal.com/fr_FR/i/scr/pixel.gif" border="0" alt="" width="1" height="1" />
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Payer avec paypal</button>
                        </div>
                    </div><!-- modal-content -->
                </div><!-- modal-dialog -->
            </div>
        </div>
    </jsp:body>
</t:frontoffice>