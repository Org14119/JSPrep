<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.system.entity.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (!session.isNew()) {

			if ((session == null) || session.getAttribute("type") == null || session.getAttribute("teacher") == null
					|| session.getAttribute("state") == null) {
	%>
	<%="会话过期或者未登录，请重新登录"%>
	<a href="index.jsp">登录</a>

	<%
		} else {
	%>
	<%
		String type = (String) session.getAttribute("type");
				Teacher t = (Teacher) session.getAttribute("teacher");
				boolean flag = (boolean) session.getAttribute("state");
				if (flag && type.equals("teacher")) {
					out.println("欢迎您，" + t.getName() + "教师!");
	%>
	<form method="post" action="teacherBank">
		请输入题库名：<input type="text" name="bankName"><br> <br />
		请选择题库类型：<br/>
		<%
 	List<String> banklists = new TypeBank().getBankType();
 %>
		<%
			if (banklists != null) {
		%>
		<%
			for (int i = 0; i < banklists.size(); i++) {
		%>
		<%
			String type1 = "radio";
								String name1 = "bankType";
								out.println("<input type=" + type1 + " name=" + name1 + " value=" + banklists.get(i)
										+ ">" + banklists.get(i) + "<br>");
		%>

		<%
			}
		%>
		<br/>
		<br/>
		开始时间： <input name="startTime" type="text"><br/><br/> 结束时间： <input
			name="endTime" type="text"><br> <input type="submit"
			name="submit" value="确定"><br>
	</form>
	<%
		} else {
	%>
	<%="无法获取题库类型"%>
	<%
		}
	%>

	<%
		} else {
					session.invalidate();
					response.sendRedirect("index.jsp");
				}
	%>
	<%
		}
		} else {
	%>
	<%
		session.invalidate();
	%>
	<%="会话过期或者未登录，请重新登录"%>
	<a href="index.jsp">登录</a>
	<%
		}
	%>





</body>
</html>