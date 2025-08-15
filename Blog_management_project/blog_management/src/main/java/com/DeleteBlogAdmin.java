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
import com.dto.BlogInfo;
import com.mysql.cj.Session;


@WebServlet("/DeleteBlogAdmin")
public class DeleteBlogAdmin extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(false);
		Integer userid=(Integer)session.getAttribute("uniqueid");
		int blogid=(Integer.parseInt(request.getParameter("blogid")));
		DBService db = new DBService();
		int x = db.deleteblog(blogid);
		String target="";
		if(x>=1)
		{	
			target="/ALLPOST";
			request.setAttribute("sms", "blog deleted");
		}
		else
		{
			request.setAttribute("sms", "blog can not be deleted");
			target="/ALLPOST";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(request, response);
	}

}
