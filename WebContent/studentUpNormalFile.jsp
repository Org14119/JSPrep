<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.system.entity.*"%>
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
<%
	if (!session.isNew()) {
		if (session == null || session.equals("") || session.getAttribute("type") == null
				|| session.getAttribute("state") == null || session.getAttribute("student") == null) {
			out.println("会话已经过期，请重新登陆");
%>
<a href="index.jsp">点击这里登陆</a>

<body>

</body>
<%
	} else {
%>
<%
	String type = (String) session.getAttribute("type");
			//out.println(type);
			Student s = (Student) session.getAttribute("student");
			boolean flag = (boolean) session.getAttribute("state");
			//out.println(flag && type.equals("student"));
			if (flag && type.equals("student")) {
				out.println("欢迎您，" + s.getName() + "学生!");
%>
<%
	String teacherEmail = request.getParameter("teacherEmail");
				if (teacherEmail != null || !teacherEmail.equals("")) {

					Teacher teacher = new Teacher();
					teacher.setEmail(teacherEmail);
%>
<%="请选择给老师上传的文件"%>
<form method="post" enctype="multipart/form-data"
	action="uploadStudentFile">
	<input type="file" name="upFile" size=100 /> <br /> <input
		type="hidden" name="teacherEmail" value=<%=teacherEmail%> /> <input
		type="hidden" name="studentEmail" value=<%=s.getEmail()%> /> <input
		type="submit" name="submit" value="upload" />
</form>

<%
	}
%>


<%
	} else {
				out.println("你不是学生，请重新登陆");
%>
<a href="index.jsp">点击这里登陆</a>
<%
	}
%>





<%
	}
%>







<%
	} else {
		out.println("会话已经过期，请重新登陆，提示：请不要在浏览器上登陆两个账号!");
%>
<a href="index.jsp">点击这里登陆</a>

<%
	}
%>
</html>