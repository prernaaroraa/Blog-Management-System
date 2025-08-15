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


@WebServlet("/REditBlogServlet")
public class REditBlogServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(false);
		int userid=(Integer)session.getAttribute("uniqueid");
		BlogInfo b = new BlogInfo();
		b.setCategory(request.getParameter("category"));
		b.setContent(request.getParameter("blogContent"));
		b.setTitle(request.getParameter("title"));
		b.setUserid(userid);
		int blogid=(Integer.parseInt(request.getParameter("blogid")));
		b.setBlogid(blogid);
		DBService db = new DBService();
		int x = db.editblog(b);
		request.setAttribute("blog", b);
		String target="";
		if(x>=1)
		{
			target="/showblog.jsp";
			request.setAttribute("sms", "User deleted");
		}
		else
		{
			request.setAttribute("sms", "User can not be deleted");
			target="/showblog.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(request, response);
	}

}
