package com.erasmus.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.erasmus.web.dao.ReactionDAO;
import com.erasmus.web.model.User;

public class ReactionServlet extends HttpServlet {
    private ReactionDAO reactionDAO = new ReactionDAO();

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
        int postId = Integer.parseInt(request.getParameter("postId"));
        String reaction = request.getParameter("reaction");

        if (!"like".equals(reaction) && !"dislike".equals(reaction)) {
            response.sendRedirect("forum.jsp?status=error&reason=INVALID_REACTION");
            return;
        }

        reactionDAO.setReaction(postId, userId, reaction);
        response.sendRedirect("forum.jsp?status=success");
    }
    
}
