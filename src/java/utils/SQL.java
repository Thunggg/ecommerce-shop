/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.*;

/**
 *
 * @author CE181767 - Le Nhut Anh
 */
public class SQL {
    private static final String JDBC_URL = "jdbc:sqlserver://localhost:1433;databaseName=nanh;encrypt=true;trustServerCertificate=true;";
    private static final String USERNAME = "sa";
    private static final String PASSWORD = "123";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
    }

    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void closeStatement(Statement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void closeResultSet(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }

    public static void setParameters(PreparedStatement ps, Object... params) throws SQLException {
        for (int i = 0; i < params.length; i++) {
            ps.setObject(i + 1, params[i]);
        }
    }

    public static int executeUpdate(String query, Object... params) throws SQLException, ClassNotFoundException {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        setParameters(ps, params);
        return ps.executeUpdate();
    }

    public static ResultSet executeQuery(String query, Object... params) throws SQLException, ClassNotFoundException {
        Connection conn = getConnection();
        if (conn != null && !conn.isClosed()) {
            PreparedStatement ps = conn.prepareStatement(query);
            setParameters(ps, params);
            return ps.executeQuery();
        }
        return null;
    }

}
