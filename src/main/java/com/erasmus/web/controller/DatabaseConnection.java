package com.erasmus.web.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/AUEB-DMST";
    private static final String USER = "ismgroup29";
    private static final String PASSWORD = "r2m$e9";

    private static Connection connection = null;

    public static Connection getConnection() {
        if (connection == null) {
            try {
                // Load MySQL driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // Establish connection
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println("✅ Connected to MySQL successfully!");
            } catch (SQLException e) {
                System.err.println("❌ Connection failed: " + e.getMessage());
            } catch (ClassNotFoundException e) {
                System.err.println("❌ MySQL driver not found!");
            }
        }
        return connection;
    }

    public static void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Connection closed.");
            }
        } catch (SQLException e) {
            System.err.println("Error closing connection: " + e.getMessage());
        }
    }
}
