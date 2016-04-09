package com.system.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.system.entity.Student;
import com.system.entity.Teacher;
import com.system.service.LoginService;

/**
 * Servlet implementation class do_login
 */
@WebServlet("/do_login")
public class do_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public do_login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */



    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String username=request.getParameter("username");
		System.out.println("userName"); 
		String password=request.getParameter("password");
		String identity=request.getParameter("identity");



		if(username.contentEquals("")||password.contentEquals("")||identity.contentEquals("")){
			response.sendRedirect("error.jsp");
			return;
		}

		if(identity.equals("用户")){
			
			Student s=new Student();
			s.setEmail(username);
			s.setPassword(password);
			boolean b=new LoginService().studentLogin(s);
			System.out.println(b);
			if(b){
				System.out.println("登陆成功");
				response.sendRedirect("loginSuccess.jsp");
				
			}
			else{
				response.sendRedirect("error.jsp");
			}
			
		}
		else if(identity.equals("教师")){
			Teacher t=new Teacher();
			t.setEmail(username);
			t.setPassword(password);
			boolean b=new LoginService().teacherLogin(t);
			if(b){
				response.sendRedirect("loginSuccess.jsp");
			}
			else{
				response.sendRedirect("error.jsp");
			}
			
		}
		
		
		
		
		
		
		
		
		
	}

}
