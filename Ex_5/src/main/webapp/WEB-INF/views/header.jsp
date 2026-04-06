<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="<c:url value='/employees'/>">HR Portal</a>
        
        <div class="navbar-nav ms-auto">
            <c:if test="${sessionScope.loggedUser != null}">
                <span class="navbar-text me-3">
                    Xin chào, <c:out value="${sessionScope.loggedUser}"/>
                </span>
                
                <c:if test="${sessionScope.role == 'hr_manager'}">
                    <a class="nav-link" href="<c:url value='/employees'/>">Danh sách NV</a>
                    <a class="nav-link" href="<c:url value='/reports'/>">Báo cáo</a>
                </c:if>
                <c:if test="${sessionScope.role == 'hr_staff'}">
                    <a class="nav-link" href="<c:url value='/employees'/>">Danh sách NV</a>
                </c:if>
                
                <a class="nav-link" href="<c:url value='/logout'/>">Đăng xuất</a>
            </c:if>
        </div>
    </div>
</nav>
