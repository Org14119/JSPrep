<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.system.service.*"%>
<%@page import="java.util.*"%>
<%@page import="com.system.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
#one{
margin:0 0 200px 0; 
width: 68px;
height:20px;
border:1px solid #100;
float:left
}
#two{
margin:0 0 250px 0; 
width: 68px;
height:20px;
border:1px solid #100;
float:left
}
#three{
margin:0 0 300px 0; 
width: 68px;
height:20px;
border:1px solid #100;
float:left
}


</style>
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
						int all=0;
						int checked=0;
// 						int score=0;
						String state="未知";
					   String str="查看试卷";
						
						
						
						QuestionSpace qs=new QuestionSpace();
						Teacher myTeacher=new Teacher();
						Iterator<Test> iterList=testRecord.iterator();%><br/><br/>
						考试记录：<br/><br/>
						科目                           老师                                                                    考试时间                                                                                状态                             分数                                操作<br/><br/>
						<%while(iterList.hasNext()){
							Test t=iterList.next();
							if(t.isExam()){%>
							<%
							Map<Integer,Integer> map=new TestService().getCheckState(t);

							if(map!=null){
								for(Map.Entry<Integer,Integer> me:map.entrySet()){
									all=me.getKey();
									checked=me.getValue();
								}
								if(all==checked&&all!=0){
									state="批改完成";
									str="查看试卷";
// 									score=new CheckTestService().checkTest(t);
// 									if(score==-1){
// 										state="批改失败";
// 										str="无法查看";
// 										score=0;
// 									}
							
								}
								else if(all!=0&&all>checked){
									state="未批改";
									str="查看试卷";
								}
								else if(all==0){
									state="未知";
									str="无法查看";
								}
								}
				
								
							else{
								state="异常";%>
								
		<% 					}

%>	
<%
Map<QuestionSpace, Teacher> myMap=new TestService().getDetailOfTest(t);
if(myMap!=null){
	for(Map.Entry<QuestionSpace, Teacher> me:myMap.entrySet()){
		qs=me.getKey();
		myTeacher=me.getValue();
	}
}
else{
	qs.setName("未知");
	myTeacher.setName("未知");
}

%>

								<div>
								<%=qs.getName()+"      "+ myTeacher.getName()+ "           "+t.getTestTime()+"   "%>
								<div id="one">
								<form method="post"  action="viewCheckState.jsp">
								<input type="hidden" name="testID" value=<%=t.getTestID() %>>
								<input type="submit" name="submit" value=<%=state %>>
								</form>		
								</div>
							   <div id="two">
							   <%=t.getTestScore()+"        " %>
							   </div>

							
								
								
								<%if(str.equals("查看试卷")){%>
								<div id="three">
								<form method="post"  action="viewMyPapers.jsp">
								<input type="hidden" name="testID" value=<%=t.getTestID() %>>
								<input type="submit" name="submit" value=<%=str %>>
								</form>
								</div>

							
								<% }
								else{%>
									<%=str %>
								<% }
								%>
								
								</div><br>
							<% }}
						
						Iterator<Test> iterList1=testRecord.iterator();%><br/><br/>
						练习记录：<br/><br/>
						科目                           老师                         考试 时间                            状态                             分数                                操作<br/><br/>
						<%while(iterList1.hasNext()){
							Test t=iterList1.next();
							if(t.isExam()==false){%>
							
													<%
							Map<Integer,Integer> map=new TestService().getCheckState(t);

							if(map!=null){
								for(Map.Entry<Integer,Integer> me:map.entrySet()){
									all=me.getKey();
									checked=me.getValue();
								}
								if(all==checked&&all!=0){
									state="批改完成";
									str="查看试卷";
// 									score=new CheckTestService().checkTest(t);
// 									if(score==-1){
// 										state="批改失败";
// 										str="无法查看";
// 										score=0;
// 									}
								}
								else if(all!=0&&all>checked){
									state="未批改";
									str="查看试卷";
								}
								else if(all==0){
									state="未知";
									str="无法查看";
								}
				
								}
							else{
								state="异常";%>
		<% 					}

%>
	<%
Map<QuestionSpace, Teacher> myMap=new TestService().getDetailOfTest(t);
if(myMap!=null){
	for(Map.Entry<QuestionSpace, Teacher> me:myMap.entrySet()){
		qs=me.getKey();
		myTeacher=me.getValue();
	}
}
else{
	qs.setName("未知");
	myTeacher.setName("未知");
}
%>						
							
								<div>
									<%=qs.getName()+"      "+ myTeacher.getName()+ "           "+t.getTestTime()+"   "%>
									<div id="one">
							    <form method="post"  action="viewCheckState.jsp">
								<input type="hidden" name="testID" value=<%=t.getTestID() %>>
								<input type="submit" name="submit" value=<%=state %>>
								</form>
									</div>
									<div id="two">
									<%=t.getTestScore()+"        " %>
									</div>

								<%if(str.equals("查看试卷")){%>
							    <div id="three">
							    
								<form method="post"  action="viewMyPapers.jsp">
								<input type="hidden" name="testID" value=<%=t.getTestID() %>>
								<input type="submit" name="submit" value=<%=str %>>
								</form>    
							    
								</div>

								<% }
								else if(str.equals("无法查看")){%>
									<%=str %>
								<% }
								%>
								
								</div>
							<% }	
						}
						
					}
					else if(testRecord!=null&&testRecord.isEmpty()){
						out.println("当前没有考试记录！");%>
						<a href="studentIndex.jsp">返回首页</a>
						
				<% 	}}


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