package com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbs.DBService;
import com.dto.UserInfo;


@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		UserInfo u = new UserInfo();
		u.setUsername(request.getParameter("t1"));
		u.setPassword(request.getParameter("t2"));
		u.setEmail(request.getParameter("t3"));
		u.setFirstname(request.getParameter("t4"));
		u.setLastname(request.getParameter("t5"));
		u.setContactno(request.getParameter("t6"));
		DBService db = new DBService();
		int x = db.signup(u);
		String target="";
		if(x>=1)
		{
			target="/login(T).jsp";
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
