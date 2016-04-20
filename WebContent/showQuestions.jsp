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

QuestionSpace currentTeacherSpace2 = (QuestionSpace)session.getAttribute("currentTeacherSpace");
if(currentTeacherSpace2==null){
	response.sendRedirect("error.jsp");
	return;
}
else{
	Vector<ObjectQuestion>  objectQuestionLists=new ObjectQuestionService().getAllQuestionOfSpace(currentTeacherSpace2);
	if( objectQuestionLists!=null){
		Iterator<ObjectQuestion> iterList= objectQuestionLists.iterator();
		int i=1;
		while(iterList.hasNext()){
			ObjectQuestion o=iterList.next();
			System.out.println("第一题、单项选择。");
			System.out.println(i+"、");
			System.out.print(o.getTitle());
			System.out.println("("+o.getScore()+"分)");
			System.out.println("A、 "+o.getChoiceA());
			System.out.println("B、 "+o.getChoiceB());
			System.out.println("C、 "+o.getChoiceC());
			System.out.println("D、 "+o.getChoiceD());
			System.out.println("答案解析："+o.getCorrectAnswer());
			System.out.println(o.getScore());
			i++;
		}
	}

	}




%>

</body>
</html>