<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.system.service.*" %>
 <%@page import="com.system.entity.*" %>
 <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
请在要绑定的教师后面打勾
<form method="post" action="binding">
<%
	List<Teacher> teachers=new ConsultService().getAllTeachers();
	String inputName="teacher";
	String type="checkbox";
	
	for(int i=0;i<teachers.size();i++){
		String teacherName=teachers.get(i).getName();
		String teacherEmail=teachers.get(i).getEmail();
		out.println("<input type="+type+" name="+inputName+" value="+teacherEmail+">"+teacherName);
		out.println("<br/>");
	}
%>
<input type="submit" name="submit" value="绑定">



</form>





</body>
</html>