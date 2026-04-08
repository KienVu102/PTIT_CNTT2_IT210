<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 09/04/2026
  Time: 12:22 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách món ăn</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .box { border: 1px solid #ccc; padding: 20px; border-radius: 8px; width: 400px; background-color: #f9f9f9;}
        .success { color: #28a745; font-weight: bold; font-size: 1.1em;}
        .data-row { margin: 10px 0; }
    </style>
</head>
<body>
<h2>Kết quả lọc danh sách (Bài 4)</h2>

<div class="box">
    <p class="success">Thông báo: ${message}</p>
    <hr>
    <p class="data-row"><strong>Loại món ăn đã chọn:</strong> ${category}</p>
    <p class="data-row"><strong>Số lượng hiển thị (Limit):</strong> ${limit} món</p>
</div>
</body>
</html>
