/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.product;
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
        String query = "SELECT *\n"
                + "FROM products\n"
                + "ORDER BY NEWID();";
        try {
            conn = new DBContext().getConnection(); // mo ket noi voi sql sever
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product(rs.getInt(1), rs.getString(2), rs.getString(8), rs.getDouble(13), rs.getString(6)));
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
                list.add(new product(rs.getInt(1), rs.getString(2), rs.getString(8), rs.getDouble(13), rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace(); // In ra thông tin lỗi để giúp gỡ lỗi
        }
        return list;
    }

    public static void main(String[] args) {
        DAO productDAO = new DAO(); // Tạo đối tượng ProductDAO
        java.util.List<product> products = productDAO.getAllProductTopSelling(); // Lấy danh sách sản phẩm

        // Lặp qua danh sách và in thông tin của từng sản phẩm
        for (product product : products) {
            System.out.println(product.getId() + " " + product.getProductName());

        }
    }
}
