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

@WebServlet("/ChangeServlet")
public class ChangeServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserInfo u = new UserInfo();
		u.setUsername(request.getParameter("t1"));
		u.setPassword(request.getParameter("t2"));
		DBService db = new DBService();
		int x = db.change(u);
		String target="";
		if(x>=1) {
			target="/login(T).jsp";
			request.setAttribute("sms", "Password updated");
		}
		else
		{
			request.setAttribute("sms", "Password can not be updated");
			target="/change.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(request, response);
		}
	

}
