<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="mypack.models.DramaShow"%>
<%
    String lang = (String) session.getAttribute("lang");
    boolean isVi = "vi".equals(lang);
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= isVi ? "Danh Sách Vở Kịch" : "Available Drama Shows" %></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2><%= isVi ? "Danh Sách Vở Kịch Dang Chiếu" : "List of Available Drama Shows" %></h2>
        <div>
            <span class="badge bg-secondary p-2 me-2">
                <%= isVi ? "Hôm nay: " : "Today: " %><%= request.getAttribute("currentDate") %>
            </span>
            <a href="changeLanguage?lang=en" class="btn btn-sm btn-outline-dark">EN</a>
            <a href="changeLanguage?lang=vi" class="btn btn-sm btn-outline-dark">VI</a>
            <a href="logout" class="btn btn-sm btn-danger ms-2"><%= isVi ? "Đăng xuất" : "Logout" %></a>
        </div>
    </div>

    <div class="alert alert-warning">
        🎉 <%= isVi ? "Ưu đãi: Mua từ 5 vé trở lên giảm ngay 25%!" : "Special Discount: Purchase 5 or more tickets to get 25% OFF!" %>
    </div>

    <div class="row">
        <% 
            List<DramaShow> shows = (List<DramaShow>) request.getAttribute("shows");
            if (shows != null) {
                for (DramaShow show : shows) {
        %>
        <div class="col-md-4 mb-3">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h5 class="card-title text-primary">
                        <%= isVi ? show.getTitleVi() : show.getTitleEn() %>
                    </h5>
                    <p class="card-text">
                        <strong><%= isVi ? "Địa điểm:" : "Venue:" %></strong> <%= show.getVenue() %><br/>
                        <strong><%= isVi ? "Suất chiếu:" : "Showtime:" %></strong> <%= show.getShowTime() %><br/>
                        <strong><%= isVi ? "Giá vé:" : "Price:" %></strong> <%= String.format("%,.0f VNĐ", show.getPricePerTicket()) %>
                    </p>
                    <a href="BookingController?action=book&id=<%= show.getId() %>" class="btn btn-success w-100">
                        <%= isVi ? "Đặt Vé Ngay" : "Book Tickets" %>
                    </a>
                </div>
            </div>
        </div>
        <%      } 
            } 
        %>
    </div>

</body>
</html>