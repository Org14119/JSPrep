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
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<body>
	<%
		if (session == null || session.equals("")) {
			response.sendRedirect("error.jsp");
		} else {

			String type = (String) session.getAttribute("type");
			if ((type!=null)&&type.equals("student")) {//当判断是学僧的时候才执行下列绑定
				Student student = (Student) session.getAttribute("student");
	%>
	请在要绑定的教师后面打勾
	<form method="post" action="binding">
		<%
			List<Teacher> allTeachers = new ConsultService().getAllTeachers();
			List<Teacher> bindingTeachers=new ViewTeacherService().getBindingTeachers(student);
			List<Teacher> teachers=new ManageUnbindingTeacher().getUnbindingTeacher(bindingTeachers,allTeachers);
					String inputName = "teacher";
					String type1 = "checkbox";
					for (int i = 0; i < teachers.size(); i++) {
						String teacherName = teachers.get(i).getName();
						String teacherEmail = teachers.get(i).getEmail();
						
						out.println("<input type=" + type1 + " name=" + inputName + " value=" + teacherEmail + ">"
								+ teacherName);
						out.println("<br/>");
					}
		%>
		<input type="submit" name="submit" value="绑定">



	</form>
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