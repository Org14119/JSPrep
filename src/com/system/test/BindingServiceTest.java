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
		for(int i=0;i<10000;i++){
			new BindingService().InsertBindStudentTeacher(student, teacher);
			System.out.println("ok"+i);
		}
		boolean b=new BindingService().InsertBindStudentTeacher(student, teacher);
		System.out.println(b);
	}

}
