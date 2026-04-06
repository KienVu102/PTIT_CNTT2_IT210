<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lỗi - HR Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card border-danger">
                    <div class="card-header bg-danger text-white">
                        <h3 class="mb-0">
                            <i class="bi bi-exclamation-triangle"></i> Đã xảy ra lỗi
                        </h3>
                    </div>
                    <div class="card-body">
                        <div class="alert alert-danger">
                            <h5>Thông báo lỗi:</h5>
                            <p class="mb-0"><c:out value="${errorMessage}"/></p>
                        </div>
                        
                        <div class="mt-3">
                            <p><strong>Vui lòng kiểm tra lại thông tin hoặc liên hệ quản trị viên.</strong></p>
                        </div>
                        
                        <div class="mt-4">
                            <a href="<c:url value='/employees'/>" class="btn btn-primary">
                                <i class="bi bi-house"></i> Về trang danh sách nhân viên
                            </a>
                            <a href="<c:url value='/login'/>" class="btn btn-secondary ms-2">
                                <i class="bi bi-box-arrow-right"></i> Đăng xuất
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
