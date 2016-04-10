package com.system.test;

import com.system.entity.Student;
import com.system.entity.Teacher;
import com.system.service.BindingService;

public class BindingServiceTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Teacher teacher=new Teacher();
		teacher.setEmail("20142152");
		Student student=new Student();
		student.setEmail("yytwz96@163.com");
		boolean b=new BindingService().InsertBindStudentTeacher(student, teacher);
		System.out.println(b);
	}

}
