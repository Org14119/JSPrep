<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.system.entity.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
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
		}
	%>

	<a href="<%=request.getContextPath()%>/logout">登出</a>
	<br />
	<br />
	<center>
		<jsp:include page="Binding.jsp"></jsp:include>

	</center>

</body>
</html>