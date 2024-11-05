/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.admin;

import context.DBContext;
import entity.allProduct;
import entity.category;
import entity.product;
import entity.supplier;
import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
        String query = "SELECT * FROM Products";
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

    public ArrayList<category> getAllProductCategory() {
        ArrayList<category> list = new ArrayList<>();
        String query = "SELECT DISTINCT Categories.categoryid, Categories.categoryname, Categories.type_id\n"
                + "FROM Categories INNER JOIN Products ON Categories.categoryid = Products.categoryid";
        try {
            conn = new DBContext().getConnection(); // mo ket noi voi sql sever
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new category(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public ArrayList<supplier> getAllProductSupplier() {
        ArrayList<supplier> list = new ArrayList<>();
        String query = "select * from Suppliers";
        try {
            conn = new DBContext().getConnection(); // mo ket noi voi sql sever
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new supplier(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {

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

    public boolean updateProductStatus(int productId, boolean status) {
        String query = "UPDATE products SET status = ? WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setBoolean(1, status);
            ps.setInt(2, productId);
            int rowsAffected = ps.executeUpdate(); // Chỉ gọi một lần
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            // Đảm bảo giải phóng tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
            }
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
            }
        }
    }

    public int getNewIdProduct() {
        String query = "SELECT COUNT(*) FROM Products";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            // Di chuyển con trỏ đến dòng đầu tiên
            if (rs.next()) {
                return rs.getInt(1) + 1; // Lấy giá trị của COUNT và cộng thêm 1
            }

        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console để dễ dàng kiểm tra
        } finally {
            // Đóng kết nối sau khi truy vấn xong
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return -1; // Trả về -1 nếu có lỗi xảy ra
    }

    public boolean insertProduct(allProduct product) {
        String query = "INSERT INTO Products (productname, supplierid, categoryid, size, stock, description, images, colors, releasedate, discount, unitSold, price, status, typeid) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, product.getProductName());
            ps.setInt(2, product.getSupplierId());
            ps.setInt(3, product.getCategoryId());
            ps.setString(4, product.getSize());
            ps.setInt(5, product.getStock());  // Updated to index 6
            ps.setString(6, product.getDescription());
            ps.setString(7, product.getImages());
            ps.setString(8, product.getColors());
            ps.setDate(9, product.getReleaseDate());
            ps.setDouble(10, product.getDiscount());
            ps.setInt(11, product.getUnitSold());
            ps.setDouble(12, product.getPrice());
            ps.setBoolean(13, product.isStatus());
            ps.setInt(14, product.getTypeId());

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;

        } catch (Exception e) {
            e.printStackTrace();  // Hiển thị chi tiết lỗi
        }
        return false;
    }

    public static void main(String[] args) {
        DAO productDAO = new DAO(); // Tạo đối tượng ProductDAO
        int id = productDAO.getNewIdProduct();
        System.out.println(id);
    }
}
