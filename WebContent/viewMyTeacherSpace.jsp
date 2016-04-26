<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.system.service.*"%>
<%@page import="java.util.*"%>
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
					|| session.getAttribute("state") == null|| session.getAttribute("student") == null) {
	%>
	<%
	out.println("会话过期或者未登录，请重新登录");
	%>
	<a href="index.jsp">登录</a>
	<%
		} else {
	%>
	<%
		String type = (String) session.getAttribute("type");
				out.println(type);
				Student s = (Student) session.getAttribute("student");
				boolean flag = (boolean) session.getAttribute("state");
				out.println(flag && type.equals("student"));
				if (flag && type.equals("student")) {
					out.println("欢迎您，" + s.getName() + "学生!");
	%>

	<%
		String teacherEmail = request.getParameter("teacherEmail");
	if(teacherEmail!=null&&!teacherEmail.equals("")){	%>
				<%
					Teacher t = new Teacher();
					t.setEmail(teacherEmail);
					List<QuestionSpace> spacelists = new QuestionSpaceService().getQuestionSpaceOfTeacher(t);
					if (spacelists != null) {
	%>
	<%="题库："%><br />
	<%
		for (int i = 0; i < spacelists.size(); i++) {
			//System.out.println("spacelists.get(i).getBeginTime()======"+spacelists.get(i).getBeginTime());
			
			
	%>
<form method="post" action="spaceHandleIndex.jsp">
<input type="hidden" name="spaceID" value=<%=spacelists.get(i).getId()%>>

<input type="hidden" name="startTime" value=<%=spacelists.get(i).getBeginTime().replaceAll(" ", "时间")%>>
<input type="hidden" name="endTime" value=<%=spacelists.get(i).getEndTime().replaceAll(" ","时间")%>>
<input type="submit" name="submit" value=<%=spacelists.get(i).getName()%> >
<br>

</form>

	<%
		}
					}
	%>
	<%
	}
	%>

	<%
		}
				else{%>
				<%session.invalidate(); %>
				<%="会话过期或者未登录，请重新登录"%>
				<a href="index.jsp">登录</a>
	<%		}
	%>



	<%
		}%>
			<a href="viewTeachers.jsp">返回上一页</a>
			<% }
		else{%>
		<%session.invalidate(); %>
		<%="会话过期或者未登录，请重新登录"%>
		<a href="index.jsp">登录</a>
<% 	}
	%>




</body>
</html>