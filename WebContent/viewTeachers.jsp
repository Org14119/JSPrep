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
		if (session == null || session.equals("") || session.getAttribute("type") == null
				|| session.getAttribute("state") == null) {
	%>
	<%
		out.println("你丫登陆了没？");
	%>
	<a href="index.jsp">现在去登陆!</a>
	<%
		} else {
	%>
	<%
		String type = (String) session.getAttribute("type");
			Student s = (Student) session.getAttribute("student");
			boolean flag = (boolean) session.getAttribute("state");
			if (flag && type.equals("student")) {
				out.println("欢迎您，" + s.getName() + "学生!");
	%>
	<%
		}
	%>
	<%
		if (!s.getEmail().equals("")) {
	%>
	<%
		List<Teacher> teachers = new ViewTeacherService().getBindedTeachers(s);
				if (teachers != null) {
					for (Teacher t : teachers) {
						out.println(t.getName() + "</br>");
					}
				}
			}
	%>

	<%
		}
	%>





</body>
</html>