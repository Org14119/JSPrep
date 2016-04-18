package com.system.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.system.entity.QuestionSpace;
import com.system.entity.Teacher;
import com.system.service.QuestionSpaceService;


public class do_teacherQuestionBank extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		Teacher t=(Teacher)session.getAttribute("teacher");
		String bankName=request.getParameter("bankName");
		String teacherBankType=request.getParameter("bankType");
		String startTime=request.getParameter("startTime");
		String endTime=request.getParameter("endTime");
		
		if(teacherBankType==null||t==null||startTime==null||endTime==null||t.equals("")||teacherBankType.equals("")||startTime.equals("")||endTime.equals("")){
			response.sendRedirect("error.jsp");
			return;
		}
		else{
			QuestionSpace teacherBank=new QuestionSpace();
			teacherBank.setName(bankName);
			teacherBank.setType(teacherBankType);
			new com.system.util.TimeUtil();
			teacherBank.setBeginTime(startTime);
			teacherBank.setEndTime(endTime);
	//		session.setAttribute("currentTeacherSpace",teacherBank);
			boolean flag=new QuestionSpaceService().addSpace(teacherBank, t);
			if(flag){
				System.out.println("添加题库成功！");
			}
			else{
				System.out.println("添加题库失败！");
			}
			
		}
	
	}

}
