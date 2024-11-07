/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAOTokenForget;
import dao.DAOUser;
import entity.TokenForgetPassword;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

/**
 *
 * @author HP
 */
@WebServlet(name = "resetPassword", urlPatterns = {"/resetPassword"})
public class resetPassword extends HttpServlet {

    DAOTokenForget DAOToken = new DAOTokenForget();
    DAOUser DAOUser = new DAOUser();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet resetPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet resetPassword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");
        HttpSession session = request.getSession();
        if (token != null) {
            TokenForgetPassword tokenForgetPassword = DAOToken.getTokenPassword(token);
            resetService service = new resetService();
            if (tokenForgetPassword == null) {
                request.setAttribute("mess", "token invalid");
                request.getRequestDispatcher("view/JSP/client/requestPassword.jsp").forward(request, response);
                return;
            }
            if (tokenForgetPassword.isIsUsed()) {
                request.setAttribute("mess", "token is used");
                request.getRequestDispatcher("view/JSP/client/requestPassword.jsp").forward(request, response);
                return;
            }
            if (service.isExpireTime(tokenForgetPassword.getExpiryTime())) {
                request.setAttribute("mess", "token is expiry time");
                request.getRequestDispatcher("view/JSP/client/requestPassword.jsp").forward(request, response);
                return;
            }
            User user = DAOUser.getUserById(tokenForgetPassword.getUserId());
            request.setAttribute("email", user.getEmail());
            session.setAttribute("token", tokenForgetPassword.getToken());
            request.getRequestDispatcher("view/JSP/client/resetPassword.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("view/JSP/client/requestPassword.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("mess", "Confirm password must be the same as password");
            request.setAttribute("email", email);
            request.getRequestDispatcher("view/JSP/client/resetPassword.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        String tokenStr = (String) session.getAttribute("token");
        TokenForgetPassword tokenForgetPassword = DAOToken.getTokenPassword(tokenStr);
        resetService service = new resetService();

        if (tokenForgetPassword == null) {
            request.setAttribute("mess", "Token invalid");
            request.getRequestDispatcher("view/JSP/client/requestPassword.jsp").forward(request, response);
            return;
        }
        if (tokenForgetPassword.isIsUsed()) {
            request.setAttribute("mess", "Token has been used");
            request.getRequestDispatcher("view/JSP/client/requestPassword.jsp").forward(request, response);
            return;
        }
        if (service.isExpireTime(tokenForgetPassword.getExpiryTime())) {
            request.setAttribute("mess", "Token has expired");
            request.getRequestDispatcher("view/JSP/client/requestPassword.jsp").forward(request, response);
            return;
        }

        tokenForgetPassword.setToken(tokenStr);
        tokenForgetPassword.setIsUsed(true);

        DAOUser.updatePassword(email, password);
        DAOToken.updateStatus(tokenForgetPassword);

        Cookie userCookie = new Cookie("username", email);
        userCookie.setMaxAge(60 * 60 * 24);
        response.addCookie(userCookie);

        response.sendRedirect("login");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
