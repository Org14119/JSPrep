<%@page import="com.system.service.NormalFileService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.system.entity.*"%>
<%@page import="com.system.service.*"%>
<%@page import="java.util.*"%>
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
		if (!session.isNew()) {
			if (session == null || session.equals("") || session.getAttribute("type") == null
					|| session.getAttribute("state") == null || session.getAttribute("teacher") == null) {
				out.println("会话已经过期，请重新登陆");
	%>


	<%
		} else {
	%>
	<%
		Teacher teacher = (Teacher) session.getAttribute("teacher");
				Map<SaveFile, Student> fileMap = new NormalFileService().getRecvFiles(teacher);
				for (Map.Entry<SaveFile, Student> entry : fileMap.entrySet()) {
					SaveFile file = entry.getKey();
					Student student = entry.getValue();
					String fileName = file.getFileName();
					boolean state = file.isAccept();
					String fromName = student.getName();
					String fileLocat = file.getFileLocate();
	%>
	<br />
	<br /> 来自：<%=fromName%><br />
	<a href="download?<%="fileName=" + fileName%>">文件名：<%=fileName%><br /></a>
	<%
		if (state) {
						out.println("已下载");
					} else {
						out.println("未下载");
					}
	%>
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