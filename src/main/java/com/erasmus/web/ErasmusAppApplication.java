package com.erasmus.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.erasmus.web.controller.DatabaseConnection;
import java.sql.Connection;

@SpringBootApplication
public class ErasmusAppApplication {

    public static void main(String[] args) {

        Connection conn = DatabaseConnection.getConnection();
        if (conn != null) {
            try {
                if (conn.isValid(2)) {
                    System.out.println("✅ Connection verified and active!");
                } else {
                    System.out.println("⚠️ Connection could not be verified.");
                }
            } catch (Exception e) {
                System.err.println("Error verifying connection: " + e.getMessage());
            }
        } else {
            System.out.println("❌ Connection object is null. Database not connected.");
        }

        SpringApplication.run(ErasmusAppApplication.class, args);
    }
}
