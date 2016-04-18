package com.system.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.system.entity.*;

public class do_addObjectQuestions extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		String questionName=request.getParameter("questionName");
		String answerA=request.getParameter("answerA");
		String answerB=request.getParameter("answerB");
		String answerC=request.getParameter("answerC");
		String answerD=request.getParameter("answerD");
		String correctAnswer=request.getParameter("correctAnswer");
		String score=request.getParameter("score");
		String answerAnalyze=request.getParameter("answerAnalyze");
		QuestionSpace currentTeacherSpace= (QuestionSpace)session.getAttribute("currentTeacherSpace");
		ObjectQuestion question=new ObjectQuestion();
		question.setTitle(questionName);
		question.setChoiceA(answerA);
		question.setChoiceB(answerB);
		question.setChoiceC(answerC);
		question.setChoiceD(answerD);
		question.setCorrectAnswer(Integer.parseInt(correctAnswer));
		question.setAnswerAnalyze(answerAnalyze);
		question.setScore(Integer.parseInt(score));
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
