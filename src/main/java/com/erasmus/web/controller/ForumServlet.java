package com.erasmus.web.controller;

import com.erasmus.web.dao.ForumDAO;
import com.erasmus.web.dao.ReplyDAO;
import com.erasmus.web.model.Post;
import com.erasmus.web.model.Reply;
import com.erasmus.web.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class ForumServlet extends HttpServlet {

    private ForumDAO forumDAO = new ForumDAO();
    private ReplyDAO replyDAO = new ReplyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action");
        Map<Integer, List<Reply>> repliesMap = new HashMap<>();


        if ("load".equals(action)) {
            List<Post> posts = forumDAO.getAllPosts();

            for (Post p : posts) {
                List<Reply> replies = replyDAO.getReplies(p.getPostId());
                repliesMap.put(p.getPostId(), replies);
            }
            request.setAttribute("posts", posts);
            request.setAttribute("repliesMap", repliesMap);
        }

        request.getRequestDispatcher("forum.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

                HttpSession session = request.getSession(false);
                User user = (session != null) ? (User) session.getAttribute("authUser") : null;

                if (user == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }


                int userId = user.getUserId();  
                String username = user.getUsername();
                String title = request.getParameter("postTitle");
                String body = request.getParameter("postBody");
                String type = request.getParameter("postType");

                if (title == null || title.trim().isEmpty()) {
                    response.sendRedirect("forum.jsp?status=error&reason=MISSING_FIELDS");
                    return;
                }

                if (body == null || body.trim().isEmpty()) {
                    response.sendRedirect("forum.jsp?status=error&reason=MISSING_FIELDS");
                    return;
                }

                Post newPost = new Post();
                newPost.setUserId(userId);             
                newPost.setUsername(username); 
                newPost.setTitle(title);
                newPost.setBody(body);
                newPost.setPostType(type);
                newPost.setTimestamp(new Date());
                newPost.setLikes(0);
                newPost.setDislikes(0);

                try {
                    boolean success = forumDAO.addPost(newPost);
                    if (success) {
                        response.sendRedirect("forum.jsp?status=success"); 
                    } else {
                        response.sendRedirect("forum.jsp?status=error&reason=DB_ERROR");
                    }
                } catch (RuntimeException e) {

                    String reason = e.getMessage();
                    response.sendRedirect("forum.jsp?status=error&reason" + reason);
                }
                


    }
}
