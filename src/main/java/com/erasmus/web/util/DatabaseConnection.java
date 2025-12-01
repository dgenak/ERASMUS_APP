package com.erasmus.web.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://195.251.249.131:3306/ismgroup29";
    private static final String USER = "ismgroup29";
    private static final String PASSWORD = "r2m$e9";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            throw new RuntimeException("❌ DB connection failed: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("❌ MySQL driver not found!");
        }
    }
}
