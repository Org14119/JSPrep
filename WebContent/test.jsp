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
			if ((session == null) || session.getAttribute("type") == null || session.getAttribute("student") == null
					|| session.getAttribute("state") == null
					|| session.getAttribute("currentTeacherSpace") == null) {
	%>
	<%="会话过期或者未登录，请重新登录"%>

	<a href="index.jsp">登录</a>

	<%
		} else {
	%>
	<%
		String type = (String) session.getAttribute("type");
				out.println(type);
				Student s = (Student) session.getAttribute("student");
				boolean flag = (boolean) session.getAttribute("state");
				out.println(flag && type.equals("student"));
				if (flag && type.equals("student")) {
					out.println("欢迎您，" + s.getName() + "学生!");
					QuestionSpace currentTeacherSpace = (QuestionSpace) session.getAttribute("currentTeacherSpace");
	%>
	<%
					Test testInstance = new Test();
					com.system.util.TimeUtil ti = new com.system.util.TimeUtil();
					String testTime = ti.getTime();
					java.sql.Date myTestTime=ti.parseStringToDate(testTime);
					testInstance.setTestTime(testTime);
					testInstance.setExam(true);
			
					if(myTestTime.after(ti.parseStringToDate(currentTeacherSpace.getBeginTime()))
							&&myTestTime.before(ti.parseStringToDate(currentTeacherSpace.getEndTime()))){%>
						
						<%				
										long id = new TestService().beginTest(testInstance, currentTeacherSpace, s);

										if (id != -1L) {
											testInstance.setTestID(id);
											Vector<ObjectQuestion> objectQuestionLists = new ObjectQuestionService()
													.getAllQuestionOfSpace(currentTeacherSpace);
						%>
						<div>
							<form method="post" action="test">
								<%
									if (objectQuestionLists != null&&objectQuestionLists.size()>currentTeacherSpace.getAmount()) {
										                int i = 1;
										                int array[]=new int[currentTeacherSpace.getAmount()];
										                for(int p=0;p<currentTeacherSpace.getAmount();p++){
										                	array[p]=-1;
										                }
										                session.setAttribute("testInstance", testInstance);
													   for(int a=0;a<currentTeacherSpace.getAmount();a++){
														   array[a]=(int)(0+Math.random()*objectQuestionLists.size()-1);	
														   for(int j=0;j<a;j++){
															   if(array[a]==array[j]){
																   a--;
																   break;
															   }
														   }}

													   session.setAttribute("array", array);
													   for(int a=0;a<currentTeacherSpace.getAmount();a++){
															ObjectQuestion o=objectQuestionLists.get(array[a]);
															
								%>
								<div>
									第<%=i%>题
									<%=o.getTitle() + "(" + o.getScore() + "分)"%><br/>
									<input type="radio" name="<%=o.getId()%>" value="1">A.<%=o.getChoiceA()%><br>
									<input type="radio" name="<%=o.getId()%>" value="2">B.<%=o.getChoiceB()%><br>
									<input type="radio" name="<%=o.getId()%>" value="3">C.<%=o.getChoiceC()%><br>
									<input type="radio" name="<%=o.getId()%>" value="4">D.<%=o.getChoiceD()%><br>
								</div>
								<%
									i++;
														}
								%>
		    <input type="submit" name="submit" value="提交"><br>
								<br />
								<br />
							</form>
						</div>
								
								<%
									}
								

													else {
													
														out.println("考试系统繁忙，请稍候重试！");
								%>
								<a href="viewTeachers.jsp">返回</a>
								<%
									}
								%>


						<%
							} else {
						%>
						<%
						
						%>
						<%
							out.println("考试系统繁忙，请稍候重试！");
						%>
						<a href="viewTeachers.jsp">返回</a>

						<%
							}%>
						
						
						
						
				<% 	}
					else{
						out.println("当前时间不在考试时间范围内！");%>
					<a href="viewTeachers.jsp">返回</a>
						
					<%}%>
					
					
		
		<%	} else {
	%>
	<%
		session.invalidate();
	%>
	<%="会话过期或者未登录，请重新登录"%>
	<a href="index.jsp">登录</a>
	<%
		}
			}
			%><a href="viewTeachers.jsp">返回</a>
			<%} else {
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