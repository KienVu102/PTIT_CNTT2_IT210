<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách đơn hàng - Hệ thống quản lý đơn hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 2px solid #007bff;
        }
        .user-info {
            color: #333;
        }
        .user-info h1 {
            margin: 0;
            color: #007bff;
        }
        .user-info p {
            margin: 5px 0;
            color: #666;
        }
        .logout-btn {
            background-color: #dc3545;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }
        .logout-btn:hover {
            background-color: #c82333;
        }
        .orders-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .orders-table th,
        .orders-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .orders-table th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
        .orders-table tr:hover {
            background-color: #f5f5f5;
        }
        .order-id {
            font-weight: bold;
            color: #007bff;
        }
        .amount {
            text-align: right;
            font-weight: bold;
            color: #28a745;
        }
        .date {
            text-align: center;
        }
        .footer {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
            text-align: center;
            color: #666;
        }
        .view-count {
            font-size: 18px;
            font-weight: bold;
            color: #007bff;
        }
        .no-orders {
            text-align: center;
            padding: 40px;
            color: #666;
            font-style: italic;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="user-info">
                <h1>Danh sách đơn hàng</h1>
                <!-- User info from SESSION scope -->
                <p>Xin chào, <strong>${loggedUser}</strong>! Vai trò: <strong>${userRole}</strong></p>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Đăng xuất</a>
        </div>

        <!-- Orders table using JSTL forEach -->
        <c:choose>
            <c:when test="${not empty orders}">
                <table class="orders-table">
                    <thead>
                        <tr>
                            <th>Mã đơn hàng</th>
                            <th>Tên sản phẩm</th>
                            <th>Tổng tiền</th>
                            <th>Ngày đặt</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${orders}">
                            <tr>
                                <td class="order-id">${order.orderId}</td>
                                <td>${order.productName}</td>
                                <!-- Format currency using JSTL fmt -->
                                <td class="amount">
                                    <fmt:formatNumber value="${order.totalAmount}" 
                                                    type="currency" 
                                                    currencySymbol="₫" 
                                                    maxFractionDigits="0"/>
                                </td>
                                <!-- Format date using JSTL fmt -->
                                <td class="date">
                                    <fmt:formatDate value="${order.orderDate}" 
                                                  pattern="dd/MM/yyyy"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="no-orders">
                    Không có đơn hàng nào để hiển thị.
                </div>
            </c:otherwise>
        </c:choose>

        <!-- Footer with application scope counter -->
        <div class="footer">
            <p class="view-count">
                Tổng lượt xem đơn hàng toàn hệ thống: <strong>${totalViewCount}</strong>
            </p>
            <p>
                <small>© 2026 Hệ thống quản lý đơn hàng - Spring MVC Scope Demo</small>
            </p>
        </div>
    </div>
</body>
</html>
