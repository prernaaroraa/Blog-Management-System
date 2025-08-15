package com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbs.DBService;
import com.dto.CommentInfo;

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(false);
		int userid = (Integer)session.getAttribute("uniqueid");
		CommentInfo c= new CommentInfo();
		c.setUserid(userid);
		c.setBlogid(Integer.parseInt(request.getParameter("blogid")));
		c.setComment(request.getParameter("text"));
		System.out.println(c.getComment());
		DBService db = new DBService();
		int x = db.createcomment(c);
		String target="";
		if(x>=1)
		{
			target="/ShowBlogServlet";
		}
		else
		{
			request.setAttribute("sms", "User can not be registered");
			target="/ShowBlogServlet";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(request, response);
	}

}
