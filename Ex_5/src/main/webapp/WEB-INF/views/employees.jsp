<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách Nhân viên - HR Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <h2>Danh sách Nhân viên</h2>
                
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>STT</th>
                            <th>Mã NV</th>
                            <th>Họ tên</th>
                            <th>Phòng ban</th>
                            <th>Lương (VNĐ)</th>
                            <th>Ngày vào làm</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="emp" items="${employees}" varStatus="status">
                            <tr>
                                <td><c:out value="${status.count}"/></td>
                                <td><c:out value="${emp.code}"/></td>
                                <td><c:out value="${emp.fullName}"/></td>
                                <td><c:out value="${emp.department}"/></td>
                                <td>
                                    <fmt:formatNumber value="${emp.salary}" 
                                                    type="currency" 
                                                    currencySymbol="VNĐ"
                                                    maxFractionDigits="0"/>
                                </td>
                                <td>
                                    <fmt:formatDate value="${emp.hireDate}" 
                                                  pattern="dd/MM/yyyy"/>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${emp.status == 'Đang làm'}">
                                            <span class="badge bg-success"><c:out value="${emp.status}"/></span>
                                        </c:when>
                                        <c:when test="${emp.status == 'Nghỉ phép'}">
                                            <span class="badge bg-warning"><c:out value="${emp.status}"/></span>
                                        </c:when>
                                        <c:when test="${emp.status == 'Thử việc'}">
                                            <span class="badge bg-info"><c:out value="${emp.status}"/></span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-secondary"><c:out value="${emp.status}"/></span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="<c:url value='/employees/${emp.code}'/>" 
                                       class="btn btn-sm btn-primary">Xem chi tiết</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr class="table-info">
                            <td colspan="4" class="text-end fw-bold">
                                Tổng lương phòng ban Kỹ thuật:
                            </td>
                            <td colspan="4" class="fw-bold">
                                <fmt:formatNumber value="${totalTechSalary}" 
                                                type="currency" 
                                                currencySymbol="VNĐ"
                                                maxFractionDigits="0"/>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
    
    <%@ include file="footer.jsp" %>
</body>
</html>
