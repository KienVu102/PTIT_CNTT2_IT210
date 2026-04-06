<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tìm kiếm sự kiện</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .header { background: #f5f5f5; padding: 15px; margin-bottom: 20px; border-radius: 5px; }
        .no-results { color: #d32f2f; font-weight: bold; }
        table { border-collapse: collapse; width: 100%; margin: 20px 0; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #f2f2f2; }
        .free-badge { background: #4caf50; color: white; padding: 4px 8px; border-radius: 3px; font-size: 12px; }
        .sold-out { color: #d32f2f; font-weight: bold; }
        .low-stock { color: #ff9800; font-weight: bold; }
        .normal-stock { color: #4caf50; }
        .book-link { text-decoration: none; color: #2196f3; }
        .book-link:disabled { color: #ccc; text-decoration: none; cursor: not-allowed; }
        .footer { margin-top: 30px; padding: 15px; background: #f9f9f9; border-radius: 5px; }
    </style>
</head>
<body>
    <div class="header">
        <h2>Kết quả tìm kiếm cho: <c:out value="${keyword}" escapeXml="true"/></h2>
        <p>Tìm thấy <c:out value="${fn:length(events)}"/> sự kiện</p>
    </div>

    <c:choose>
        <c:when test="${empty events}">
            <div class="no-results">Không tìm thấy sự kiện nào phù hợp.</div>
        </c:when>
        <c:otherwise>
            <table>
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên sự kiện</th>
                        <th>Ngày tổ chức</th>
                        <th>Giá vé</th>
                        <th>Vé còn lại</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="event" items="${events}" varStatus="status">
                        <tr>
                            <td><c:out value="${status.count}"/></td>
                            <td><c:out value="${event.name}" escapeXml="true"/></td>
                            <td><c:out value="${event.date}"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${event.price == 0}">
                                        <span class="free-badge">MIỄN PHÍ</span>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatNumber value="${event.price}" type="number" pattern="#,##0"/> VNĐ
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${event.remainingTickets == 0}">
                                        <span class="sold-out">HẾT VÉ</span>
                                    </c:when>
                                    <c:when test="${event.remainingTickets < 10}">
                                        <span class="low-stock">Sắp hết (còn <c:out value="${event.remainingTickets}"/> vé)</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="normal-stock"><c:out value="${event.remainingTickets}"/> vé</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${event.remainingTickets == 0}">
                                        <span class="book-link" style="color: #ccc;">Đặt vé</span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="<c:url value='/events/${event.id}/book'/>" class="book-link">Đặt vé</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>

    <div class="footer">
        <c:if test="${not empty events}">
            <p><strong>Tên sự kiện đầu tiên:</strong> <c:out value="${fn:toUpperCase(events[0].name)}"/></p>
        </c:if>
        <p><strong>Số ký tự từ khóa:</strong> <c:out value="${fn:length(keyword)}"/> ký tự</p>
    </div>
</body>
</html>
