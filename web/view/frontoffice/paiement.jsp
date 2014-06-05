<%-- 
    Document   : paiement
    Created on : 5 juin 2014, 14:23:06
    Author     : julien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<t:frontoffice>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Paiement</title>
        </head>
        <body>
            <h1>Bienvenu sur le page de paiement</h1>
            <div class="modal-body">
                <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
                    <input type='hidden' value="${panier.getMusiques().size() * 3.99}" name="amount" />
                    <input name="currency_code" type="hidden" value="EUR" />
                    <input name="return" type="hidden" value="http://localhost:8080/tp2webmiage/paiement?achat=success" />
                    <input name="cancel_return" type="hidden" value="http://localhost:8080/tp2webmiage/musiques" />
                    <input name="notify_url" type="hidden" value="" />
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
        </body>
    </html>
</t:frontoffice>
