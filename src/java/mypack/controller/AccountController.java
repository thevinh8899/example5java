package mypack.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "AccountController", urlPatterns = {"/AccountController", "/login", "/logout"})
public class AccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getServletPath();
        if ("/logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) session.invalidate();
            response.sendRedirect("login");
            return;
        }

        Cookie[] cookies = request.getCookies();
        String rememberedUser = "";
        int visitCount = 1;

        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("rememberedUser".equals(c.getName())) {
                    rememberedUser = c.getValue();
                }
                if ("visitCount".equals(c.getName())) {
                    try {
                        visitCount = Integer.parseInt(c.getValue()) + 1;
                    } catch (NumberFormatException e) {
                        visitCount = 1;
                    }
                }
            }
        }
        Cookie visitCookie = new Cookie("visitCount", String.valueOf(visitCount));
        visitCookie.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(visitCookie);
        if (visitCount == 1) {
            request.setAttribute("visitorMessageEn", "Welcome to our Entertainment Booking System!");
            request.setAttribute("visitorMessageVi", "Chào mừng bạn đến với Hệ thống đặt vé giải trí!");
        } else if (visitCount >= 5) {
            request.setAttribute("visitorMessageEn", "Soon!! You will receive a gift item");
            request.setAttribute("visitorMessageVi", "Sắp rồi!! Bạn sẽ nhận được một món quà");
        }

        request.setAttribute("rememberedUser", rememberedUser);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        if ("user".equals(user) && "123".equals(pass)) {
            Cookie userCookie = new Cookie("rememberedUser", user);
            userCookie.setMaxAge(30 * 24 * 60 * 60);
            response.addCookie(userCookie);

            HttpSession session = request.getSession();
            session.setAttribute("userSession", user);

            response.sendRedirect("BookingController");
        } else {
            request.setAttribute("errorEn", "Invalid username or password!");
            request.setAttribute("errorVi", "Tên đăng nhập hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}