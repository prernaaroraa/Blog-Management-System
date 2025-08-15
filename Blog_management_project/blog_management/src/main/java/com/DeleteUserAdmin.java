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
import com.mysql.cj.Session;


@WebServlet("/DeleteUserAdmin")
public class DeleteUserAdmin extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Integer userid=Integer.parseInt((String)request.getParameter("userid"));
		DBService db = new DBService();
		int x = db.deleteacc(userid);
		String target="";
		if(x>=1)
		{
			target="/ALLUSER";
			request.setAttribute("sms", "User deleted");
		}
		else
		{
			request.setAttribute("sms", "User can not be deleted");
			target="/ALLUSER";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(request, response);
	}

}
