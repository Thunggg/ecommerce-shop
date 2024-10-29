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
        String query = "SELECT * FROM Products";
        try{
            conn = new DBContext().getConnection(); // mo ket noi voi sql sever
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new product(rs.getInt(1), rs.getString(2), rs.getString(8), rs.getDouble(13), rs.getString(7),
                rs.getInt(6), rs.getDouble(11), rs.getInt(14)));
            }
        } catch(Exception e){
            
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
    
    public static void main(String[] args) {
        DAO productDAO = new DAO(); // Tạo đối tượng ProductDAO
        java.util.List<product> products = productDAO.getAllProduct(); // Lấy danh sách sản phẩm

        // Lặp qua danh sách và in thông tin của từng sản phẩm
        for (product x : products) {
            System.out.println(x.getStatus());
        }
    }
}
