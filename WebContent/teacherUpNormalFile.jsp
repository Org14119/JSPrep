<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		if (!session.isNew()) {
			if (session == null || session.equals("") || session.getAttribute("type") == null
					|| session.getAttribute("state") == null || session.getAttribute("teacher") == null) {
				out.println("会话已经过期，请重新登陆");
			} else {
				String type = (String) session.getAttribute("type");
				Teacher teacher = (Teacher) session.getAttribute("teacher");
				boolean flag = (boolean) session.getAttribute("state");
				if (teacher != null && type != null && type.equals("teacher")) {
					out.println("欢迎您+" + teacher.getName() + "老师");
				}
	%>
	<%
		String studentEmail = request.getParameter("studentEmail");
				if (studentEmail != null && !studentEmail.equals("")) {
					Student student = new Student();
					student.setEmail(studentEmail);
	%>
	<form method="post" enctype="multipart/form-data"
		action="upLoadTeacherNormalFile">
		<input type="file" name="upFile" size=100 /> <br /> <input
			type="hidden" name="studentEmail" value=<%=studentEmail%> /> <input
			type="hidden" name="teacherEmail" value=<%=teacher.getEmail()%> /> <input
			type="submit" name="submit" value="upload" />
	</form>

	<%
		} else {
					out.println("传参数错误,请重新登陆");
				}
	%>
	<%
		}
	%>
	<%
		}
	%>

</body>