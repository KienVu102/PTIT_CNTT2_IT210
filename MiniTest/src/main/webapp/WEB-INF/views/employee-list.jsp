<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 07/04/2026
  Time: 7:18 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Danh sách nhân viên phòng Đào tạo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .high-salary {
            color: #d9534f;
            font-weight: bold;
        }
        .normal-salary {
            color: #5cb85c;
        }
    </style>
</head>
<body>
    <h1>Danh sách nhân viên phòng Đào tạo</h1>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Họ và tên</th>
                <th>Phòng ban</th>
                <th>Mức lương</th>
                <th>Đánh giá</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="employee" items="${employees}">
                <tr>
                    <td>${employee.id}</td>
                    <td>${employee.fullName}</td>
                    <td>${employee.department}</td>
                    <td>
                        <fmt:formatNumber value="${employee.salary}" pattern="#,##0.00" />
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${employee.salary >= 10000}">
                                <span class="high-salary">Mức lương cao</span>
                            </c:when>
                            <c:otherwise>
                                <span class="normal-salary">Mức lương cơ bản</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
