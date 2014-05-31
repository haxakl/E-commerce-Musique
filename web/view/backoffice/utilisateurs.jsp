<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:backoffice>
    <jsp:attribute name="breadcrumb">
        <h2><i class="fa fa-user"></i> Utilisateurs <span>Lister les utilisateurs</span></h2>
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="index.jsp">Accueil</a></li>
                <li class="active">Utilisateurs</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:body>

        <p>
            <a href="/tp2webmiage/tp2webmiage/admin/utilisateurs" class="btn btn-primary btn-sm">Ajouter un utilisateur</a>
            <a href="/tp2webmiage/tp2webmiage/admin/utilisateurs/masse/50" class="btn btn-primary btn-sm">Créer utilisateurs de tests</a>
        </p>

        <div class="row">
            <div class="col-lg-6">
                <ul class="pagination">
                    <!-- Définition du nombre d'élément par page -->
                    <c:choose>
                        <c:when test="${nbAffiche != 30}">
                            <c:set var="nbElement" value="${param.nbAffiche}">          
                            </c:set>
                        </c:when>
                        <c:otherwise>
                            <c:set var="nbElement" value="30">          
                            </c:set>
                        </c:otherwise>       
                    </c:choose>

                    <!-- Bouton "précédent" -->
                    <c:choose>
                        <c:when test="${page == '1'}">
                            <li><a href="?page=${page}&nbAffiche=${nbElement}">&laquo;</a></li>
                            </c:when>
                            <c:otherwise>
                            <li><a href="?page=${page - 1}&nbAffiche=${nbElement}">&laquo;</a></li>
                            </c:otherwise>
                        </c:choose>
                    <!-- fin bouton "précedent" --> 

                    <c:forEach var="entry" begin="1" end="${nbPages}">
                        <li
                            <c:if test="${page.equals(entry)}">
                                class="active"
                            </c:if>
                            ><a href="?page=${entry}&nbAffiche=${nbElement}">${entry}</a></li>
                        </c:forEach>

                    <!-- Bouton suivant -->
                    <c:choose>
                        <c:when test="${page.equals(nbPages)}">
                            <li><a href="?page=${page}&nbAffiche=${nbElement}">&raquo;</a></li>
                            </c:when>
                            <c:otherwise>
                            <li><a href="?page=${page + 1}&nbAffiche=${nbElement}">&raquo;</a></li>
                            </c:otherwise>
                        </c:choose>
                    <!-- Fin bouton suivant --> 
                </ul>
            </div>
            <div class="col-lg-2"></div>
            <div class="col-lg-2">
                <form name="submitForm" method="POST" action="/tp2webmiage/utilisateurs">
                    <select name="nbAffiche" class="form-control btn-sm">
                        <option value="10"
                                <c:if test="${nbAffiche == 10}">selected</c:if>        
                                    >10</option>
                                <option value="20"
                                <c:if test="${nbAffiche == 20}">selected</c:if>  
                                    >20</option>
                                <option value="30"
                                <c:if test="${nbAffiche == 30}">selected</c:if>  
                                    >30</option>
                                <option value="50"
                                <c:if test="${nbAffiche == 50}">selected</c:if> 
                                    >50</option>
                                <option value="100"
                                <c:if test="${nbAffiche == 100}">selected</c:if> 
                                    >100</option>
                                <option value="-1">Tous</option>
                        </select>
                    </form>
                </div>
                <div class="col-lg-2">
                    <input value="Filtrer" type="submit" class="btn btn-sm btn-info" onclick="this.form.submit()">
                </div>
            </div>

            <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->  
            <table class="table">  
                <!-- La ligne de titre du tableau des comptes -->  
                <tr>  
                    <td><b>Modifier</b></td>
                    <td><b>Login</b></td>
                    <td><b>Nom</b></td>
                    <td><b>Prénom</b></td>
                    <td><b>Ville</b></td>  
                    <td><b>Code postal</b></td>
                    <td><b>Téléphone</b></td>
                    <td><b>Supprimer</b></td>
                </tr>  

                <!-- Ici on affiche les lignes, une par utilisateur -->  
                <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->  
            <c:set var="total" value="0"/>  

            <c:forEach var="u" items="${requestScope['listeDesUsers']}">
                <tr>
                    <td><a href="/tp2webmiage/utilisateurs/modify/${u.id}" class="btn btn-primary btn-sm"><i class="fa fa-cog"></i> Modifier</a></td>
                    <td>${u.login}</td>
                    <td>${u.nom}</td>
                    <td>${u.prenom}</td>
                    <td>
                        <a href="adresses/${u.adresse.id}">
                            ${u.adresse.ville}
                        </a>
                    </td>  
                    <td>${u.adresse.codePostal}</td> 
                    <td>${u.telephone.tel}</td>
                    <td><a href="/tp2webmiage/utilisateurs/delete/${u.id}" class="supprimer btn btn-danger btn-sm"><i class="fa fa-times"></i> Supprimer</a></td>
                    <!-- On compte le nombre de users -->  
                    <c:set var="total" value="${total+1}"/>
                </tr>
            </c:forEach>

            <!-- Affichage du solde total dans la dernière ligne du tableau -->  
            <tr>
                <td colspan="7"><b>TOTAL</b></td>
                <td><b>${total}</b></td>
            </tr>
        </table>

        <div class="modal fade bs-example-modal-panel in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
            <div class="modal-dialog">
                <div class="modal-content"><div class="panel panel-dark panel-alt">
                        <div class="panel-heading">
                            <div class="panel-btns">
                                <a class="panel-close" data-dismiss="modal" aria-hidden="true">×</a>
                            </div><!-- panel-btns -->
                            <h3 class="panel-title">Etes-vous sur de vouloir supprimer cet utilisateur ?</h3>
                        </div>
                        <div class="panel-body">
                            La suppression d'un utilisateur est permanent. Il ne sera pas possible de le récupérer.
                        </div>
                        <div class="panel-footer">
                            <a class="non btn btn-default pull-right">Non</a>
                            <a class="oui btn btn-success pull-right" style="margin-right: 20px;">Oui</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>

            // Prevent suppression
            jQuery(".supprimer").click(function(event) {
                event.preventDefault();
                jQuery(".bs-example-modal-panel").modal("show");
                var lien = $(this).attr("href");
                jQuery(".bs-example-modal-panel .non").click(function() {
                    $(this).closest(".bs-example-modal-panel").modal("hide");
                });
                jQuery(".bs-example-modal-panel .oui").click(function() {
                    location = lien;
                });
            });

    </script>

    </jsp:body>
</t:backoffice>