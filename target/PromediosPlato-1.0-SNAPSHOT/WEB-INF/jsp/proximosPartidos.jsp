<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<c:import url="/WEB-INF/jsp/includes/head.jsp" />
<body>
<c:import url="/WEB-INF/jsp/includes/header.jsp" />
    <div class="container">
        <nav class="nav-desktop menu-index">
            <a href="${pageContext.request.contextPath}/" class="nav-button">Inicio</a>
            <a href="subpaginaDeLiga.html" class="nav-button">Liga Plato</a>
            <div class="nav-button">Mundial Plato</div>
            <div class="nav-button">Amistosos</div>
        </nav>
        <nav class="nav-mobile" id="nav-mobile">
            <a href="${pageContext.request.contextPath}/" class="nav-button">Inicio</a>
            <a href="subpaginaDeLiga.html" class="nav-button">Liga Plato</a>
            <div class="nav-button">Mundial Plato</div>
            <div class="nav-button">Amistosos</div>
        </nav>
        <main>
            <div class="top-buttons">
                <div>
                    <a href="${pageContext.request.contextPath}/" class="button">PARTIDOS JUGADOS</a>
                    <a href="prox" class="button active">PRÓXIMOS PARTIDOS</a>
                </div>
            </div>
            <div class="match-panel">
                <c:set var="currentEvent" value="" />
                <h2>PRÓXIMOS PARTIDOS</h2>
                <c:forEach var="partido" items="${proximosPartidos}">
                    <c:if test="${currentEvent != partido.tipoEvento}">
                        <c:set var="currentEvent" value="${partido.tipoEvento}" />
                        <c:choose>
                            <c:when test="${partido.tipoEvento == 'liga'}">
                                <h2>LIGA PLATO</h2>
                            </c:when>
                            <c:when test="${partido.tipoEvento == 'mundial'}">
                                <h2>MUNDIAL</h2>
                            </c:when>
                            <c:otherwise>
                                <h2>OTRO EVENTO</h2>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    <div class="match-card">
                        <div style="display: flex; align-items: stretch; gap: 10px;">
                            <div style="background-color: #333; padding: 5px 10px; width: 60px; text-align: center; display: flex; flex-direction: column; justify-content: center;">
                                <div>${partido.fecha}</div>
                            </div>
                            <div style="flex-grow: 1;">
                                <div class="match-teams">
                                    <span>${equipoNombres[partido.equipoLocalId]}</span>
                                    <span class="match-score">vs</span>
                                    <span>${equipoNombres[partido.equipoVisitanteId]}</span>
                                </div>
                                <div class="probability-bar">
                                    <c:set var="probabilidad" value="${probabilidades[partido.partidoId]}" />
                                    <div class="probability-segment home-win" style="width: ${probabilidad.local}%;">${probabilidad.local}%</div>
                                    <div class="probability-segment draw" style="width: ${probabilidad.empate}%;">${probabilidad.empate}%</div>
                                    <div class="probability-segment away-win" style="width: ${probabilidad.visitante}%;">${probabilidad.visitante}%</div>
                                </div>
                            </div>
                            <div style="padding: 5px; display: flex; align-items: center;">
                                <button style="background: none; border: none; color: #B4D335; cursor: pointer; font-size: 20px;">+</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </main>
    </div>
    <footer>
    <!-- Contenido del footer -->
    </footer>
</body>
</html>