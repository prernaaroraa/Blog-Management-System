package com;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbs.DBService;
@WebServlet("/ALLPOST")
public class ALLPOST extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		DBService db = new DBService();
		ArrayList al = db.getallblogs();
		request.setAttribute("blog", al);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/allpost.jsp");
		rd.forward(request, response);
	}

}
