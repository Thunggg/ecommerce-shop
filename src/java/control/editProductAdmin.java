/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import static control.createNewProduct.getCurrentDate;
import dao.admin.DAO;
import entity.allProduct;
import entity.category;
import entity.supplier;
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
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Nguyen_Tien_Thuan_CE181024
 */
@WebServlet(name = "editProductAdmin", urlPatterns = {"/admin/editProduct"})
@MultipartConfig

public class editProductAdmin extends HttpServlet {

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
            out.println("<title>Servlet editProductAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editProductAdmin at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("id"));
        allProduct product = productDAO.getProductById(id);
        String images = product.getImages();
        String listImages[] = images.split(" ");
        if (listImages.length > 0) {
            String convertedPath = "\\";
            convertedPath += listImages[0].replace("/", "\\");
            product.setImages(convertedPath);
        }

        ArrayList<category> listCategory = productDAO.getAllProductCategory();
        ArrayList<supplier> listSupplier = productDAO.getAllProductSupplier();

        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listSupplier", listSupplier);
        request.setAttribute("product", product);
        request.setAttribute("id", id);

        request.getRequestDispatcher("/view/JSP/admin/editProduct.jsp").forward(request, response);

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

        DAO productDAO = new DAO();
        int id = Integer.parseInt(request.getParameter("productId"));
        allProduct currentProduct = productDAO.getProductById(id);
        String categoryIdAndTypeId = request.getParameter("categoryId");
        String[] numbers = categoryIdAndTypeId.split("-");
        String productName = request.getParameter("productName");
        int supplierId = Integer.parseInt(request.getParameter("supplierId"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        System.out.println(stock);
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        if (discount > 1.0) {
            discount /= 100.0;
        }
        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(numbers[0]);
        int typeId = Integer.parseInt(numbers[1]);
        String colors = request.getParameter("colors");
        int unitSold = 0;
        boolean status = true;
        String listSize = "";
        String dateString = getCurrentDate();
        Date releaseDate = Date.valueOf(dateString);
        String imageLink = "";

        // Lấy các size đã chọn từ checkboxes
        String[] sizesArray = request.getParameterValues("sizes");
        if (sizesArray != null) {
            listSize = String.join(", ", sizesArray);
        }

        // Lấy phần chứa ảnh từ form
        Part part = request.getPart("photo");

        // Đường dẫn thư mục lưu ảnh
        String realPath = request.getServletContext().getRealPath("\\view\\assets\\home\\img\\products");
        String fileName = null;  // Khởi tạo fileName là null

        // Kiểm tra xem người dùng có tải lên ảnh mới không
        if (part != null && part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
            // Nếu có ảnh mới, xử lý lưu ảnh
            fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            imageLink = "view/assets/home/img/products/" + fileName;

            // Tạo thư mục nếu chưa tồn tại
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }

            // Ghi ảnh vào thư mục
            part.write(realPath + "/" + fileName);

            // Cập nhật đường dẫn ảnh vào đối tượng product
            currentProduct.setImages(imageLink);
        } else {
            // Nếu không có ảnh mới, giữ nguyên ảnh cũ
            currentProduct.setImages(productDAO.getProductById(id).getImages());  // Lấy đường dẫn ảnh cũ từ DB
            imageLink = productDAO.getProductById(id).getImages();
        }

        // In thông tin ra console
        System.out.println("Product ID: " + id);
        System.out.println("Category ID and Type ID: " + categoryIdAndTypeId);
        System.out.println("Category ID: " + categoryId);
        System.out.println("Type ID: " + typeId);
        System.out.println("Product Name: " + productName);
        System.out.println("Supplier ID: " + supplierId);
        System.out.println("Stock: " + stock);
        System.out.println("Price: " + price);
        System.out.println("Discount: " + discount);
        System.out.println("Description: " + description);
        System.out.println("Colors: " + colors);
        System.out.println("Unit Sold: " + unitSold);
        System.out.println("Status: " + status);
        System.out.println("Size(s) Selected: " + listSize);
        System.out.println("Release Date: " + releaseDate);
        System.out.println("Image Link: " + currentProduct.getImages());
        System.out.println("File Name: " + fileName);
        System.out.println("Real Path for Image: " + realPath);

        allProduct p = new allProduct(productName, supplierId, categoryId, listSize, stock, description, imageLink, colors, releaseDate, discount, unitSold, price, true, typeId);

        boolean updateProduct = productDAO.updateProduct(p, id);

        if (updateProduct) {
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Product updated successfully!");
            response.sendRedirect("/admin");

        } else {
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Failed to update product. Please try again.");
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
