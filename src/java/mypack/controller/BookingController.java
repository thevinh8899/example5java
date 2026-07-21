package mypack.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mypack.models.BookingForm;
import mypack.models.DramaShow;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "BookingController", urlPatterns = {"/BookingController"})
public class BookingController extends HttpServlet {

    private static final List<DramaShow> SHOWS = new ArrayList<>();

    static {
        SHOWS.add(new DramaShow(1, "The Phantom of the Opera", "Bóng Ma Trong Nhà Hát", "Grand Theater", 500000, "20:00 - 25/11/2026"));
        SHOWS.add(new DramaShow(2, "Les Misérables", "Những Người Khốn Khổ", "City Playhouse", 400000, "19:30 - 28/11/2026"));
        SHOWS.add(new DramaShow(3, "Hamlet", "Hamlet", "Globe Cultural Center", 350000, "18:00 - 30/11/2026"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userSession") == null) {
            response.sendRedirect("login");
            return;
        }

        String action = request.getParameter("action");

        if ("book".equals(action)) {
            int showId = Integer.parseInt(request.getParameter("id"));
            DramaShow selectedShow = SHOWS.stream().filter(s -> s.getId() == showId).findFirst().orElse(null);

            request.setAttribute("show", selectedShow);
            request.getRequestDispatcher("createBooking.jsp").forward(request, response);
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            request.setAttribute("currentDate", sdf.format(new Date()));
            request.setAttribute("shows", SHOWS);
            request.getRequestDispatcher("shows.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userSession") == null) {
            response.sendRedirect("login");
            return;
        }

        BookingForm booking = new BookingForm();
        booking.setShowId(Integer.parseInt(request.getParameter("showId")));
        booking.setShowTitle(request.getParameter("showTitle"));
        booking.setBasePrice(Double.parseDouble(request.getParameter("basePrice")));
        booking.setCustomerName(request.getParameter("customerName"));
        booking.setEmail(request.getParameter("email"));
        booking.setQuantity(Integer.parseInt(request.getParameter("quantity")));

        request.setAttribute("booking", booking);
        request.getRequestDispatcher("bookingDetails.jsp").forward(request, response);
    }
}