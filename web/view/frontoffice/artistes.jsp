<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:frontoffice>
    <jsp:attribute name="breadcrumb">
        <div class="breadcrumb-wrapper">
            <span class="label">Vous êtes ici</span>
            <ol class="breadcrumb">
                <li><a href="index.jsp">Accueil</a></li>
                <li class="active">Aristes</li>
            </ol>
        </div>
    </jsp:attribute>
    <jsp:attribute name="script">
        <script>
            $(function() {
                $('#Container').mixItUp({
                    animation: {
                        duration: 610,
                        effects: 'translateZ(-360px) stagger(34ms) fade',
                        easing: 'ease'
                    }
                });
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="corps">
            <div class="page-header">
                <h3>Liste des artistes</h3>
            </div>
            <div id="SandBox" class="sandbox config-open">
                <div class="mix category-1" data-value="7" style="display: inline-block;">7</div>
                <div class="mix category-2" data-value="9" style="display: inline-block;">9</div>
                <div class="mix category-2" data-value="11" style="display: inline-block;">11</div>
                <div class="mix category-2" data-value="5" style="display: inline-block;">5</div>
                <div class="mix category-1" data-value="1" style="display: inline-block;">1</div>
                <div class="mix category-1" data-value="4" style="display: inline-block;">4</div>
                <div class="mix category-2" data-value="6" style="display: inline-block;">6</div>
                <div class="mix category-1" data-value="10" style="display: inline-block;">10</div>
                <div class="mix category-2" data-value="8" style="display: inline-block;">8</div>
                <div class="mix category-1" data-value="2" style="display: inline-block;">2</div>
                <div class="mix category-2" data-value="3" style="display: inline-block;">3</div>
                <div class="mix category-2" data-value="12" style="display: inline-block;">12</div>
            </div>
        </div>
    </jsp:body>
</t:frontoffice>