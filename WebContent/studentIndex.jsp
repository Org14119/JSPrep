<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.system.entity.*" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  Student s=(Student)session.getAttribute("student");
  boolean flag=(boolean)session.getAttribute("state");
  if(flag){
	  out.println("欢迎您，"+s.getName()+"学生!");
  }
  else{
	  response.sendRedirect("login.jsp");  }
%>

</body>
</html>