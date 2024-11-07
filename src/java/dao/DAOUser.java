/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HP
 */
public class DAOUser extends DBContext {

    public User getUserByEmail(String email) throws SQLException {
        if (getConnection() == null) {
            System.out.println("Database connection is not initialized.");
            return null;
        }

        String sql = "SELECT * FROM [Users] WHERE email = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("email"),
                        rs.getString("avatar"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getInt("roleId"),
                        rs.getInt("status")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getUserById(int userId) {
        String sql = "SELECT * FROM [Users] WHERE id = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("email"),
                        rs.getString("avatar"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getInt("roleId"),
                        rs.getInt("status")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    // Method to update password by email
    public void updatePassword(String email, String password) {
        String sql = "UPDATE [Users] SET password = ? WHERE email = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public static void main(String[] args) throws SQLException {
        // Create an instance of DAOUser
        DAOUser daoUser = new DAOUser();

        String testEmail = "vonhuttin123456789@gmail.com"; 

        User user = daoUser.getUserByEmail(testEmail);

        if (user != null) {
            System.out.println("User found:");
            System.out.println("ID: " + user.getId());
            System.out.println("First Name: " + user.getFirstName());
            System.out.println("Last Name: " + user.getLastName());
            System.out.println("Email: " + user.getEmail());
            System.out.println("Avatar: " + user.getAvatar());
            System.out.println("Username: " + user.getUsername());
            System.out.println("Address: " + user.getAddress());
            System.out.println("Phone: " + user.getPhone());
            System.out.println("Role ID: " + user.getRoleId());
            System.out.println("Status: " + user.getStatus());
        } else {
            System.out.println("No user found with email: " + testEmail);
        }
    }
}
