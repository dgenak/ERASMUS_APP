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
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class ReplyServlet extends HttpServlet {
    
    private ReplyDAO replyDAO = new ReplyDAO();
    private ForumDAO forumDAO = new ForumDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
            String postId = request.getParameter("postId");

            int IntPostId = Integer.parseInt(postId);
            Post post = forumDAO.getPostById(IntPostId);
            
            List<Reply> replies = replyDAO.getReplies(IntPostId);

            request.setAttribute("replies", replies);
            request.setAttribute("post", post);

            request.getRequestDispatcher("question.jsp").forward(request, response);
        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {

            HttpSession session = request.getSession(false);
            User user = (session != null) ? (User) session.getAttribute("authUser") : null;

            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            int userId = user.getUserId();  
            String username = user.getUsername();
            String postId = request.getParameter("postId");
            String body = request.getParameter("replyBody");

            if (body == null || body.trim().isEmpty()) {
                response.sendRedirect("forum.jsp?status=error&reason=MISSING_FIELDS");
                return;
            }

            if (postId == null || postId.trim().isEmpty()) {
                response.sendRedirect("forum.jsp?status=error&reason=MISSING_FIELDS");
                return;
            }

            Reply reply = new Reply();
            reply.setQuestionId(Integer.parseInt(postId));
            reply.setUserId(userId);
            reply.setUsername(username);
            reply.setBody(body);
            reply.setTimestamp(new Timestamp(System.currentTimeMillis()));

            try {
                boolean success = replyDAO.addReply(reply);
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
