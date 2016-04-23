<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="com.system.entity.*"%>
<%@ page import="com.system.service.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(!session.isNew()){


		if ((session == null) || session.getAttribute("type") == null || session.getAttribute("teacher") == null
				|| session.getAttribute("state") == null) {
	%>
	<%="会话过期或者未登录，请重新登录"%>
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
				out.print(spaceID);
				QuestionSpace currentTeacherSpace= new QuestionSpace();
				currentTeacherSpace.setId(Long.parseLong(spaceID));
				Map<Test, Student> map=new TestService().getTestRecord(currentTeacherSpace);
				Test test=new Test();
				Student student=new Student();
				int i=1;
				if(map!=null){%>
					姓名           性别               邮箱              考试时间                 状态              操作<br>
					<% for(Map.Entry<Test, Student> me:map.entrySet()){
						test=me.getKey();
						student=me.getValue();
						if(test.isExam()){%>
						<%=student.getName()+"  "+student.getGender()+"  "+student.getEmail()+"   "+test.getTestTime()%>
							
							
							
							
							
						<% }
						
						
						
						
					}
				}
				else{
					out.println("系统繁忙，请稍候重试！");%>
					<a href="viewMyTestRecord.jsp">返回上一页</a>
					
				<%}
				
				%>
			
			
				
				
	<% 			
			} else {
				session.invalidate();
				response.sendRedirect("index.jsp");
			}
	%>
	<%
		}

}
else{%>
<%="会话过期或者未登录，请重新登录"%>
<a href="index.jsp">登录</a>
<% 	}
%>
</body>
</html>