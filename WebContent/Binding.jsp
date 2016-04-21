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
if(!session.isNew()){

	if (session == null || session.equals("")) {

		%>
			<%="会话过期或者未登录，请重新登录"%>
           <a href="index.jsp">登录</a>
		<% 
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
		List<Teacher> bindedTeachers=new ViewTeacherService().getBindedTeachers(student);
		/*
		for(int i=0;i<bindingTeachers.size();i++){
			System.out.println("申请"+bindingTeachers.get(i).getName());
		}
		for(int i=0;i<bindedTeachers.size();i++){
			System.out.println("绑定完成"+bindedTeachers.get(i).getName());
		}*/
		if(allTeachers!=null&&bindingTeachers!=null&&bindedTeachers!=null){
			List<Teacher> teachers=new ManageUnbindingTeacher().getUnbindingTeacher(bindedTeachers,bindingTeachers,allTeachers);
			if(teachers!=null){
				String inputName = "teacher";
				String type1 = "checkbox";
				for (int i = 0; i < teachers.size(); i++) {
					String teacherName = teachers.get(i).getName();
					String teacherEmail = teachers.get(i).getEmail();
					
					out.println("<input type=" + type1 + " name=" + inputName + " value=" + teacherEmail + ">"
							+ teacherName);
					out.println("<br/>");
				}	
			}
			else{
				out.print("您暂时没有需要申请绑定的老师！");
			}

		}
		else{
			out.print("服务器故障，请稍候重试！！");
		}

	%>
	<input type="submit" name="submit" value="绑定">



</form>
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