<%@page import="com.sun.corba.se.impl.encoding.OSFCodeSetRegistry.Entry"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.system.entity.*"%>
<%@page import="java.util.*"%>
<%@page import="com.system.service.*"%>
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
					|| session.getAttribute("state") == null || session.getAttribute("student") == null) {
				out.println("会话已经过期，请重新登陆");
	%>
	<%
		} else {
	%>
	<%
		Student student = (Student) session.getAttribute("student");
	%>
	<%
		Map<SaveFile, Teacher> fileMap = new NormalFileService().getSendFile(student);
	%>
	<%
		for (Map.Entry<SaveFile, Teacher> entry : fileMap.entrySet()) {
					SaveFile sfile = entry.getKey();
					Teacher teacher = entry.getValue();
					String teacherName = teacher.getName();
					boolean acptState = sfile.isAccept();
					String fileName = sfile.getFileName();
					String fileLocalte = sfile.getFileLocate();
	%>
		<a href="download?<%="fileName=" + fileName%>">文件名：<%=fileName %></a><br/>
		接收老师：<%=teacherName %><br/>
		老师是否下载：<%=acptState %><br/>
		

	<%
		}
	%>
	<%
		}
	%>
	<%
		}
	%>
</body>
</html>