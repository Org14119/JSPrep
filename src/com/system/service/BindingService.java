package com.system.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.system.daoImpl.StudentDaoImpl;
import com.system.daoImpl.Student_TeacherDaoImpl;
import com.system.daoImpl.TeacherDaoImpl;
import com.system.entity.Student;
import com.system.entity.Teacher;
import com.system.util.ConnectionFactory;

public class BindingService {
	/*
	 * 传入需要绑定的学生和老师，其中均必须有Email这个属性
	 */
	public boolean InsertBindStudentTeacher(Student student,Teacher teacher){
		Connection conn=ConnectionFactory.getInstace().makeConnection();
		ResultSet studentSet=null;
		ResultSet teacherSet=null;
		try {
			conn.setAutoCommit(false);
			studentSet=new StudentDaoImpl().get(conn, student);
			teacherSet=new TeacherDaoImpl().get(conn,teacher);
			//获得ID
			while(studentSet.next()){
				student.setId(studentSet.getLong("studentID"));
			}
			while(teacherSet.next()){
				teacher.setId(teacherSet.getLong("teacherID"));
			}
			if(student.getId()==null||teacher.getId()==null){
				return false;
			}else{
				new Student_TeacherDaoImpl().insert(conn, student, teacher);
				conn.commit();
				return true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return false;
		}finally{
			try {
				teacherSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				studentSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
