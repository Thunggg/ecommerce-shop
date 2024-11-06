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
import entity.user;
import java.awt.List;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

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

    public allProduct getProductById(int id) {
        String query = "SELECT * FROM Products WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            // Kiểm tra nếu có dữ liệu trong ResultSet
            if (rs.next()) {
                return new allProduct(rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getDate(10),
                        rs.getDouble(11), rs.getInt(12), rs.getDouble(13), rs.getBoolean(14),
                        rs.getInt(15));
            } else {
                System.out.println("No product found with ID: " + id);
            }
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để biết rõ nguyên nhân
        }
        return null;
    }

    public boolean updateProduct(allProduct product, int id) {
        String query = "UPDATE Products SET productname = ?, supplierid = ?, categoryid = ?, size = ?, stock = ?, description = ?, images = ?, colors = ?, releasedate = ?, discount = ?, unitSold = ?, price = ?, status = ?, typeid = ? \n"
                + "WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            // Gán các tham số vào câu lệnh
            ps.setString(1, product.getProductName());
            ps.setInt(2, product.getSupplierId());
            ps.setInt(3, product.getCategoryId());
            ps.setString(4, product.getSize());
            ps.setInt(5, product.getStock());
            ps.setString(6, product.getDescription());
            ps.setString(7, product.getImages());
            ps.setString(8, product.getColors());
            ps.setDate(9, product.getReleaseDate());
            ps.setDouble(10, product.getDiscount());
            ps.setInt(11, product.getUnitSold());
            ps.setDouble(12, product.getPrice());
            ps.setBoolean(13, product.isStatus());
            ps.setInt(14, product.getTypeId());
            ps.setInt(15, id); // Gán ID sản phẩm để cập nhật

            int rowsUpdated = ps.executeUpdate(); // Thực thi câu lệnh
            return rowsUpdated > 0; // Trả về true nếu có dòng được cập nhật

        } catch (Exception e) {
            e.printStackTrace(); // Hiển thị chi tiết lỗi
        } finally {
            // Đảm bảo đóng kết nối và giải phóng tài nguyên
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return false; // Trả về false nếu có lỗi xảy ra
    }

    public boolean deleteProductById(int id) {
        String query = "delete Products where id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public ArrayList<user> getAllUser() {
        ArrayList<user> list = new ArrayList<>();
        String query = "select * from Users\n"
                + "where roleid = 2";
        try {
            conn = new DBContext().getConnection(); // mo ket noi voi sql sever
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new user(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public ArrayList<user> pagingUser(int curPage) {
        ArrayList<user> list = new ArrayList<>();
        String query = "select * from Users\n"
                + "where roleid = 2\n"
                + "order by id\n"
                + "offset ? rows fetch next 10 rows only;";
        try {
            conn = new DBContext().getConnection(); // mo ket noi voi sql sever
            ps = conn.prepareStatement(query);
//            CT tinh off set = ( so trang - 1 ) * so san pham
            int offSet = (curPage - 1) * 10;
            ps.setInt(1, offSet);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new user(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public boolean deleteUserById(int id) {
        String query = "delete Users where id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);

            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean updateUserStatus(int productId, boolean status) {
        String query = "UPDATE Users SET status = ? WHERE id = ?";
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

    public ArrayList<user> getAllAdmin() {
        ArrayList<user> list = new ArrayList<>();
        String query = "select * from Users\n"
                + "where roleid = 1";
        try {
            conn = new DBContext().getConnection(); // mo ket noi voi sql sever
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new user(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public ArrayList<user> pagingAdmin(int curPage) {
        ArrayList<user> list = new ArrayList<>();
        String query = "select * from Users\n"
                + "where roleid = 1\n"
                + "order by id\n"
                + "offset ? rows fetch next 10 rows only;";
        try {
            conn = new DBContext().getConnection(); // mo ket noi voi sql sever
            ps = conn.prepareStatement(query);
//            CT tinh off set = ( so trang - 1 ) * so san pham
            int offSet = (curPage - 1) * 10;
            ps.setInt(1, offSet);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new user(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public boolean insertAdmin(String firstname, String lastname, String email, String avatar, String username, String password, String address, String phone) {
        String query = "INSERT INTO Users (firstname, lastname, email, avatar, username, password, address, phone, roleid, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, email);
            ps.setString(4, avatar);
            ps.setString(5, username);
            ps.setString(6, password);
            ps.setString(7, address);
            ps.setString(8, phone);
            ps.setInt(9, 1);
            ps.setBoolean(10, true);

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;

        } catch (Exception e) {
            e.printStackTrace();  // Hiển thị chi tiết lỗi
        }
        return false;
    }

    public user getAdminById(int id) {
        String query = "SELECT * FROM Users WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            // Kiểm tra nếu có dữ liệu trong ResultSet
            if (rs.next()) {
                return new user(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11));
            } else {
                System.out.println("No product found with ID: " + id);
            }
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để biết rõ nguyên nhân
        }
        return null;

    }

    public boolean updateAdmin(String firstname, String lastname, String email, String avatar, String username, String password, String address, String phone, int id) {
        String query = "UPDATE users SET firstname = ?, lastname = ?, email = ?, avatar = ?, username = ?, password = ?, address = ?, phone = ? WHERE id = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            // Gán các tham số vào câu lệnh
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, email);
            ps.setString(4, avatar);
            ps.setString(5, username);
            ps.setString(6, password);
            ps.setString(7, address);
            ps.setString(8, phone);
            ps.setInt(9, id);

            int rowsUpdated = ps.executeUpdate(); // Thực thi câu lệnh
            return rowsUpdated > 0; // Trả về true nếu có dòng được cập nhật

        } catch (Exception e) {
            e.printStackTrace(); // Hiển thị chi tiết lỗi
        } finally {
            // Đảm bảo đóng kết nối và giải phóng tài nguyên
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return false; // Trả về false nếu có lỗi xảy ra
    }
    
    public user getAccount(String username) {
        user account = null;
        String query = "SELECT * FROM Users WHERE username=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new user(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getString(9), rs.getInt(10), rs.getInt(11));
            }
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean checkAccount(String username, String password) {
        user a = getAccount(username);
        
        if (a == null) {
            return false;
        }
//        return Encryption.equalsMD5(password, a.getPassword());
        return password.equals(a.getPassword());
    }
    
    
    public static void main(String[] args) {
        DAO dao = new DAO(); // Tạo đối tượng DAO
        ArrayList<user> u = dao.getAllUser();
        for (user x : u) {
            System.out.println(x);
        }
    }

}
