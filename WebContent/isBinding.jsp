<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.system.service.*"%>
<%@page import="com.system.entity.*"%>
<%@page import="java.util.*"%>
<%@page import="com.system.dataManagement.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (session == null || session.equals("")) {
			response.sendRedirect("error.jsp");
		} else {

			String type = (String) session.getAttribute("type");
			if ((type != null) && type.equals("student")) {//当判断是学僧的时候才执行下列绑定
				Student student = (Student) session.getAttribute("student");
	%>
	<%
		List<Teacher> bindingTeachers = new ViewTeacherService().getBindingTeachers(student);
				if (bindingTeachers != null) {
	%>
	<br /><%="正在申请的老师"%><br />
	<%
		for (int i = 0; i < bindingTeachers.size(); i++) {
	%>
	<%=bindingTeachers.get(i).getName()%><br />
	<%
		}
				}
	%>
	<%
		} else {
	%>
	<%
		out.println("你丫不是学生");
			}
	%>
	<%
		}
	%>
</body>
</html>