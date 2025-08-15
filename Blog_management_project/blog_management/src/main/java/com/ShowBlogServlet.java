package com;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbs.DBService;
import com.dto.BlogInfo;
import com.dto.CommentInfo;

@WebServlet("/ShowBlogServlet")
public class ShowBlogServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		CommentInfo c = new CommentInfo();
		BlogInfo b = new BlogInfo();
		DBService db = new DBService();
		b=db.getblog((Integer)Integer.parseInt(request.getParameter("blogid")));
		ArrayList al=db.getallcomment((Integer)Integer.parseInt(request.getParameter("blogid")));
		request.setAttribute("comment", al);
		request.setAttribute("blog", b);
		HttpSession session = request.getSession(false);
		int userid=(Integer)session.getAttribute("uniqueid");
		System.out.println("userid"+userid);
		request.setAttribute("userid", userid);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/showblog.jsp");
		rd.forward(request, response);	
		
	}

}
