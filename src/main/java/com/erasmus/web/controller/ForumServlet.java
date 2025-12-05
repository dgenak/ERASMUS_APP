package com.erasmus.web.controller;

import com.erasmus.web.dao.ForumDAO;
import com.erasmus.web.model.ForumPost;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
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

                String title = request.getParameter("postTitle");
                String body = request.getParameter("postBody");

                ForumPost newPost = new ForumPost();
                newPost.setUsername("DemoUser"); // In real app, get from session/auth
                newPost.setTitle(title);
                newPost.setBody(body);
                newPost.setTimestamp(new Date());
                newPost.setLikes(0);
                newPost.setDislikes(0);
                newPost.setReplies(null);
                
                forumDAO.addPost(newPost);
                response.sendRedirect("forum.jsp?status=success");
    }
}
