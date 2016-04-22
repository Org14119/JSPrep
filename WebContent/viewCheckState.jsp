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
<body>
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
				out.println(type);
				Student s = (Student) session.getAttribute("student");
				boolean flag = (boolean) session.getAttribute("state");
				out.println(flag && type.equals("student"));
				if (flag && type.equals("student")) {
					out.println("欢迎您，" + s.getName() + "学生!");
					String testID=request.getParameter("testID");
					Test test=new Test();
					test.setTestID(Integer.parseInt(testID));
					Map<Integer,Integer> map=new TestService().getCheckState(test);
					int all=0;
					int checked=0;
					int rest=0;
					if(map!=null){
						for(Map.Entry<Integer,Integer> me:map.entrySet()){
							all=me.getKey();
							checked=me.getValue();
							rest=all-checked;
						}
						out.println("已经批改了"+String.valueOf(checked)+"道题，还剩"+String.valueOf(rest)+"道题未批改");
						%>
						<a href="viewMyTestRecord.jsp">返回上一页</a>
						
						
				<% 	
					}
					else{
						out.println("系统繁忙，请稍候重试！");%>
						<a href="studentIndex.jsp">返回首页</a>
			<% 		}
					
					
					
					
					
					
					
					
					
					
					
					
					
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