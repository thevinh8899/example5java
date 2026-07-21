<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String lang = (String) session.getAttribute("lang");
    boolean isVi = "vi".equals(lang);
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= isVi ? "Đăng Nhập" : "User Login" %></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light d-flex align-items-center" style="height: 100vh;">

<div class="container" style="max-width: 420px;">

    <!-- Nút chọn ngôn ngữ -->
    <div class="text-end mb-2">
        <a href="changeLanguage?lang=en" class="btn btn-sm btn-outline-primary <%= !isVi ? "active" : "" %>">English</a>
        <a href="changeLanguage?lang=vi" class="btn btn-sm btn-outline-primary <%= isVi ? "active" : "" %>">Tiếng Việt</a>
    </div>

    <%-- Thông báo lượt truy cập) --%>
    <% 
        String msg = isVi ? (String) request.getAttribute("visitorMessageVi") : (String) request.getAttribute("visitorMessageEn");
        if (msg != null) { 
    %>
        <div class="alert alert-info text-center fw-bold"><%= msg %></div>
    <% } %>

    <%-- Lỗi Đăng nhập --%>
    <% 
        String err = isVi ? (String) request.getAttribute("errorVi") : (String) request.getAttribute("errorEn");
        if (err != null) { 
    %>
        <div class="alert alert-danger text-center"><%= err %></div>
    <% } %>

    <div class="card shadow">
        <div class="card-header bg-primary text-white text-center">
            <h4><%= isVi ? "Đăng Nhập Hệ Thống" : "User Login" %></h4>
        </div>
        <div class="card-body">
            <form action="login" method="post">
                <div class="mb-3">
                    <label class="form-label"><%= isVi ? "Tên đăng nhập" : "Username" %></label>
                    <input type="text" name="username" class="form-control" 
                           value="<%= request.getAttribute("rememberedUser") != null ? request.getAttribute("rememberedUser") : "" %>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label"><%= isVi ? "Mật khẩu" : "Password" %></label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary w-100"><%= isVi ? "Đăng Nhập" : "Login" %></button>
            </form>
        </div>
    </div>
</div>

</body>
</html>