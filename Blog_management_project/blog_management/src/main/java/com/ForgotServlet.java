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

@WebServlet("/ForgotServlet")
public class ForgotServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserInfo u = new UserInfo();
		u.setUsername(request.getParameter("t1"));
		u.setEmail(request.getParameter("t2"));
		DBService db = new DBService();
		boolean isValid = db.fcheck(u);
		String target="";
		if(isValid==true)
		{
			target="/change.jsp";
		}
		else
		{
			request.setAttribute("sms", "Invalid Username/Email");
			target="/Forgot.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(request, response);
		
	}

}
