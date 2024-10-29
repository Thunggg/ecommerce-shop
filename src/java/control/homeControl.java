/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nguyen_Tien_Thuan_CE181024
 */
public class homeControl extends HttpServlet {

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
        response.setContentType("application/json;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setDateHeader("Expires", 0); // Proxies
        //B1: lay data tu dao
        DAO dao = new DAO();
        ArrayList<product> list = dao.getAllProduct();
        request.setAttribute("ListP", list);
        ArrayList<product> lists = dao.getAllProductTopSelling();
        request.setAttribute("ListSell", lists);
        request.getRequestDispatcher("view/JSP/client/home.jsp").forward(request, response);
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
        processRequest(request, response);
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

        // Tạo chuỗi HTML từ danh sách sản phẩm
        StringBuilder html = new StringBuilder();
        for (product prod : additionalProducts) {
            html.append("<div class=\"product-card\">");
            html.append("<img src=\"").append(prod.getImages()).append("\" alt=\"").append(prod.getProductName()).append("\">");
            html.append("<a href=\"#\" class=\"product-title\">").append(prod.getProductName()).append("</a>");
            html.append("<p class=\"price\">$").append(prod.getPrice()).append("</p>");
            html.append("</div>");
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
