package com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbs.DBService;
import com.dto.BlogInfo;

@WebServlet("/EditBlogServlet")
public class EditBlogServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		BlogInfo b = new BlogInfo();
		DBService db = new DBService();
		b=db.getblog((Integer)Integer.parseInt(request.getParameter("editblog")));
		request.setAttribute("blog", b);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/editblog.jsp");
		rd.forward(request, response);	
	}

}
