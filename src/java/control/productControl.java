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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
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

        DAO dao = new DAO();
        ArrayList<Fproduct> filteredProducts;

        if (typeIdParam == null && color == null && size == null && (priceParam == null || priceParam.isEmpty())) {
            filteredProducts = dao.getAllFproduct();
        } else {
            Integer typeId = null;
            if (typeIdParam != null && !typeIdParam.equals("-1")) {
                try {
                    typeId = Integer.parseInt(typeIdParam);
                } catch (NumberFormatException e) {
                    typeId = null;
                }
            }

            Double maxPrice = null;
            if (priceParam != null && !priceParam.isEmpty()) {
                try {
                    maxPrice = Double.parseDouble(priceParam);
                } catch (NumberFormatException e) {
                    maxPrice = null;
                }
            }

            filteredProducts = dao.getFilteredProducts(
                    typeId,
                    0.0,
                    maxPrice,
                    color != null ? color : null,
                    size != null ? size : null
            );
        }
        String curPage = request.getParameter("index");
        int index;

        if (curPage == null) {
            index = 1;
        } else {
            index = Integer.parseInt(curPage);
        }
        int totalPage = dao.getTotalProduct();
        int soSP = 10;
        int endPage = totalPage / soSP;
        if (totalPage % soSP != 0) {
            endPage++;
        }
        ArrayList<product> listPagingProduct = dao.pagingProduct(index);

        Set<String> uniqueSizes = filteredProducts.stream()
                .map(Fproduct::getSize)
                .filter(sizeValue -> sizeValue != null && !sizeValue.isEmpty())
                .collect(Collectors.toSet());

        request.setAttribute("uniqueSizes", uniqueSizes);
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
            processRequest(request, response);
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
        String curPageParam = request.getParameter("index");
        int index = curPageParam != null ? Integer.parseInt(curPageParam) : 1;

        DAO dao = new DAO();
        List<Fproduct> additionalProducts = new ArrayList<>();

        if ("new".equals(type)) {
            additionalProducts = dao.pagingProductF(index);
        }

        StringBuilder html = new StringBuilder();
        for (Fproduct prod : additionalProducts) {
            html.append("<div class=\"product-card\">");
            html.append("<a href=\"detail?id=").append(prod.getId()).append("\" class=\"product-card\">");
            html.append("<img src=\"").append(prod.getImages()).append("\" alt=\"").append(prod.getProductName()).append("\" class=\"product-image\">");
            html.append("</a>");
            html.append("<div class=\"product-info\">");
            html.append("<h3 class=\"product-title\">").append(prod.getProductName()).append("</h3>");
            html.append("<div class=\"rating\">★★★★☆ 3.5/5</div>");

            // Phần giá sản phẩm
            html.append("<div class=\"gia\">");
            html.append("<div class=\"product-price\">");
            html.append("<span>$").append(prod.getPrice()).append("</span>");
            html.append("</div>");

            // Kiểm tra discount và chỉ hiển thị nếu lớn hơn 0
            if (prod.getDiscount() > 0) {
                html.append("<div class=\"dis\">");
                html.append("<span class=\"discount\">").append((int) (prod.getDiscount() * 100)).append("%</span>");
                html.append("</div>");
            }

            html.append("</div>"); // Đóng div "gia"

            html.append("<div class=\"product-actions\">");
            html.append("<button class=\"btn-buy\">Buy</button>");
            html.append("<button class=\"btn-add-to-cart\">Add to Cart</button>");
            html.append("</div>");
            html.append("</div>");
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
