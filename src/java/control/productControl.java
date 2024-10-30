/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Fproduct;
import entity.product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Set;
import java.util.stream.Collectors;

/**
 *
 * @author tins
 */
public class productControl extends HttpServlet {

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

        // Retrieve parameters from the request
        String typeIdParam = request.getParameter("category");
        String color = request.getParameter("color");
        String size = request.getParameter("size");
        String priceParam = request.getParameter("priceSlider"); // Price range from slider

        // Initialize DAO
        DAO dao = new DAO();
        ArrayList<Fproduct> filteredProducts;

        // Check if any filter parameters are provided
        if (typeIdParam == null && color == null && size == null && (priceParam == null || priceParam.isEmpty())) {
            // No filters applied, retrieve all products
            filteredProducts = dao.getAllFproduct();
        } else {
            // Prepare filter parameters
            Integer typeId = null;
            if (typeIdParam != null && !typeIdParam.equals("-1")) {
                try {
                    typeId = Integer.parseInt(typeIdParam);
                } catch (NumberFormatException e) {
                    typeId = null; // Invalid typeId
                }
            }

            Double maxPrice = null; // Initialize max price
            if (priceParam != null && !priceParam.isEmpty()) {
                try {
                    maxPrice = Double.parseDouble(priceParam);
                } catch (NumberFormatException e) {
                    maxPrice = null; // Handle invalid price format
                }
            }

            // Retrieve filtered products based on provided parameters
            filteredProducts = dao.getFilteredProducts(
                    typeId, // Apply category filter if provided
                    0.0, // Minimum price is always 0.0
                    maxPrice, // Apply max price filter if provided
                    color != null ? color : null, // Apply color filter if provided
                    size != null ? size : null // Apply size filter if provided
            );
        }

        // Extract unique sizes after filtered products are populated
        Set<String> uniqueSizes = filteredProducts.stream()
                .map(Fproduct::getSize) // Adjust according to your Product class
                .filter(sizeValue -> sizeValue != null && !sizeValue.isEmpty()) // Ensure no null or empty sizes
                .collect(Collectors.toSet());

        // Store the unique sizes in a request attribute
        request.setAttribute("uniqueSizes", uniqueSizes);

        // Pass filtered results (or all products) to the JSP page
        request.setAttribute("listproduct", filteredProducts);
        request.getRequestDispatcher("view/JSP/client/product.jsp").forward(request, response);
    }

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
        processRequest(request, response);
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
