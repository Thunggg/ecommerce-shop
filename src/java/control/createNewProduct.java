/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.admin.DAO;
import entity.allProduct;
import entity.category;
import entity.supplier;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * @author Nguyen_Tien_Thuan_CE181024
 */
@MultipartConfig

public class createNewProduct extends HttpServlet {

    public static String getCurrentDate() {
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return currentDate.format(formatter);
    }

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
            out.println("<title>Servlet createNewProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet createNewProduct at " + request.getContextPath() + "</h1>");
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
        DAO productDAO = new DAO(); // Tạo đối tượng ProductDAO
        ArrayList<category> listCategory = productDAO.getAllProductCategory();
        ArrayList<supplier> listSupplier = productDAO.getAllProductSupplier();

        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listSupplier", listSupplier);

        request.getRequestDispatcher("/view/JSP/admin/createProduct.jsp").forward(request, response);
    }
    private static final String UPLOAD_DIR = "uploads";

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
            // Nhận thông tin từ form
            DAO productDAO = new DAO();
            String categoryIdAndTypeId = request.getParameter("categoryId");
            String[] numbers = categoryIdAndTypeId.split("-");
            int id = productDAO.getNewIdProduct();
            String productName = request.getParameter("productName");
            int supplierId = Integer.parseInt(request.getParameter("supplierId"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            double price = Double.parseDouble(request.getParameter("price"));
            double discount = Double.parseDouble(request.getParameter("discount")) / 100.0;
            String description = request.getParameter("description");
            int categoryId = Integer.parseInt(numbers[0]);
            int typeId = Integer.parseInt(numbers[1]);
            String colors = request.getParameter("colors");
            int unitSold = 0;
            boolean status = true;
            String listSize = "";
            String dateString = getCurrentDate();
            Date releaseDate = Date.valueOf(dateString);

            // Lấy các size đã +chọn (checkboxes)
            String[] sizesArray = request.getParameterValues("sizes");
            if (sizesArray != null) {
                listSize = String.join(", ", sizesArray);
            }

            Part part = request.getPart("photo");
            String realPath = request.getServletContext().getRealPath("\\view\\assets\\home\\img\\products");
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }

            String imageLink = "view/assets/home/img/products/" + fileName;
            part.write(realPath + "/" + fileName);

            allProduct p = new allProduct(productName, supplierId, categoryId, listSize, stock, description, imageLink, colors, releaseDate, discount, unitSold, price, true, typeId);

            boolean insertProduct = productDAO.insertProduct(p);

            if (insertProduct) {
                HttpSession session = request.getSession();
                session.setAttribute("successMessage", "Product added successfully!");
                response.sendRedirect("/admin");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "Failed to add product. Please try again.");
                response.sendRedirect("/admin/create");
            }
        } catch (Exception e) {
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Failed to add product. Please try again.");
            response.sendRedirect("/admin/create");
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
