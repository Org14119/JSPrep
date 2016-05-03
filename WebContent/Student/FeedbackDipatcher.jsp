<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.system.entity.*"%>
<%@page import="com.system.service.*"%>
<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="../resources/bootstrap/css/bootstrap-huan.css"
	rel="stylesheet">
<link href="../resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../resources/css/style.css" rel="stylesheet">

<style>
.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td,
	.table>tbody>tr>td, .table>tfoot>tr>td {
	padding: 8px 0;
	line-height: 1.42857143;
	vertical-align: middle;
	border-top: 1px solid #ddd;
}

a.join-practice-btn {
	margin-top: 0;
}
 .white_content1 { 
            display: none; 
            position: absolute; 
            top: 25%; 
            left: 25%; 
            width: 500px; 
            height: 300px; 
            padding: 5px; 
            border: 3px solid #5E42BD; 
            background-color: white; 
            z-index:1002; 
            overflow: auto;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	if (!(session.getAttribute("student") == null || request.getParameter("fdbktype") == null)) {
		//System.out.println("11111111111111111111111111111");
%>
<body>
	<%
		int type = Integer.parseInt((String) request.getParameter("fdbktype"));
			Vector<Test> testRecord = new TestService().getTestRecord((Student) session.getAttribute("student"));
			//System.out.println("已经有了vector");
			List<Test> examList = new ArrayList<Test>();//对应参数传来的1
			List<Test> practiceList = new ArrayList<Test>();//对应参数传来的0
			Iterator<Test> iter = testRecord.iterator();
			while (iter.hasNext()) {
				Test tempTest = iter.next();
				if (tempTest.isExam() == true) {
					examList.add(tempTest);
				} else {
					practiceList.add(tempTest);
				}
			}
	//确定使用哪个TestList
	%>

	<%
		Iterator<Test> testIter = null;
			if (type == 1) {
				testIter = examList.iterator();
			} else if (type == 0) {
				testIter = practiceList.iterator();
			}
	%>
	<table class="table-striped table">
		<!-- 这里大概是标题内容 -->
		<thead>

			<tr>
				<td>考试名字</td>
				<td>所属老师</td>
				<td>批改状态</td>
				<td>考试的类型</td>
				<td>时间</td>
				<td>得分</td>
				<td>操作</td>
			</tr>
		</thead>
		<!-- 这里大概是标题内容的结束 -->
			<tbody>
		<%
			while (testIter.hasNext()) {
					Test tempTest = testIter.next();
					int state=new TestService().getCheckStateInNumber(tempTest);
					String tempState="";
					if(state==0){
						tempState="未批改";
					}else if(state==1){
						tempState="已批改";
					}else if(state==-1){
						tempState="未知(您可能未作答)";
					}
					Teacher tempTeacher = null;
					QuestionSpace tempSpace = null;
					Map<QuestionSpace, Teacher> detailMap = new TestService().getDetailOfTest(tempTest);
					
					//获得详细信息
					for (Map.Entry<QuestionSpace, Teacher> entry : detailMap.entrySet()) {
						tempTeacher = entry.getValue();
						tempSpace = entry.getKey();
					}
					if (tempTest != null && tempSpace != null && tempTeacher != null) {
						
		%>

	

			<tr>
				<td><%=tempSpace.getName() %></td>

				<td><%=tempTeacher.getName() %></td>
				<td><a href="#" onclick = "document.getElementById('light').style.display='block'"><%=tempState %></a></td>
				<!-- 弹框在未修改这里-->

				<!-- 考试的类型-->
				<td><span class="span-info question-number"><%=tempSpace.getType() %></span></td>
				<!-- 考试的时间-->
				<td><%=tempTest.getTestTime() %></td>
				<!-- 考试的得分-->
				<td><%=tempTest.getTestScore() %></td>
				<!-- 考试的相关操作-->
				<!-- 这个具体页面还没有写，所以用#代替 -->
				<td><a href="#"
					class="btn btn-success btn-sm join-practice-btn">查看</a></td>
			</tr>


		
		<%
			}
		%>
		<%
			}
		%>
		</tbody>
		<tfoot></tfoot>
	</table>
	
	
	
	
	
	
	
	
	
	
	
		<div id="light" class="white_content1">
			 <p>123</p><br></br>	
			 <button href = "javascript:void(0)" 
					onclick ="document.getElementById('light').style.display='none'">关闭窗口</button>
		</div>
		
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
<%
	}else{
		//System.out.println("session控制异常");
		//System.out.println(session.getAttribute("student"));
		//System.out.println("session是空的?"+session.getAttribute("student")==null);
		//System.out.println(request.getParameter("fdbktype"));
		//System.out.println("request是空的？"+request.getParameter("fdbktype")==null);
	}
%>
</html>