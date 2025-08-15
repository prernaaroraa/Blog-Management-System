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
import com.dto.UserInfo;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		UserInfo u = new UserInfo();
		u.setUsername(request.getParameter("t1"));
		u.setPassword(request.getParameter("t2"));
		
		DBService db = new DBService();
		boolean isVlid = db.check(u);
		String target="";
		if(isVlid==true)
		{
			target="/HomeServlet";
			HttpSession session = request.getSession(false);
			if(session!=null)
			{
				session.invalidate();
			}
			session = request.getSession(true);
			UserInfo u1 =  db.getuser(u.getUsername());
			session.setAttribute("username", u1.getUsername());
			session.setAttribute("email", u1.getEmail());
			session.setAttribute("firstname", u1.getFirstname());
			session.setAttribute("lastname", u1.getLastname());
			session.setAttribute("contact", u1.getContactno());
			session.setAttribute("password", u1.getPassword());
			session.setAttribute("uniqueid", u1.getUniqueid());
		}
		else
		{
			request.setAttribute("sms", "Invalid Username/Password");
			target="/login(T).jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(request, response);
		
	}

}