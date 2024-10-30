/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Fproduct;
import entity.product;
import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Nguyen_Tien_Thuan_CE181024
 */
public class DAO {

    Connection conn = null; // ket noi voi sql
    PreparedStatement ps = null; // chuyen cau lenh sang sql 
    ResultSet rs = null; //nhan ket qua tra ve

    public ArrayList<product> getAllProduct() {
        ArrayList<product> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "FROM products\n"
                + "ORDER BY NEWID();";
        try {
            conn = new DBContext().getConnection(); // mo ket noi voi sql sever
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new product(rs.getInt(1), rs.getString(2), rs.getString(8), rs.getDouble(13), rs.getString(7),
                        rs.getInt(6), rs.getDouble(11), rs.getInt(14)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public ArrayList<product> getAllProductTopSelling() {
        ArrayList<product> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "FROM Products\n"
                + "WHERE discount > 0\n"
                + "ORDER BY NEWID()";
        try {
            conn = new DBContext().getConnection(); // mo ket noi voi sql sever
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product(rs.getInt(1), rs.getString(2), rs.getString(8), rs.getDouble(13), rs.getString(7),
                        rs.getInt(6), rs.getDouble(11), rs.getInt(14)));
            }
        } catch (Exception e) {
            e.printStackTrace(); // In ra thông tin lỗi để giúp gỡ lỗi
        }
        return list;
    }

    public int getTotalProduct() {

        String query = "select count(*) from Products";
        try {
            conn = new DBContext().getConnection(); // mo ket noi voi sql sever
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public ArrayList<product> pagingProduct(int curPage) {
        ArrayList<product> list = new ArrayList<>();
        String query = "select * from Products\n"
                + "order by id\n"
                + "offset ? rows fetch next 10 rows only";
        try {
            conn = new DBContext().getConnection(); // mo ket noi voi sql sever
            ps = conn.prepareStatement(query);
//            CT tinh off set = ( so trang - 1 ) * so san pham
            int offSet = (curPage - 1) * 10;
            ps.setInt(1, offSet);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product(rs.getInt(1), rs.getString(2), rs.getString(8), rs.getDouble(13), rs.getString(7),
                        rs.getInt(6), rs.getDouble(11), rs.getInt(14)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public ArrayList<Fproduct> getAllFproduct() {
        ArrayList<Fproduct> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "FROM products\n"
                + "ORDER BY NEWID();";
        try {
            conn = new DBContext().getConnection(); // mo ket noi voi sql sever
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);             // Product ID
                String productName = rs.getString(2); // Product Name
                int supplierId = rs.getInt(3);     // Supplier ID (make sure to get the correct column index)
                int categoryId = rs.getInt(4);     // Category ID (make sure to get the correct column index)
                String size = rs.getString(5);      // Size (make sure to get the correct column index)
                int stock = rs.getInt(6);           // Stock
                String description = rs.getString(7); // Description
                String images = rs.getString(8);    // Images
                String colors = rs.getString(9);     // Colors
                String releaseDate = rs.getString(10); // Release date
                double discount = rs.getDouble(11);  // Discount
                int unitSold = rs.getInt(12);       // Units sold
                double price = rs.getDouble(13);     // Price
                int status = rs.getInt(14);         // Status
                int typeId = rs.getInt(15);         // Type ID

                // Create a new Fproduct instance and add it to the list
                list.add(new Fproduct(id, productName, supplierId, categoryId, size, stock,
                        description, images, colors, releaseDate, discount,
                        unitSold, price, status, typeId));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public ArrayList<Fproduct> getFilteredProducts(Integer categoryId, Double minPrice, Double maxPrice, String color, String size) {
        ArrayList<Fproduct> productList = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT TOP (1000) * FROM [ClotheShop].[dbo].[Products]");
        ArrayList<String> conditions = new ArrayList<>();

        // Add conditions based on provided parameters
        if (categoryId != null) {
            conditions.add("[typeid] = ?");
        }
        if (minPrice != null && maxPrice != null) {
            conditions.add("[price] BETWEEN ? AND ?");
        } else if (minPrice != null) {
            conditions.add("[price] >= ?");
        } else if (maxPrice != null) {
            conditions.add("[price] <= ?");
        }
        if (color != null && !color.isEmpty()) {
            conditions.add("[colors] LIKE ?");
        }
        if (size != null && !size.isEmpty()) {
            conditions.add("[size] = ?");
        }

        // Append WHERE clause if there are any conditions
        if (!conditions.isEmpty()) {
            query.append(" WHERE ").append(String.join(" AND ", conditions));
        }

        try ( Connection conn = new DBContext().getConnection();  PreparedStatement ps = conn.prepareStatement(query.toString())) {
            int paramIndex = 1;

            // Set parameters based on provided filters
            if (categoryId != null) {
                ps.setInt(paramIndex++, categoryId);
            }
            if (minPrice != null && maxPrice != null) {
                ps.setDouble(paramIndex++, minPrice);
                ps.setDouble(paramIndex++, maxPrice);
            } else if (minPrice != null) {
                ps.setDouble(paramIndex++, minPrice);
            } else if (maxPrice != null) {
                ps.setDouble(paramIndex++, maxPrice);
            }
            if (color != null && !color.isEmpty()) {
                ps.setString(paramIndex++, "%" + color + "%");
            }
            if (size != null && !size.isEmpty()) {
                ps.setString(paramIndex++, size);
            }

            // Execute the query
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Fproduct product = new Fproduct(
                        rs.getInt("id"),
                        rs.getString("productname"),
                        rs.getInt("supplierid"),
                        rs.getInt("categoryid"),
                        rs.getString("size"),
                        rs.getInt("stock"),
                        rs.getString("description"),
                        rs.getString("images"),
                        rs.getString("colors"),
                        rs.getString("releasedate"),
                        rs.getDouble("discount"),
                        rs.getInt("unitSold"),
                        rs.getDouble("price"),
                        rs.getInt("status"),
                        rs.getInt("typeid")
                );
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    public static void main(String[] args) {
        DAO productDAO = new DAO(); // Tạo đối tượng ProductDAO
    }
}
