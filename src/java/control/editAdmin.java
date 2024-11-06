/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.admin.DAO;
import entity.allProduct;
import entity.category;
import entity.supplier;
import entity.user;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;

/**
 *
 * @author Nguyen_Tien_Thuan_CE181024
 */
@WebServlet(name = "editAdmin", urlPatterns = {"/admin/editAdmin"})
@MultipartConfig

public class editAdmin extends HttpServlet {

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
            out.println("<title>Servlet editAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editAdmin at " + request.getContextPath() + "</h1>");
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

        DAO dao = new DAO(); // Tạo đối tượng ProductDAO

        String userID = request.getParameter("id");
        int id = Integer.parseInt(userID);
        user currentUser = dao.getAdminById(id);
        request.setAttribute("currentUser", currentUser);
        request.getRequestDispatcher("/view/JSP/admin/editAdmin.jsp").forward(request, response);
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
//        try {
//            DAO dao = new DAO();
//            int id = Integer.parseInt(request.getParameter("userId"));
//            System.out.println(id);
//            String firstName = request.getParameter("firstName");
//            String lastName = request.getParameter("lastName");
//            String email = request.getParameter("Email");
//            String username = request.getParameter("username");
//            String password = request.getParameter("password");
//            String address = request.getParameter("address");
//            String phone = request.getParameter("phone");
//            String imageLink = "";
//            user currentAdmin = dao.getAdminById(id);
//
//            // Lấy phần chứa ảnh từ form
//            Part part = request.getPart("photo");
//
//            // Đường dẫn thư mục lưu ảnh
//            String realPath = request.getServletContext().getRealPath("\\view\\assets\\home\\img\\users");
//            String fileName = null;  // Khởi tạo fileName là null
//
//            // Kiểm tra xem người dùng có tải lên ảnh mới không
//            if (part != null && part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
//                // Nếu có ảnh mới, xử lý lưu ảnh
//                fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//                imageLink = "view/assets/home/img/users/" + fileName;
//
//                // Tạo thư mục nếu chưa tồn tại
//                if (!Files.exists(Paths.get(realPath))) {
//                    Files.createDirectories(Paths.get(realPath));
//                }
//
//                // Ghi ảnh vào thư mục
//                part.write(realPath + "/" + fileName);
//
//                // Cập nhật đường dẫn ảnh vào đối tượng product
//                currentAdmin.setAvatar(imageLink);
//            } else {
//                // Nếu không có ảnh mới, giữ nguyên ảnh cũ
//                currentAdmin.setAvatar(dao.getAdminById(id).getAvatar());  // Lấy đường dẫn ảnh cũ từ DB
//                imageLink = dao.getAdminById(id).getAvatar();
//            }
//
//            System.out.println("User Details:");
//            System.out.println("ID: " + id);
//            System.out.println("First Name: " + firstName);
//            System.out.println("Last Name: " + lastName);
//            System.out.println("Email: " + email);
//            System.out.println("Username: " + username);
//            System.out.println("Password: " + password);
//            System.out.println("Address: " + address);
//            System.out.println("Phone: " + phone);
//            System.out.println("Image Link: " + imageLink);
//
//            boolean updateAdmin = dao.updateAdmin(firstName, lastName, email, email, username, password, address, phone, id);
//
//            if (updateAdmin) {
//                HttpSession session = request.getSession();
//                session.setAttribute("successMessage", "Product updated successfully!");
//                response.sendRedirect("/admin");
//
//            } else {
//                HttpSession session = request.getSession();
//                session.setAttribute("errorMessage", "Failed to update product. Please try again.");
//                response.sendRedirect("/admin/editAdmin");
//            }
//        } catch (Exception e) {
//            HttpSession session = request.getSession();
//            session.setAttribute("errorMessage", "Failed to update product. Please try again.");
//            response.sendRedirect("/admin/editAdmin");
//        }

        DAO dao = new DAO();
        int id = Integer.parseInt(request.getParameter("userId"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("Email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String imageLink = "";
        user currentAdmin = dao.getAdminById(id);

        // Lấy phần chứa ảnh từ form
        Part part = request.getPart("photo");

        // Đường dẫn thư mục lưu ảnh
        String realPath = request.getServletContext().getRealPath("\\view\\assets\\home\\img\\users");
        String fileName = null;  // Khởi tạo fileName là null

        // Kiểm tra xem người dùng có tải lên ảnh mới không
        if (part != null && part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
            // Nếu có ảnh mới, xử lý lưu ảnh
            fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            imageLink = "view/assets/home/img/users/" + fileName;

            // Tạo thư mục nếu chưa tồn tại
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }

            // Ghi ảnh vào thư mục
            part.write(realPath + "/" + fileName);

            // Cập nhật đường dẫn ảnh vào đối tượng product
            currentAdmin.setAvatar(imageLink);
        } else {
            // Nếu không có ảnh mới, giữ nguyên ảnh cũ
            currentAdmin.setAvatar(dao.getAdminById(id).getAvatar());  // Lấy đường dẫn ảnh cũ từ DB
            imageLink = dao.getAdminById(id).getAvatar();
        }
        
        
        boolean updateAdmin = dao.updateAdmin(firstName, lastName, email, imageLink, username, password, address, phone, id);

        if (updateAdmin) {
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Product updated successfully!");
            response.sendRedirect("/admin");

        } else {
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Failed to update product. Please try again.");
            response.sendRedirect("/admin/editAdmin");
        }

        System.out.println("User Details:");
        System.out.println("ID: " + id);
        System.out.println("First Name: " + firstName);
        System.out.println("Last Name: " + lastName);
        System.out.println("Email: " + email);
        System.out.println("Username: " + username);
        System.out.println("Password: " + password);
        System.out.println("Address: " + address);
        System.out.println("Phone: " + phone);
        System.out.println(imageLink);
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
