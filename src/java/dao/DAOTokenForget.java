/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.TokenForgetPassword;
import entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author HP
 */
public class DAOTokenForget extends DBContext {

    public String getFormatDate(LocalDateTime myDateObj) {
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDate = myDateObj.format(myFormatObj);
        return formattedDate;
    }

    public boolean insertTokenForget(TokenForgetPassword tokenForget) {
        String sql = "INSERT INTO [dbo].[tokenForgetPassword1]\n"
                + "           ([token]\n"
                + "           ,[expiryTime]\n"
                + "           ,[isUsed]\n"
                + "           ,[userId])\n"
                + "     VALUES(?, ?, ?, ?)";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, tokenForget.getToken());
            ps.setTimestamp(2, Timestamp.valueOf(getFormatDate(tokenForget.getExpiryTime())));
            ps.setBoolean(3, tokenForget.isIsUsed());
            ps.setInt(4, tokenForget.getUserId());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public TokenForgetPassword getTokenPassword(String token) {
        String sql = "Select * from [tokenForgetPassword1] where token = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, token);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new TokenForgetPassword(
                        rs.getInt("id"),
                        rs.getInt("userId"),
                        rs.getBoolean("isUsed"),
                        rs.getString("token"),
                        rs.getTimestamp("expiryTime").toLocalDateTime()
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateStatus(TokenForgetPassword token) {
        System.out.println("token = " + token);
        String sql = "UPDATE [dbo].[tokenForgetPassword1]\n"
                + "   SET [isUsed] = ?\n"
                + " WHERE token = ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setBoolean(1, token.isIsUsed());
            st.setString(2, token.getToken());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
