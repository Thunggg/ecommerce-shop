/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import static context.DBContext.getConnection;
import entity.Card;
import entity.Fproduct;
import entity.User;
import entity.product;
import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.Encryption;

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

    public ArrayList<Card> getAllCard() {
        ArrayList<Card> list = new ArrayList<>();
        String query = "select * from Card";
        try {
            conn = new DBContext().getConnection(); // mo ket noi voi sql sever
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Card(rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDouble(5),
                        rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public ArrayList<Card> getCardsByUserId(int userId) {
        ArrayList<Card> cards = new ArrayList<>();
        String query = "SELECT * FROM Card WHERE user_id = ?";
        try ( Connection conn = getConnection();  PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cards.add(new Card(rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getDouble(5), rs.getInt(6),
                        rs.getString(7), rs.getInt(8)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cards;
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

    public ArrayList<Fproduct> pagingProductF(int curPage) {
        ArrayList<Fproduct> list = new ArrayList<>();
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
            conditions.add("[categoryId] = ?");
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

    public Fproduct getProductbyID(int id) {
        String query = "SELECT * FROM Products WHERE id=?";
        try ( Connection conn = new DBContext().getConnection();  PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Fproduct(
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
                } else {
                    System.out.println("No product found with id: " + id);
                }
            }
        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
        }
        return null;
    }

    public product getProductbyIDF(int id) {
        String query = "SELECT * FROM Products WHERE id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product s = new product(rs.getInt("id"),
                        rs.getString("productname"), rs.getString("images"), rs.getDouble("price"),
                        rs.getString("description"), rs.getInt("stock"), rs.getDouble("discount"), rs.getInt("status"));
                return s;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Fproduct> getRelatedProducts(int categoryId, int excludeProductId) {
        ArrayList<Fproduct> relatedProducts = new ArrayList<>();
        String query = "SELECT TOP 5 * FROM Products "
                + "WHERE categoryId = ? AND id != ? "
                + "ORDER BY NEWID()"; // Randomize the result to show varied products

        try ( Connection conn = new DBContext().getConnection();  PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, categoryId);
            ps.setInt(2, excludeProductId);
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
                relatedProducts.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return relatedProducts;
    }

    public User getUser(String email, String password) {
        User user = null;
        String query = "SELECT * FROM Users WHERE email=? and password=?";
        try ( Connection conn = new DBContext().getConnection();  PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, email);
            ps.setString(2, password);// Set the parameter for the  query
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String firstName = rs.getString("firstname");
                    String lastName = rs.getString("lastname");
                    String avatar = rs.getString("avatar");
                    String username = rs.getString("username");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    int roleId = rs.getInt("roleid");
                    int status = rs.getInt("status");

                    user = new User(id, firstName, lastName, email, avatar, username, password, address, phone, roleId, status);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public int getUserInt(String email) {
        User user = null;
        String query = "SELECT * FROM Users WHERE email=?";
        try ( Connection conn = new DBContext().getConnection();  PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, email);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String firstName = rs.getString("firstname");
                    String lastName = rs.getString("lastname");
                    String avatar = rs.getString("avatar");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    int roleId = rs.getInt("roleid");
                    int status = rs.getInt("status");

                    user = new User(id, firstName, lastName, email, avatar, username, password, address, phone, roleId, status);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user.getId();
    }

    public boolean checkUser(String email, String password) {
        User user = getUser(email, password);
        System.out.println(email);
        System.out.println(password);
        if (user == null && password == null) {
            return false;
        }
//        return Encryption.equalsMD5(password, user.getPassword());
        return true;
    }

    public void insertCard(Card c) {
        String sql = "INSERT INTO Card (product_id, product_name, size, price, stock_quantity, color, user_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, c.getProductId());  // Đảm bảo đúng tên phương thức
            ps.setString(2, c.getProductName());  // Đảm bảo đúng tên phương thức
            ps.setString(3, c.getSize());  // Đảm bảo đúng tên phương thức
            ps.setDouble(4, c.getPrice());  // Đảm bảo giá trị là số thực hợp lệ
            ps.setInt(5, c.getStockQuantity());  // Đảm bảo giá trị là số nguyên hợp lệ
            ps.setString(6, c.getColor());  // Đảm bảo giá trị chuỗi hợp lệ
            ps.setInt(7, c.getUserId());  // Đảm bảo đúng tên phương thức và giá trị hợp lệ
            ps.executeUpdate();  // Thực thi câu lệnh INSERT
        } catch (Exception e) {
            e.printStackTrace();  // Ghi log lỗi chi tiết
        }
    }

    public void insertUser(User user) {
        String query = "INSERT INTO Users (firstname, lastname, email, avatar, username, password, address, phone, roleid, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try ( Connection conn = new DBContext().getConnection();  PreparedStatement ps = conn.prepareStatement(query)) {

            // Set the parameters using the user object's getter methods
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getAvatar());
            ps.setString(5, user.getUsername());
            ps.setString(6, user.getPassword());
            ps.setString(7, user.getAddress());
            ps.setString(8, user.getPhone());
            ps.setInt(9, user.getRoleId());
            ps.setInt(10, user.getStatus());

            // Execute the update
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Log the error if an exception occurs
        }
    }

    public void updateProductQuantity(Card c) {
        // Truy vấn để lấy số lượng còn lại của sản phẩm trong bảng products
        String query = "UPDATE products SET stock = stock - ? WHERE id = ?";

        try ( Connection conn = getConnection();  PreparedStatement ps = conn.prepareStatement(query)) {
            // Set giá trị cho PreparedStatement
            ps.setInt(1, c.getStockQuantity());  // Giảm số lượng theo số lượng trong bảng Card
            ps.setInt(2, c.getProductId());  // Tìm sản phẩm theo ID

            // Thực thi câu lệnh UPDATE
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
//        // Initialize the DAO
//        DAO dao = new DAO();
//
//        // Specify the ID you want to search
//        int productId = 2; // Replace with an actual ID from your database
//
//        // Retrieve the product with the given ID
//        Fproduct produc = dao.getProductbyID(1);
//
//        // Print product details or display a message if not found
//        if (produc != null) {
//            System.out.println("Product found:");
//            System.out.println("ID: " + produc.getId());
//            System.out.println("Name: " + produc.getProductName());
//            System.out.println("Stock: " + produc.getStock());
//            System.out.println("Description: " + produc.getDescription());
//            System.out.println("Images: " + produc.getImages());
//            System.out.println("Discount: " + produc.getDiscount());
//
//            System.out.println("Price: " + produc.getPrice());
//            System.out.println("Status: " + produc.getStatus());
//        } else {
//            System.out.println("No product found with ID: " + productId);
//        }
//        DAO dao = new DAO(); // Create an instance of DAO to access its methods
//        Scanner scanner = new Scanner(System.in);
//
//        // Prompt user for username and password
//        System.out.print("Enter username: ");
//        String username = "vonhuttin123456789@gmail.com";
//
//        System.out.print("Enter password: ");
//        String password = "12345";
//
//        // Check if the username and password are correct
//        int isValidUser = dao.getUserInt(username);
//        System.out.println(isValidUser);
//
//        // Print the result
//        if (isValidUser != 0) {
//            System.out.println("Login successful!");
//        } else {
//            System.out.println("Invalid username or password.");
//        }
//
//        scanner.close();
        DAO cardDAO = new DAO();

        // Retrieve the list of cards
        ArrayList<Card> cards = cardDAO.getAllCard();

        // Print out each card's information
        for (Card card : cards) {
            System.out.println("Product ID: " + card.getProductId());
            System.out.println("Product Name: " + card.getProductName());
            System.out.println("Size: " + card.getSize());
            System.out.println("Price: " + card.getPrice());
            System.out.println("Stock Quantity: " + card.getStockQuantity());
            System.out.println("Color: " + card.getColor());
            System.out.println("User ID: " + card.getUserId());
            System.out.println("-------------");
        }
    }
}
