package com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbs.DBService;

@WebServlet("/DeleteCommentServlet")
public class DeleteCommentServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int commentid=Integer.parseInt(request.getParameter("commentid"));
		DBService db=new DBService();
		int x = db.deletecomment(commentid);
		
		String target="";
		if(x>=1)
		{
			target="/HomeServlet";
		}
		else
		{
			request.setAttribute("sms", "User can not be registered");
			target="/SignUp.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(request, response);
		
	}

}
