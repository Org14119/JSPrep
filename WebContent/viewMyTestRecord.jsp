<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.system.service.*"%>
<%@page import="java.util.*"%>
<%@page import="com.system.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看我的考试记录</title>
</head>
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
					Vector<Test> testRecord=new TestService().getTestRecord(s);
					if(testRecord!=null&&!testRecord.isEmpty()){
						Iterator<Test> iterList=testRecord.iterator();%>
						考试记录：
						科目                           老师                         考试 时间                            状态                             分数                                操作<br/><br/>
						<%while(iterList.hasNext()){
							Test t=iterList.next();
							if(t.isExam()){%>
								<div>
								<%="默认                           "+"默认                        "+t.getTestTime()+"   "+"默认"+t.getTestScore()+"        "%><a href="viewMyPaper.jsp">查询</a>
								
								</div>
							<% }
						}
						Iterator<Test> iterList1=testRecord.iterator();%><br/><br/>
						练习记录：
						科目                           老师                         考试 时间                            状态                             分数                                操作<br/><br/>
						<%while(iterList1.hasNext()){
							Test t=iterList1.next();
							if(t.isExam()==false){%>
								<div>
								<%="默认                           "+"默认                        "+t.getTestTime()+"   "+"默认"+t.getTestScore()+"        "%><a href="viewMyPaper.jsp">查询</a>
								
								</div>
							<% }	
						}
						
					}
					else if(testRecord!=null&&testRecord.isEmpty()){
						out.println("当前没有考试记录！");%>
						<a href="studentIndex.jsp">返回首页</a>
						
				<% 	}
					else{
						out.println("系统繁忙，请稍候重试！");%>
						<a href="studentIndex.jsp">返回首页</a>
						
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