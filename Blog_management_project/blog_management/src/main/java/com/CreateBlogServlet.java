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

@WebServlet("/CreateBlogServlet")
public class CreateBlogServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(false);
		int userid=(Integer)session.getAttribute("uniqueid");
		DBService db = new DBService();
		BlogInfo b = new BlogInfo();
		b.setCategory(request.getParameter("category"));
		b.setContent(request.getParameter("blogContent"));
		b.setTitle(request.getParameter("title"));
		System.out.println("category:"+b.getCategory());
		System.out.println("blogContent"+b.getContent());
		System.out.println("title:"+b.getTitle());
		b.setUserid(userid);
		int x = db.createblog(b);
		String target="";
		if(x>=1)
		{
			target="/ProfileServlet";
			request.setAttribute("sms", "blog created sussesfuly");
		}
		else
		{
			request.setAttribute("sms", "blog create nahi ho paya");
			target="/ProfileServlet";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(request, response);
	}

}
