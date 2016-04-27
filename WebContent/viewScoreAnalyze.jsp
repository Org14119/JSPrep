<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.system.service.*"%>
<%@page import="java.util.*"%>
<%@page import="com.system.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看分数排名</title>
</head>
<body>
	<%
		if (!session.isNew()) {
			if (session == null || session.equals("") || session.getAttribute("type") == null
					|| session.getAttribute("state") == null || session.getAttribute("teacher") == null) {
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
					Teacher t = (Teacher) session.getAttribute("teacher");
					boolean flag = (boolean) session.getAttribute("state");
					if (flag && type.equals("teacher")) {
							out.println("欢迎您，" + t.getName() + "教师!");
							String spaceID=request.getParameter("spaceID");
							if(spaceID!=null&&!spaceID.equals("")){
								QuestionSpace currentTeacherSpace= new QuestionSpace();
								currentTeacherSpace.setId(Long.parseLong(spaceID));
								 Map<Student, Integer> map=new ScoreAnalyzeService().getRangeMap(currentTeacherSpace);
								 Student student=new Student();
								 int score=0;
								 int i=0;
								 if(map!=null){
									 for(Map.Entry<Student, Integer> me:map.entrySet()){
										 student=me.getKey();
										 score=me.getValue();
										 i++;%>
										 考试排名：   <br>
										 第<%=i %>名：<%=student.getName() %> 分数：<%=score %>分<br>
										 
										 
									<%  }
								 }
							}
							else{%>
								<%="系统错误，请稍候重试！" %>
								<a href="viewAllTests.jsp">返回</a>
							<% }

	
	}

				else {
	%>
	<%
		session.invalidate();
	%>
	<%="会话过期或者未登录，请重新登录"%>
	<a href="index.jsp">登录</a>
	<%
		}

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