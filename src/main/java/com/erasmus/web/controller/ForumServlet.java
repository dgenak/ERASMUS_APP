package com.erasmus.web.controller;

import com.erasmus.web.dao.ForumDAO;
import com.erasmus.web.model.ForumPost;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.util.*;

//Database imports 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.erasmus.web.controller.DatabaseConnection;

//@WebServlet("/api/forumPosts")
public class ForumServlet extends HttpServlet {
    private ForumDAO forumDAO = new ForumDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        List<ForumPost> posts = forumDAO.getAllPosts();
        response.setContentType("application/json; charset=UTF-8");
        response.getWriter().write(new Gson().toJson(posts));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        ForumPost post = gson.fromJson(reader, ForumPost.class);

        forumDAO.addPost(post);
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
