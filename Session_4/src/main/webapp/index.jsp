<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<p>Ex-1</p>
<p>http://localhost:8080/ex1/bai1/orders</p>
<p>Ex-2</p>
<p>http://localhost:8080/ex2/bai2/menu-loi</p>
<p>http://localhost:8080/ex2/bai2/menu</p>
<p>Ex-3</p>
<p>http://localhost:8080/ex3/bai3/orders/5</p>
<p>Ex-4</p>
<p>Link truy cập đc</p>
<p>http://localhost:8080/ex4/bai4/products?category=chay&limit=10</p>
<p>Link ép lỗi</p>
<p>http://localhost:8080/ex4/bai4/products?category=chay&limit=abc</p>
<p>Ex-5(Phải có postman để chạy bài này)</p>
<p>Get</p>
<p>http://localhost:8080/ex5/orders/99</p>
<p>Bẫy</p>
<p>http://localhost:8080/ex5/orders/abc</p>
<p>Post</p>
<p>http://localhost:8080/ex5/orders/99</p>
<p>Delete</p>
<p>http://localhost:8080/ex5/orders/99</p>



</body>
</html>