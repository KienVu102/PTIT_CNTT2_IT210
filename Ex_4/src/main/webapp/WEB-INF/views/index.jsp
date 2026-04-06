<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Booking System</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .container { max-width: 800px; margin: 0 auto; }
        .search-box { padding: 20px; background: #f5f5f5; border-radius: 8px; margin-bottom: 20px; }
        .search-input { padding: 10px; width: 300px; border: 1px solid #ddd; border-radius: 4px; }
        .search-btn { padding: 10px 20px; background: #2196f3; color: white; border: none; border-radius: 4px; cursor: pointer; }
        .search-btn:hover { background: #1976d2; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎫 Event Booking System</h1>
        
        <div class="search-box">
            <h2>Tìm kiếm sự kiện</h2>
            <form action="${pageContext.request.contextPath}/events/search" method="get">
                <input type="text" name="keyword" class="search-input" placeholder="Nhập từ khóa tìm kiếm...">
                <button type="submit" class="search-btn">Tìm kiếm</button>
            </form>
        </div>
        
        <div>
            <h3>Test Cases:</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/events/search">Xem tất cả sự kiện</a></li>
                <li><a href="${pageContext.request.contextPath}/events/search?keyword=spring">Tìm "spring"</a></li>
                <li><a href="${pageContext.request.contextPath}/events/search?keyword=<script>alert('xss')</script>">Test XSS</a></li>
                <li><a href="${pageContext.request.contextPath}/events/search?keyword=java">Tìm "java"</a></li>
            </ul>
        </div>
    </div>
</body>
</html>
