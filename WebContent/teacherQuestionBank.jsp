<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.system.entity.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if ((session == null) || session.getAttribute("type") == null || session.getAttribute("teacher") == null
				|| session.getAttribute("state") == null) {
	%>
	<%="您还没登陆吧，老师？"%>
	<a href="index.jsp">点击这里登陆</a>

	<%
		} else {
	%>
	<%
		String type = (String) session.getAttribute("type");
			Teacher t = (Teacher) session.getAttribute("teacher");
			boolean flag = (boolean) session.getAttribute("state");
			if (flag && type.equals("teacher")) {
				out.println("欢迎您，" + t.getName() + "教师!");
			} else {
				session.invalidate();
				response.sendRedirect("login.jsp");
			}
	%>
	<%
		}
	%>

<form method="post" action="teacherBank">
请输入题库名：<input type="text" name="bankName"><br><br/>
请选择题库类型：
<%
List<String> banklists=new TypeBank().getBankType();
%>
<%
for(int i=0;i<banklists.size();i++){
%>
<%
String type1="radio";
String name1="bankType";
out.println("<input type="+type1+" name="+name1+" value="+banklists.get(i)+">"+banklists.get(i)+"<br>");
%>

<%	
}
%>
开始时间：
<input name="startTime" type="text"><br>
结束时间：
<input name="endTime" type="text" ><br>
<input type="submit" name="submit" value="确定"><br>
</form>
</body>
</html>