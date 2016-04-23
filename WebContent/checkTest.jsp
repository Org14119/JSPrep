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
							String testID=request.getParameter("testID");
							Test test=new Test();
							test.setTestID(Integer.parseInt(testID));
							Map<ObjectQuestion, ObjectAnswer> map=new ObjectAnswerService().getObjectAnswer(test);
							ObjectQuestion tempObjectQuestion=new ObjectQuestion();
							ObjectAnswer tempObjectAnswer=new ObjectAnswer();
							int i=1;
							String myAnswer="";
							if(map!=null){
								for(Map.Entry<ObjectQuestion, ObjectAnswer> me:map.entrySet()){
									tempObjectQuestion=me.getKey();
									tempObjectAnswer=me.getValue();
									if(tempObjectAnswer.getAnswerContent()==1){
										myAnswer="A";
									}
									else if(tempObjectAnswer.getAnswerContent()==2){
										myAnswer="B";
									}
									else if(tempObjectAnswer.getAnswerContent()==3){
										myAnswer="C";
									}
									else if(tempObjectAnswer.getAnswerContent()==4){
										myAnswer="D";
									}
									else if(tempObjectAnswer.getAnswerContent()==0){
										myAnswer="未作答";
									}
			
								
									
									
									%>
										<div>
										<br/>
											第<%=i%>题
											<%=tempObjectQuestion.getTitle() + "(" + tempObjectQuestion.getScore() + "分)"%><br/><br/>
											A.<%=tempObjectQuestion.getChoiceA()%><br>
											B.<%=tempObjectQuestion.getChoiceB()%><br>
											C.<%=tempObjectQuestion.getChoiceC()%><br>
											D.<%=tempObjectQuestion.getChoiceD()%><br>
											考生所选答案：<%=myAnswer %><br>
											
										</div>
									
									
									
									
								<%
								i++;}%>
								<br/>
								<form method="post"   action="check">
								<input type="hidden" name="testID" value=<%=testID%> >
								<input type="submit" name="submit" value="批改">
								</form>
								<a href="allRecord.jsp">返回上一页</a>
								
								
							<% }
				
							else{
								out.println("系统繁忙，请稍候重试！");%>
								<a href="viewAllTests.jsp">返回上一页</a>
								
							<%}
								
	
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