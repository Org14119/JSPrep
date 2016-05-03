<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.system.service.*"%>
<%@page import="java.util.*"%>
<%@page import="com.system.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--<base href="http://localhost:8080/Portal/">-->
<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
		Remove this if you use the .htaccess -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>查看试题</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="keywords" content="">
<!--<link rel="shortcut icon" href="http://localhost:8080/Portal/../resources/images/favicon.ico" />-->
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
</style>

</head>
<body>
	<header>
	<div class="container">
		<div class="row">
			<div class="col-xs-5">
				<div class="logo">
					<h1>
						<a href="#"><img alt="" src="../resources/images/logo.png"></a>
					</h1>
				</div>
			</div>
			<div class="col-xs-7" id="login-info">

				<a class="btn btn-primary" href="user-register">欢迎您kim！</a>
				<!--跳转到登陆界面-->
				<a class="btn btn-success" href="user-login-page">退出</a>

			</div>
		</div>
	</div>
	</header>
	<!-- Navigation bar starts -->

	<div class="navbar bs-docs-nav" role="banner">
		<div class="container">
			<nav class="collapse navbar-collapse bs-navbar-collapse"
				role="navigation">
			<ul class="nav navbar-nav">
				<li class="active"><a href="主页.html"><i class="fa fa-home"></i>主页</a>
				</li>
				<li><a href="查看试题.html"><i class="fa fa-edit"></i>试题练习</a></li>
				<li><a href="在线考试.html"><i class="fa fa-dashboard"></i>在线考试</a>
				</li>
				<li><a href="@老师.html"><i class="fa fa-cogs"></i>@老师</a></li>
				<li><a href="绑定老师.html"><i class="fa fa-dashboard"></i>绑定老师</a>
				</li>
				<li><a href="考试成绩反馈.html"><i class="fa fa-dashboard"></i>成绩反馈</a>
				</li>
			</ul>
			</nav>
		</div>
	</div>

	<!-- Navigation bar ends -->
	<%
		if (!(session.isNew() || session == null || session.getAttribute("announceList") == null)) {
			List<Announce> announceList = (List) session.getAttribute("announceList");
			long id = Long.valueOf(request.getParameter("announceID"));
			Announce ann = null;
			for (Announce tempAnn : announceList) {
				if (tempAnn.getId() == id) {
					ann = tempAnn;
				}
			}
			if (ann != null) {
	%>

	<!-- Slider starts -->
	<div class="content" style="margin-bottom: 100px;">

		<div class="container">
			<tr>

				<div class="row">
					<div class="col-xs-12">
						<div style="border-bottom: 1px solid #ddd;">
							<br />
							<h3 class="title">
								<i class="fa fa-book"></i> 公告
							</h3>
							<br />
							<!-- 这里面的 是默认的第一题库 -->
						</div>

						<table class="table-striped table">

							<tbody>

								<tr>
									<td><strong><%=ann.getTitle() %></strong></td>
								<tr>
									<td><%=ann.getContent() %></td>
								</tr>




							</tbody>
							<tfoot></tfoot>
						</table>
					</div>

				</div>
		</div>

	</div>

	<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="copy">
					<p>
						在线考试系统 ©
						<!-- 这里面的 连接是本网站的连接 -->
						<a href="公告板.html" target="_blank">在线考试系统的主页</a> - <a href="."
							target="_blank">公告板</a>
					</p>
				</div>
			</div>
		</div>

	</div>

	</footer>

	<!-- Slider Ends -->

	<!-- Javascript files -->
	<!-- jQuery -->
	<%
		}

		}
	%>
</body>
</html>