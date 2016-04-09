<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="teacherRegister">
邮箱：<input type="text" name="email"><br>
密码；<input type="password" name="password"><br>
确认密码；<input type="password" name="repassword"><br>
用户名:<input type="text" name="name"><br>
<input type="radio" name="sex" value="男">男<br>
<input type="radio" name="sex" value="女">女<br>
电话:<input type="text" name="phone"><br>
<input type="submit" name="submit" value="注册"><br>
</form>
</body>
</html>