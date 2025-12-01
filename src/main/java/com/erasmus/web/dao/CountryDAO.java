package com.erasmus.web.dao;

import com.erasmus.web.model.Country;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CountryDAO {

    private static final String JDBC_URL =
        "jdbc:mysql://195.251.249.131:3306/ismgroup29?useSSL=false&serverTimezone=UTC";

    private static final String JDBC_USER = "ismgroup29";
    private static final String JDBC_PASSWORD = "r2m$e9";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

    public List<Country> getAllCountries() {
        List<Country> list = new ArrayList<>();

        String sql = "SELECT countryId, countryName FROM country ORDER BY countryName ASC";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                list.add(new Country(
                        rs.getInt("countryId"),
                        rs.getString("countryName")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
