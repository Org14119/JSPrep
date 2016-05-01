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
					|| session.getAttribute("state") == null || session.getAttribute("teacher") == null) {
				out.println("会话已经过期，请重新登陆");
	%>
	<%
		} else {
	%>
	<%
		Teacher teacher = (Teacher) session.getAttribute("teacher");
				if (teacher != null) {

					Map<SaveFile, Student> map = new NormalFileService().getSendFile(teacher);
					if (map != null) {
						for (Map.Entry<SaveFile, Student> entry : map.entrySet()) {
							SaveFile sfile = entry.getKey();
							Student student = entry.getValue();
							if (sfile != null && student != null) {
								String studentName = student.getName();
								boolean acceptState = sfile.isAccept();
								String fileName = sfile.getFileName();
								String fileLocate = sfile.getFileLocate();
	%>
	<a href="download?<%="fileName=" + fileName%>">文件名：<%=fileName%></a>
	<br /> 接收学生:<%=studentName%><br/>
	学生是否接收:<%=acceptState%><br /><br/>


	<%
		}
						}
					} else {
						out.println("查询失败");
					}
				} else {
					out.println("您的身份无法进行该操作");
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