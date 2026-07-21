package mypack.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LanguageController", urlPatterns = {"/changeLanguage"})
public class LanguageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String lang = request.getParameter("lang");
        HttpSession session = request.getSession();

        if ("vi".equals(lang)) {
            session.setAttribute("lang", "vi");
        } else {
            session.setAttribute("lang", "en");
        }

        String referer = request.getHeader("Referer");
        if (referer != null) {
            response.sendRedirect(referer);
        } else {
            response.sendRedirect("login");
        }
    }
}