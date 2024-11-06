/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dao.admin.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Nguyen_Tien_Thuan_CE181024
 */
@WebServlet(name="updateUserStatus", urlPatterns={"/admin/updateUserStatus"})
public class updateUserStatus extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet updateUserStatus</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateUserStatus at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Lấy ID sản phẩm và trạng thái từ yêu cầu
        String userIdParam = request.getParameter("id");
        String statusParam = request.getParameter("status");

        if (userIdParam == null || statusParam == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Trả về mã 400 nếu thiếu tham số
            return;
        }

        // Chuyển đổi giá trị của các tham số
        int userId = Integer.parseInt(userIdParam);
        boolean status = Integer.parseInt(statusParam) == 1;

        // Gọi DAO để cập nhật trạng thái sản phẩm
        DAO dao = new DAO();
        boolean isUpdated = dao.updateUserStatus(userId, status);
        HttpSession session = request.getSession();

        // Trả về kết quả
        if (isUpdated) {
            session.setAttribute("message", "Update successfully");
            session.setAttribute("messageType", "success");
            response.setStatus(HttpServletResponse.SC_OK); // Trả về mã 200 nếu cập nhật thành công
        } else {
            session.setAttribute("message", "Update failed");
            session.setAttribute("messageType", "error");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Trả về mã 400 nếu cập nhật thất bại
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
