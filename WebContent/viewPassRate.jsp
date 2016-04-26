<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.system.service.*"%>
<%@page import="java.util.*"%>
<%@page import="com.system.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (!session.isNew()) {
			if (session == null || session.equals("") || session.getAttribute("type") == null
					|| session.getAttribute("state") == null || session.getAttribute("teacher") == null) {
	%>
	<%
		out.println("会话过期或者未登录，请重新登录");
	%>
	<a href="index.jsp">登录</a>
	<%
		} else {
	%>
	<%
   					 String type = (String) session.getAttribute("type");
					Teacher t = (Teacher) session.getAttribute("teacher");
					boolean flag = (boolean) session.getAttribute("state");
					if (flag && type.equals("teacher")) {
							out.println("欢迎您，" + t.getName() + "教师!");
							String spaceID=request.getParameter("spaceID");
							if(spaceID!=null&&!spaceID.equals("")){
								QuestionSpace currentTeacherSpace= new QuestionSpace();
								currentTeacherSpace.setId(Long.parseLong(spaceID));
								ObjectQuestion question=new ObjectQuestion();
								double a=0.0;
								String correctAnswer="";
								int i=0;
								Map<ObjectQuestion, Double> map=new ScoreAnalyzeService().getPassRate(currentTeacherSpace);
								 if(map!=null){
									 for(Map.Entry<ObjectQuestion, Double> me:map.entrySet()){
										 question=me.getKey();
										 a=me.getValue();
										 i++;
											if(question.getCorrectAnswer()==1){
												correctAnswer="A";
											}
											else if(question.getCorrectAnswer()==2){
												correctAnswer="B";
											}
											else if(question.getCorrectAnswer()==3){
												correctAnswer="C";
											}
											else if(question.getCorrectAnswer()==4){
												correctAnswer="D";
											}
											else{
												correctAnswer="无";
											}
											%>
											<div>
											<br/>
												第<%=i%>题
												<%=question.getTitle() + "(" + question.getScore() + "分)"%><br/><br/>
												A.<%=question.getChoiceA()%><br>
												B.<%=question.getChoiceB()%><br>
												C.<%=question.getChoiceC()%><br>
												D.<%=question.getChoiceD()%><br>
												正确答案：<%=correctAnswer %><br>
												答案解析：<%=question.getAnswerAnalyze() %><br>
												通过率：<%=a %>
												
											</div>
										
										
										
										
									<%
									 }
								 }
								 else{%>
								<%="系统错误，请稍候重试！" %>
							<a href="viewStudentGrade.jsp">返回</a>
								<%  }
							}
							else{%>
							<%="系统错误，请稍候重试！" %>
							<a href="viewStudentGrade.jsp">返回</a>
						<% }
	
	}

				else {
	%>
	<%
		session.invalidate();
	%>
	<%="会话过期或者未登录，请重新登录"%>
	<a href="index.jsp">登录</a>
	<%
		}

			}
		} else {
	%>
	<%
		session.invalidate();
	%>
	<%="会话过期或者未登录，请重新登录"%>
	<a href="index.jsp">登录</a>
	<%
		}
	%>
</body>
</html>