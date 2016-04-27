<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@page import="com.system.service.*"%>
<%@page import="java.util.*"%>
<%@page import="com.system.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看公告</title>
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
							List<Announce> list=new AnnounceService().getAnnounce(t);
							int i=0;
							Announce notice=new Announce();
							if(list!=null){%>
							<% 
							Iterator<Announce> iterList=list.iterator();
							while(iterList.hasNext()){%>
								<%notice=iterList.next();
								i++;%><br>
								公告<%=i %><br>
								标题：<br>
								<%=notice.getTitle() %><br>
								内容：<br>
								<%=notice.getContent() %><br>
								发布时间：<br>
								<%=notice.getTime() %>
			<form method="post" action="deleteNotice.jsp">
			<input type="hidden" name="noticeID" value=<%=notice.getId() %>>
			<input type="submit"name="submit" value="删除该公告">
			</form>
								
								
							<% }
							%>
							<% }
							else{%>
								<%="系统繁忙，请稍候重试" %>
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

			}%>
			<a href="notice.jsp">返回</a>
		<% } else {
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
</body>
</html>