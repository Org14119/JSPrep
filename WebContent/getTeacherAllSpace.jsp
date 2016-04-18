<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.system.entity.*" %>
<%@ page import="com.system.service.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if ((session == null) || session.getAttribute("type") == null || session.getAttribute("teacher") == null
				|| session.getAttribute("state") == null) {
	%>
	<%="您还没登陆吧，老师？"%>
	<a href="index.jsp">点击这里登陆</a>

	<%
		} else {
	%>
	<%
		String type = (String) session.getAttribute("type");
			Teacher t = (Teacher) session.getAttribute("teacher");
			boolean flag = (boolean) session.getAttribute("state");
			if (flag && type.equals("teacher")) {
				out.println("欢迎您，" + t.getName() + "教师!");						
				List<QuestionSpace> spacelists=new QuestionSpaceService().getQuestionSpaceOfTeacher(t);	
				for(int i=0;i<spacelists.size();i++){
					out.println("<br>"+spacelists.get(i).getName()+"-"+spacelists.get(i).getType()+"<br>");
					
				}
				%>	
			
				
		
		<% 	
			} else {
				session.invalidate();
				response.sendRedirect("login.jsp");
			}
	%>
	<%
		}
	%>





</body>
</html>