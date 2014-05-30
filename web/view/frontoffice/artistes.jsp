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
            <section>
                <div class="control-bar sandbox-control-bar">
                    <div class="group">
                        <label>Sort:</label>
                        <span class="btn sort active" data-sort="random">Random</span>
                        <span class="btn sort" data-sort="value:asc">Ascending</span>
                        <span class="btn sort" data-sort="value:desc">Descending</span>
                    </div>
                    <div class="group">
                        <label>Filter:</label>
                        <span class="btn filter active" data-filter="all">All</span>
                        <span class="btn filter" data-filter=".category-1">Blue</span>
                        <span class="btn filter" data-filter=".category-2">Green</span>
                        <span class="btn filter" data-filter="none">None</span>
                        <span id="ToggleLayout" class="btn toggle-layout">&nbsp;<i></i></span>
                        <span id="ToggleConfig" class="btn toggle-config">&nbsp;</span>
                    </div>
                </div>
                <div id="SandBox" class="sandbox">
                    <div class="mix category-1" data-value="1" style="display: inline-block;">1</div>
                    <div class="mix category-2" data-value="8" style="display: inline-block;">8</div>
                    <div class="mix category-1" data-value="10" style="display: inline-block;">10</div>
                    <div class="mix category-2" data-value="12" style="display: inline-block;">12</div>
                    <div class="mix category-2" data-value="6" style="display: inline-block;">6</div>
                    <div class="mix category-2" data-value="3" style="display: inline-block;">3</div>
                    <div class="mix category-2" data-value="5" style="display: inline-block;">5</div>
                    <div class="mix category-2" data-value="11" style="display: inline-block;">11</div>
                    <div class="mix category-1" data-value="4" style="display: inline-block;">4</div>
                    <div class="mix category-1" data-value="2" style="display: inline-block;">2</div>
                    <div class="mix category-2" data-value="9" style="display: inline-block;">9</div>
                    <div class="mix category-1" data-value="7" style="display: inline-block;">7</div>
                    <div class="gap"></div>
                </div>
            </section>
        </div>
    </jsp:body>
</t:frontoffice>