package com.erasmus.web.controller;

import com.erasmus.web.dao.ForumDAO;
import com.erasmus.web.model.ForumPost;

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
            throws IOException, ServletException {

        List<ForumPost> posts = forumDAO.getAllPosts();
        String action = request.getParameter("action");

        // Only load posts if action=load
        if ("load".equals(action)) {
            posts = forumDAO.getAllPosts();
            request.setAttribute("posts", posts);
        }

        request.getRequestDispatcher("forum.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

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
                response.sendRedirect("ForumServlet?action=load&status=success");
    }
}
