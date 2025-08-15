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
import com.dto.BlogInfo;
import com.mysql.cj.Session;


@WebServlet("/DeleteBlogServlet")
public class DeleteBlogServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(false);
		Integer userid=(Integer)session.getAttribute("uniqueid");
		int blogid=(Integer.parseInt(request.getParameter("deleteblog")));
		DBService db = new DBService();
		int x = db.deleteblog(blogid);
		String target="";
		if(x>=1)
		{	if(userid!=null && userid==5) {
				target="/admindashboard.jsp";
		}else {
			target="/profile.jsp";
		}
			
			request.setAttribute("sms", "blog deleted");
		}
		else
		{
			request.setAttribute("sms", "blog can not be deleted");
			target="/profile.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(request, response);
	}

}
