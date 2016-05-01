<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.system.entity.*"%>
<%@page import="com.system.service.*"%>
<%@page import="java.util.*"%>
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
				out.println("身份验证错误，请重新登陆");
			} else {
	%>
	<%
		String type = (String) session.getAttribute("type");
				Teacher teacher = (Teacher) session.getAttribute("teacher");
				boolean flag = (boolean) session.getAttribute("state");
				if (flag == true && type != null && type.equals("teacher")) {
					out.println("欢迎您，" + teacher.getName() + "教师!");
	%>
	<%
		Vector<Student> bindedVector = new BindingService().getAllStudent(teacher);
	%>
	<%
		if (bindedVector != null) {
	%>
	<%
		if (bindedVector.size() == 0) {
							out.println("您没有绑定任何学生,无法上传文件给某指定学生");
						} else {
							Iterator<Student> iter = bindedVector.iterator();
							while (iter.hasNext()) {
								Student student = iter.next();
	%>
	<form method="post" action="teacherUpNormalFile.jsp">
		<input type="hidden" name="studentEmail" value=<%=student.getEmail()%>>
		<input type="submit" name="submit" value=<%=student.getName()%>>
		<br />

	</form>
	<%
		}
	%>
	<a href="viewTeacherSendFile.jsp">查看我上传的文件</a>
	<%
		}
	%>
	<%
		} else {
						out.println("获取绑定学生时发生错误");
					}
	%>
	<%
		}
	%>

	<%
		}
	%>

	<%
		}
	%>
</body>
</html>