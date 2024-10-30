
import dao.DAO;
import entity.product;
import java.util.ArrayList;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Nguyen_Tien_Thuan_CE181024
 */
public class test {
    public static void main(String[] args) {
        DAO dao = new DAO();
        ArrayList<product> list = dao.getAllProduct();
        for(product x : list){
            System.out.println(x.getProductName());
        }
    }
}

