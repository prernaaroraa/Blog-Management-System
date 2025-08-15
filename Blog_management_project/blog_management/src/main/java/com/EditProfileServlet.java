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

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBService db = new DBService();
		HttpSession session = request.getSession(false);
		String username = (String)session.getAttribute("username");
		int z=db.getid(username);
		UserInfo u = new UserInfo();
		u.setUsername(request.getParameter("t1"));
		u.setPassword(request.getParameter("t2"));
		u.setEmail(request.getParameter("t3"));
		u.setFirstname(request.getParameter("t4"));
		u.setLastname(request.getParameter("t5"));
		u.setContactno(request.getParameter("t6"));
		u.setUniqueid(z);
		int x = db.editprofile(u);
		String target="";
		if(x>=1)
		{
			request.setAttribute("sms", "profile updated succesfully");
			target="/login(T).jsp";
		}
		else
		{
			request.setAttribute("sms", "profile can not be updated");
			target="/edit.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(request, response);
	}

}
