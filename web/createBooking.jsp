<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mypack.models.DramaShow"%>
<%
    String lang = (String) session.getAttribute("lang");
    boolean isVi = "vi".equals(lang);
    DramaShow show = (DramaShow) request.getAttribute("show");
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= isVi ? "Nhập Chi Tiết Đặt Vé" : "Enter Booking Details" %></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">

    <div class="card shadow mx-auto" style="max-width: 500px;">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0"><%= isVi ? "Chi Tiết Đặt Vé" : "Booking Details" %></h4>
        </div>
        <div class="card-body">
            <form action="BookingController" method="post">
                <input type="hidden" name="showId" value="<%= show.getId() %>">
                <input type="hidden" name="showTitle" value="<%= isVi ? show.getTitleVi() : show.getTitleEn() %>">
                <input type="hidden" name="basePrice" value="<%= show.getPricePerTicket() %>">

                <div class="mb-3">
                    <label class="form-label"><%= isVi ? "Vở kịch" : "Drama Show" %></label>
                    <input type="text" class="form-control" value="<%= isVi ? show.getTitleVi() : show.getTitleEn() %>" readonly>
                </div>

                <div class="mb-3">
                    <label class="form-label"><%= isVi ? "Họ và tên" : "Customer Name" %></label>
                    <input type="text" name="customerName" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label"><%= isVi ? "Số lượng vé" : "Number of Tickets" %></label>
                    <input type="number" name="quantity" class="form-control" value="1" min="1" max="20" required>
                    <small class="text-muted"><%= isVi ? "* Mua >= 5 vé tự động giảm 25%" : "* Buy >= 5 tickets to get 25% discount" %></small>
                </div>

                <button type="submit" class="btn btn-success w-100"><%= isVi ? "Xác Nhận Đặt Vé" : "Confirm Booking" %></button>
            </form>
        </div>
    </div>

</body>
</html>