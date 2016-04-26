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
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<%
if(!session.isNew()){
	if ((session == null) || session.getAttribute("type") == null || session.getAttribute("student") == null
			|| session.getAttribute("state") == null) {
%>
<%="会话过期或者未登录，请重新登录"%>

<a href="index.jsp">登录</a>

<%
	} else {%>
		<%
		String type = (String) session.getAttribute("type");
				out.println(type);
				Student s = (Student) session.getAttribute("student");
				boolean flag = (boolean) session.getAttribute("state");
				out.println(flag && type.equals("student"));
				if (flag && type.equals("student")) {
					out.println("欢迎您，" + s.getName() + "学生!");
					String spaceID=request.getParameter("spaceID");
					String beginTime=request.getParameter("startTime").replaceAll("时间", " ");
					String endTime=request.getParameter("endTime").replaceAll("时间", " ");
					out.print(spaceID);
					//System.out.println("beginTime======"+beginTime);
					QuestionSpace currentTeacherSpace= new QuestionSpace();
					currentTeacherSpace.setId(Long.parseLong(spaceID));
					currentTeacherSpace.setBeginTime(beginTime);
					currentTeacherSpace.setEndTime(endTime);
					session.setAttribute("currentTeacherSpace", currentTeacherSpace);
					%>
					
					<a href="practice.jsp">练习</a><br/>
					<a href="test.jsp">考试</a>
	
				<% 
					}
				else{%>
					<%session.invalidate(); %>
					<%="会话过期或者未登录，请重新登录"%>
					<a href="index.jsp">登录</a>
					
<% }
	}
}
else{%>
<%session.invalidate(); %>
<%="会话过期或者未登录，请重新登录"%>
<a href="index.jsp">登录</a>
<% 	}
%>
</body>
</html>