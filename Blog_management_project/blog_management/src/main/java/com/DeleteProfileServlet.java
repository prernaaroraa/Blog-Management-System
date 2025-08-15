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


@WebServlet("/DeleteProfileServlet")
public class DeleteProfileServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(false);
		String username = (String)session.getAttribute("username");
		DBService db = new DBService();
		int x = db.deleteacc(username);
		String target="";
		if(x>=1)
		{
			target="/login(T).jsp";
			request.setAttribute("sms", "User deleted");
		}
		else
		{
			request.setAttribute("sms", "User can not be deleted");
			target="/login(T).jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(request, response);
	}

}
