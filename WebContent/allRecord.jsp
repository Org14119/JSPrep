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
		if (!session.isNew()) {

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
					String spaceID = request.getParameter("spaceID");

					//out.print(spaceID);
					System.out.println("shabi" + spaceID);

					QuestionSpace currentTeacherSpace = new QuestionSpace();
					currentTeacherSpace.setId(Long.parseLong(spaceID));
					System.out.println("zcP" + currentTeacherSpace.getId());
					Map<Test, Student> map = new TestService().getTestRecord(currentTeacherSpace);
					Test test = new Test();
					Student student = new Student();
					int i = 1;
					int all = 0;
					int checked = 0;
					int score = 0;
					String state = "";
					String str = "";
					if (map != null) {
	%>
	未批改:
	<br>
	<br> 考试:
	<br> 姓名 性别 邮箱 考试时间 分数 操作
	<br>
	<%
		for (Map.Entry<Test, Student> me : map.entrySet()) {
							test = me.getKey();
							student = me.getValue();
							if (student.getGender() == "0") {
								student.setGender("男");
							} else {
								student.setGender("女");
							}

							if (test.isExam()) {
	%>

	<%
		Map<Integer, Integer> map1 = new TestService().getCheckState(test);
								if (map1 != null) {
									for (Map.Entry<Integer, Integer> m : map1.entrySet()) {
										all = m.getKey();
										checked = m.getValue();
									}
									if (all != 0 && all > checked) {
										str = "批改";
	%>

	<%=student.getName() + "  " + student.getGender() + "  "
													+ student.getEmail() + "   " + test.getTestTime()%>
	<%=score + "分"%>

	<a href="checkTest.jsp?testID=<%=test.getTestID()%>"><%=str%></a>
	<br>



	<%
		}
								} else {
									out.println("系统繁忙，请稍候重试！");
	%>
	<a href="viewMyTestRecord.jsp">返回上一页</a>
	<%
		}
	%>


	<%
		}

						}
					} else {
						out.println("系统繁忙，请稍候重试！");
	%>
	<a href="viewMyTestRecord.jsp">返回上一页</a>

	<%
		}
					/**********************************/
					if (map != null) {
	%>
	练习:
	<br> 姓名 性别 邮箱 考试时间 分数 操作
	<br>
	<%
		for (Map.Entry<Test, Student> me : map.entrySet()) {
							test = me.getKey();
							student = me.getValue();
							if (student.getGender() == "0") {
								student.setGender("男");
							} else {
								student.setGender("女");
							}

							if (!test.isExam()) {
	%>

	<%
		Map<Integer, Integer> map2 = new TestService().getCheckState(test);
								if (map2 != null) {
									for (Map.Entry<Integer, Integer> m : map2.entrySet()) {
										all = m.getKey();
										checked = m.getValue();
									}
									if (all != 0 && all > checked) {
										str = "批改";
	%>

	<%=student.getName() + "  " + student.getGender() + "  "
													+ student.getEmail() + "   " + test.getTestTime()%>
	<%=score + "分"%>

	<a href="checkTest.jsp?testID=<%=test.getTestID()%>"><%=str%></a>
	<br>



	<%
		}
								} else {
									out.println("系统繁忙，请稍候重试！");
	%>
	<a href="viewMyTestRecord.jsp">返回上一页</a>
	<%
		}
	%>


	<%
		}

						}
					} else {
						out.println("系统繁忙，请稍候重试！");
	%>
	<a href="viewMyTestRecord.jsp">返回上一页</a>

	<%
		}

					/********************************/

					if (map != null) {
	%>
	已批改:
	<br>
	<br> 考试:
	<br> 姓名 性别 邮箱 考试时间 分数 操作
	<br>
	<%
		for (Map.Entry<Test, Student> me : map.entrySet()) {
							test = me.getKey();
							student = me.getValue();
							if (student.getGender() == "0") {
								student.setGender("男");
							} else {
								student.setGender("女");
							}

							if (test.isExam()) {
	%>

	<%
		Map<Integer, Integer> map3 = new TestService().getCheckState(test);
								if (map3 != null) {
									for (Map.Entry<Integer, Integer> m : map3.entrySet()) {
										all = m.getKey();
										checked = m.getValue();
									}
									if (all != 0 && all == checked) {
										str = "查看答题情况";
										Test tempTest = new TestService().getTestRecord(test);
										if (tempTest != null) {
	%>

	<%=student.getName() + "  " + student.getGender() + "  "
														+ student.getEmail() + "   " + test.getTestTime()%>
	<%=tempTest.getTestScore() + "分"%>

	<a href="viewStudentTestPaper.jsp?testID=<%=test.getTestID()%>"><%=str%></a>
	<br>


	<%
		} else {
	%>
	<%="错误"%>
	<a href="index.jsp">登录</a>

	<%
		}
	%>





	<%
		}
								} else {
									out.println("系统繁忙，请稍候重试！");
	%>
	<a href="viewMyTestRecord.jsp">返回上一页</a>
	<%
		}
	%>


	<%
		}

						}
					} else {
						out.println("系统繁忙，请稍候重试！");
	%>
	<a href="viewMyTestRecord.jsp">返回上一页</a>

	<%
		}

					/********************************/

					if (map != null) {
	%>
	<br> 练习:
	<br> 姓名 性别 邮箱 考试时间 分数 操作
	<br>
	<%
		for (Map.Entry<Test, Student> me : map.entrySet()) {
							test = me.getKey();
							student = me.getValue();
							if (student.getGender() == "0") {
								student.setGender("男");
							} else {
								student.setGender("女");
							}
							if (!test.isExam()) {
	%>

	<%
		Map<Integer, Integer> map4 = new TestService().getCheckState(test);
								if (map4 != null) {
									for (Map.Entry<Integer, Integer> m : map4.entrySet()) {
										all = m.getKey();
										checked = m.getValue();
									}
									if (all != 0 && all == checked) {
										str = "查看答题情况";
										Test tempTest = new TestService().getTestRecord(test);
										if (tempTest != null) {
	%>
	<%=student.getName() + "  " + student.getGender() + "  "
														+ student.getEmail() + "   " + test.getTestTime()%>
	<%=tempTest.getTestScore() + "分"%>

	<a href="viewStudentTestPaper.jsp?testID=<%=test.getTestID()%>"><%=str%></a>
	<br>

	<%
		} else {
	%>
	<%="错误"%>
	<a href="index.jsp">登录</a>

	<%
		}
	%>





	<%
		}
								} else {
									out.println("系统繁忙，请稍候重试！");
	%>
	<a href="viewMyTestRecord.jsp">返回上一页</a>
	<%
		}
	%>


	<%
		}

						}
					} else {
						out.println("系统繁忙，请稍候重试！");
	%>
	<a href="viewMyTestRecord.jsp">返回上一页</a>

	<%
		}
					/*******************************/
	%>




	<%
		} else {
					session.invalidate();
					response.sendRedirect("index.jsp");
				}
	%>
	<%
		}

		} else {
	%>
	<%="会话过期或者未登录，请重新登录"%>
	<a href="index.jsp">登录</a>
	<%
		}
	%>
</body>
</html>