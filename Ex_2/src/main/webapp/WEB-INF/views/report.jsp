<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 06/04/2026
  Time: 11:57 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Báo cáo điểm sinh viên</title>
</head>
<body>

<%-- Tiêu đề trang --%>
<h1>${reportTitle}</h1>

<p>Lượt xem trang: ${viewCount}</p>

<table border="1">
    <thead>
    <tr>
        <th>STT</th>
        <th>Họ tên</th>
        <th>Điểm</th>
        <th>Xếp loại</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="sv" items="${studentList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td><c:out value="${sv.fullName}" /></td>   <%-- Chống XSS --%>
            <td>${sv.score}</td>
            <td>
                <c:choose>
                    <c:when test="${sv.score >= 90}">Xuất sắc</c:when>
                    <c:when test="${sv.score >= 80}">Giỏi</c:when>
                    <c:when test="${sv.score >= 70}">Khá</c:when>
                    <c:when test="${sv.score >= 60}">Trung bình khá</c:when>
                    <c:when test="${sv.score >= 50}">Trung bình</c:when>
                    <c:otherwise>Yếu</c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
