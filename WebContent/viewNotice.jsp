<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.system.service.*"%>
<%@page import="java.util.*"%>
<%@page import="com.system.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告</title>
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
				Student s = (Student) session.getAttribute("student");
				boolean flag = (boolean) session.getAttribute("state");
				if (flag && type.equals("student")) {
					out.println("欢迎您，" + s.getName() + "学生!");
					List<Teacher> teachers = new ViewTeacherService().getBindedTeachers(s);
					Teacher t = new Teacher();
					if (teachers != null && teachers.size() > 0) {
						Iterator<Teacher> iterList = teachers.iterator();
						while (iterList.hasNext()) {
							t = iterList.next();
							List<Announce> list = new AnnounceService().getAnnounce(t);
							//System.out.println("list.size()====="+list.size());
							//	System.out.println("list"+list!=null);
							if (list != null && list.size() > 0) {
	%><br> 来自<%=t.getName()%>老师的公告：
	<br>
	<%
		Iterator<Announce> iterList2 = list.iterator();
								Announce notice = new Announce();
								int i = 0;
								while (iterList2.hasNext()) {
									notice = iterList2.next();
									i++;
	%>
	<br> 公告<%=i%><br> 标题：
	<br>
	<%=notice.getTitle()%><br> 内容：
	<br>
	<%=notice.getContent()%><br> 发布时间：
	<br>
	<%=notice.getTime()%>
	<%
		}
							} else if (list != null && list.size() == 0) {

							} else {
	%>
	系统繁忙，请稍候重试!
	<a href="studentIndex.jsp">返回</a>
	<%
		}

						}
					} else {
	%>
	<%="系统繁忙，请稍候重试"%>
	<a href="studentIndex.jsp">返回</a>
	<%
		}

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
	%>

	<a href="studentIndex.jsp">返回</a>
	<%
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