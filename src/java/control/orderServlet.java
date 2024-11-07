/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Card;
import entity.product;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tins
 */
public class orderServlet extends HttpServlet {

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
        // Set the response content type to HTML with UTF-8 encoding
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginServlet at " + request.getContextPath() + "</h1>");
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
        DAO s = new DAO();
        String email = null;
        Cookie[] cookies = request.getCookies();

        // Lấy email từ cookie
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("email")) {
                    email = cookie.getValue();
                    break;
                }
            }
        }

        if (email != null) {

            // Nếu có email trong cookie, lấy userId từ email
            int userid = s.getUserInt(email);

            // Lấy danh sách các thẻ của user hiện tại
            List<Card> list = s.getCardsByUserId(userid); // Phương thức lọc thẻ theo userId
            request.setAttribute("order", list);

            // Lấy danh sách sản phẩm bán chạy và sản phẩm mới
            DAO dao = new DAO();
            ArrayList<product> lists = dao.getAllProductTopSelling();
            request.setAttribute("ListSell", lists);

            // Chuyển tiếp đến trang JSP
            request.getRequestDispatcher("view/JSP/client/order.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
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
        String type = request.getParameter("type");
        DAO dao = new DAO();
        List<product> additionalProducts;

        if ("new".equals(type)) {
            additionalProducts = dao.getAllProduct(); // Phương thức để lấy thêm sản phẩm mới
        } else {
            additionalProducts = dao.getAllProductTopSelling(); // Phương thức để lấy thêm sản phẩm bán chạy
        }

        StringBuilder html = new StringBuilder();

        for (product prod : additionalProducts) {
            html.append("<div class=\"product-card\">");
            html.append("<a href=\"detail?id=").append(prod.getId()).append("\"><img src=\"")
                    .append(prod.getImages()).append("\" alt=\"").append(prod.getProductName()).append("\"></a>");
            html.append("<a href=\"detail?id=").append(prod.getId()).append("\" class=\"product-title\">")
                    .append(prod.getProductName()).append("</a>");
            html.append("<div class=\"gia\">"); // Thêm phần chứa giá và chiết khấu

            // Hiển thị giá
            html.append("<div class=\"product-price\">")
                    .append("<span>$").append((int) prod.getPrice()).append("</span>") // Cast to int để bỏ phần thập phân
                    .append("</div>");

            // Hiển thị chiết khấu nếu discount > 0
            if (prod.getDiscount() > 0) {
                html.append("<div class=\"dis\">")
                        .append("<span class=\"discount\">").append((int) (prod.getDiscount() * 100)).append("%</span>")
                        .append("</div>");
            }

            html.append("</div>"); // Đóng thẻ gia
            html.append("</div>"); // Đóng thẻ product-card
        }

        response.setContentType("text/html");
        response.getWriter().write(html.toString());
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
