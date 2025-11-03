package com.erasmus.web.dao;

import java.util.*;

//Database imports 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.erasmus.web.controller.DatabaseConnection;

public class CountryDAO {
 
    Connection conn = DatabaseConnection.getConnection();
    String sql = "SELECT countryName FROM Country";
    

}
