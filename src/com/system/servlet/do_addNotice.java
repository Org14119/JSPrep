package com.system.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class do_addNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if(!session.isNew()){
			System.out.println("sessionID="+session.getId());
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String identity = request.getParameter("identity");
			if (username == null || password == null || identity == null || username.contentEquals("")
					|| password.contentEquals("") || identity.contentEquals("")) {
				response.sendRedirect("error.jsp");
				return;
			}
			else{
				String title=request.getParameter("title");
				String content=request.getParameter("content");
				if(title!=null&&content!=null&&!title.equals("")&&!content.equals("")){
					
					
				}
				else{
					System.out.println("系统繁忙，请稍候重试");
					response.sendRedirect("error.jsp");
					return;
				}
				
			}
	}
		else{
			session.invalidate();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}

}
}
