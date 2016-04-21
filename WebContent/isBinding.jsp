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

if(!session.isNew()){

	if (session == null || session.equals("")) {
%>
		<%="会话过期或者未登录，请重新登录"%>
       <a href="index.jsp">登录</a>
<%
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
			else{
				out.print("服务器故障，请稍候重试！！");
			}
%>
<%
	} else {
%>
				<%session.invalidate(); %>
		<%="会话过期或者未登录，请重新登录"%>
		<a href="index.jsp">登录</a>
<%
	
		}
%>
<%
	}}
else{%>
<%session.invalidate(); %>
<%="会话过期或者未登录，请重新登录"%>
<a href="index.jsp">登录</a>
<% 	}
%>



</body>
</html>