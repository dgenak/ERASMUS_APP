package com.erasmus.web.controller;

import com.erasmus.web.dao.ForumDAO;
import com.erasmus.web.model.ForumPost;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

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
