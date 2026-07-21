<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mypack.models.BookingForm"%>
<%
    String lang = (String) session.getAttribute("lang");
    boolean isVi = "vi".equals(lang);
    BookingForm booking = (BookingForm) request.getAttribute("booking");
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= isVi ? "Hóa Đơn Chi Tiết" : "Booking Details" %></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">

    <div class="card shadow mx-auto" style="max-width: 500px;">
        <div class="card-header bg-success text-white">
            <h4 class="mb-0"><%= isVi ? "Thông Tin Đặt Vé Chi Tiết" : "Detailed Booking Receipt" %></h4>
        </div>
        <div class="card-body">
            <p><strong><%= isVi ? "Tên khách hàng:" : "Customer Name:" %></strong> <%= booking.getCustomerName() %></p>
            <p><strong>Email:</strong> <%= booking.getEmail() %></p>
            <p><strong><%= isVi ? "Tên vở kịch:" : "Show Title:" %></strong> <%= booking.getShowTitle() %></p>
            <p><strong><%= isVi ? "Số lượng vé:" : "Quantity:" %></strong> <%= booking.getQuantity() %></p>
            <p><strong><%= isVi ? "Đơn giá:" : "Price per Ticket:" %></strong> <%= String.format("%,.0f VNĐ", booking.getBasePrice()) %></p>
            
            <% if (booking.getDiscountPercentage() > 0) { %>
                <p class="text-success fw-bold">
                    <%= isVi ? "Đã áp dụng chiết khấu: Giảm 25% (Mua >= 5 vé)" : "Discount Applied: 25% OFF (>= 5 tickets)" %>
                </p>
            <% } %>

            <hr>
            <h5 class="text-danger">
                <strong><%= isVi ? "Tổng tiền thanh toán:" : "Total Price:" %></strong> <%= String.format("%,.0f VNĐ", booking.getTotalPrice()) %>
            </h5>
        </div>
        <div class="card-footer text-end">
            <a href="BookingController" class="btn btn-secondary"><%= isVi ? "Trở về danh sách" : "Back to Shows" %></a>
        </div>
    </div>

</body>
</html>