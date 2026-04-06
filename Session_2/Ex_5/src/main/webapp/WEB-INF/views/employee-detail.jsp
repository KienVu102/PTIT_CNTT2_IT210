<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết Nhân viên - HR Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <h2>Chi tiết Nhân viên</h2>
                
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <table class="table table-borderless">
                                    <tr>
                                        <td class="fw-bold">Mã nhân viên:</td>
                                        <td><c:out value="${employee.code}"/></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold">Họ và tên:</td>
                                        <td><c:out value="${employee.fullName}"/></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold">Phòng ban:</td>
                                        <td><c:out value="${employee.department}"/></td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold">Lương:</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${role == 'hr_manager'}">
                                                    <fmt:formatNumber value="${employee.salary}" 
                                                                    type="currency" 
                                                                    currencySymbol="VNĐ"
                                                                    maxFractionDigits="0"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted">***</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-md-6">
                                <table class="table table-borderless">
                                    <tr>
                                        <td class="fw-bold">Ngày vào làm:</td>
                                        <td>
                                            <fmt:formatDate value="${employee.hireDate}" 
                                                          pattern="dd/MM/yyyy"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold">Trạng thái:</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${employee.status == 'Đang làm'}">
                                                    <span class="badge bg-success"><c:out value="${employee.status}"/></span>
                                                </c:when>
                                                <c:when test="${employee.status == 'Nghỉ phép'}">
                                                    <span class="badge bg-warning"><c:out value="${employee.status}"/></span>
                                                </c:when>
                                                <c:when test="${employee.status == 'Thử việc'}">
                                                    <span class="badge bg-info"><c:out value="${employee.status}"/></span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-secondary"><c:out value="${employee.status}"/></span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        
                        <div class="row mt-3">
                            <div class="col-12">
                                <c:if test="${role == 'hr_staff'}">
                                    <div class="alert alert-info">
                                        <i class="bi bi-info-circle"></i> 
                                        Bạn không có quyền xem thông tin lương của nhân viên.
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        
                        <div class="row mt-3">
                            <div class="col-12">
                                <a href="<c:url value='/employees'/>" class="btn btn-secondary">
                                    <i class="bi bi-arrow-left"></i> Quay lại
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="footer.jsp" %>
</body>
</html>
