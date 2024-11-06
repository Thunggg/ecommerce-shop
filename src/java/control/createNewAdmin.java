/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import static control.createNewProduct.getCurrentDate;
import dao.admin.DAO;
import entity.user;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Date;

/**
 *
 * @author Nguyen_Tien_Thuan_CE181024
 */
@WebServlet(name = "createNewAdmin", urlPatterns = {"/admin/createNewAdmin"})
@MultipartConfig

public class createNewAdmin extends HttpServlet {

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
            out.println("<title>Servlet createNewAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet createNewAdmin at " + request.getContextPath() + "</h1>");
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
        //CHECK COOKIE
        String username = null;
        Cookie[] c = request.getCookies();
        for (int i = 0; i < c.length; i++) {
            if (c[i].getName().equals("username")) {
                username = c[i].getValue();
                break;
            }
        }
        if (username == null) {
            response.sendRedirect("/admin/login");
            return;
        }
        
        request.getRequestDispatcher("/view/JSP/admin/createAdmin.jsp").forward(request, response);
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
        try {
            DAO dao = new DAO();
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("Email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");

            // Upload anh
            Part part = request.getPart("photo");
            String realPath = request.getServletContext().getRealPath("\\view\\assets\\home\\img\\users");
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }

            String imageLink = "view/assets/home/img/users/" + fileName;

            System.out.println("First Name: " + firstName);
            System.out.println("Last Name: " + lastName);
            System.out.println("Email: " + email);
            System.out.println("Username: " + username);
            System.out.println("Password: " + password);
            System.out.println("Address: " + address);
            System.out.println("Phone: " + phone);
            System.out.println("Link Image: " + realPath + "/" + fileName);
            
            part.write(realPath + "/" + fileName);

            boolean inserAdmin = dao.insertAdmin(firstName, lastName, email, imageLink, username, password, address, phone);

            if (inserAdmin) {
                HttpSession session = request.getSession();
                session.setAttribute("successMessage", "Product added successfully!");
                response.sendRedirect("/admin");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "Failed to add product. Please try again.");
                response.sendRedirect("/admin/createNewAdmin");
            }
        } catch (Exception e) {
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Failed to add product. Please try again.");
            response.sendRedirect("/admin/createNewAdmin");
        }

    }

//    private int id;
//    private String firstName;
//    private String lastName;
//    private String email;
//    private String avatar;
//    private String userName;
//    private String password;
//    private String address;
//    private String phone;
//    private int roledId;
//    private int status;
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
