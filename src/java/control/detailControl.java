/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Card;
import entity.Fproduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author tins
 */
public class detailControl extends HttpServlet {

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
            out.println("<title>Servlet detailControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet detailControl at " + request.getContextPath() + "</h1>");
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
        String catID = request.getParameter("id");
        int id;
        DAO prodao = new DAO();
        String email = null;
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("email")) {
                    email = cookie.getValue();
                    break;
                }
            }
        }
        if (email == null) {
            response.sendRedirect("login");
            return;
        } else {
            try {
                id = Integer.parseInt(catID);
                Fproduct productDetail = prodao.getProductbyID(id);

                if (productDetail != null) {
                    // Lấy danh sách các sản phẩm liên quan
                    ArrayList<Fproduct> relatedProducts = prodao.getRelatedProducts(productDetail.getCategoryId(), id);

                    // Gửi sản phẩm chi tiết và danh sách sản phẩm liên quan đến trang JSP
                    request.setAttribute("detail", productDetail);
                    request.setAttribute("relatedProducts", relatedProducts);
                    request.getRequestDispatcher("/view/JSP/client/detail.jsp").forward(request, response);
                } else {
                    response.sendRedirect("home");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String size = request.getParameter("size");
        String price = request.getParameter("price");
        String color = request.getParameter("color");
        String quantity = request.getParameter("quantity");

        String email = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("email")) {
                    email = cookie.getValue();
                    break;
                }
            }
        }

        DAO prodao = new DAO();
        int userID = prodao.getUserInt(email);
        try {
            // Tạo đối tượng Card từ các tham số đã nhận
            Card c = new Card(Integer.parseInt(productId), productName, size,
                    Double.parseDouble(price), Integer.parseInt(quantity), color, userID);

            // Thêm đối tượng Card vào giỏ hàng (bảng Card)
            prodao.insertCard(c);
            System.out.println("Card inserted successfully for user ID: " + userID);

            // Cập nhật lại số lượng sản phẩm trong bảng products
            prodao.updateProductQuantity(c);  // Gọi phương thức cập nhật số lượng sản phẩm

            // Chuyển hướng người dùng đến trang "order"
            response.sendRedirect("order");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error during card insertion for user ID: " + userID);
            response.getWriter().write("Error during insertion.");
        }
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
