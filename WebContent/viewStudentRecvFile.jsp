<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.system.entity.*"%>
<%@page import="com.system.service.*"%>
<%@page import="java.util.*"%>
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
				if (student != null) {
					Map<SaveFile, Teacher> map = new NormalFileService().getRecvFiles(student);
					if (map != null) {
						for (Map.Entry<SaveFile, Teacher> entry : map.entrySet()) {
							SaveFile sfile = entry.getKey();
							Teacher teacher = entry.getValue();
							if (sfile != null && teacher != null) {
								String fileName = sfile.getFileName();
								String fileLocate = sfile.getFileLocate();
								boolean acceptState = sfile.isAccept();
								String teacherName = teacher.getName();
	%>
	<br />
	<br /> 来自：<%=teacherName%><br />
	<a href="download?<%="fileName=" + fileName%>">文件名：<%=fileName%><br /></a>
	<%
		if (acceptState) {
									out.println("已下载");
								} else {
									out.println("未下载");
								}
	%>
	<%
		}
						}
					}
				} else {
					out.println("您的身份不合法，请重新登陆");
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