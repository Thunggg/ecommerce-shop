/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dao.admin.DAO;
import entity.product;
import entity.user;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Nguyen_Tien_Thuan_CE181024
 */
@WebServlet(name="loadUser", urlPatterns={"/admin/user"})
public class loadUserAdmin extends HttpServlet {
   
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
            out.println("<title>Servlet loadUser</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loadUser at " + request.getContextPath () + "</h1>");
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
        //B1: lay data tu dao
        DAO dao = new DAO();
        ArrayList<user> listUser = dao.getAllUser();
        for(user x : listUser){
            String fullName = x.getFirstName() + " " + x.getLastName();
            x.setLastName(fullName);
        }
        
        // PHAN TRANG
        String curPage = request.getParameter("index");
        int index;
        
        if (curPage == null) {
            index = 1; // Giá trị mặc định là trang đầu tiên
        } else{
            index = Integer.parseInt(curPage);
        }
        
        //b1: get total account
        int totalPage = listUser.size();
        int soSP = 10;
        int endPage = totalPage / soSP;
        if (totalPage % soSP != 0) {
            endPage++;
        }
        ArrayList<user> listPagingProduct = dao.pagingUser(index);
        for(user x : listPagingProduct){
            String fullName = x.getFirstName() + " " + x.getLastName();
            x.setLastName(fullName);
        }
        
        request.setAttribute("listUser", listPagingProduct);
        request.setAttribute("endPage", endPage);
        request.setAttribute("index", index); //trang hien tai
//        request.setAttribute("listUser", listUser); //trang hien tai
        request.getRequestDispatcher("/view/JSP/admin/user.jsp").forward(request, response);
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
        processRequest(request, response);
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
