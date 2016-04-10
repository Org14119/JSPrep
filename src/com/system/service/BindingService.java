package com.system.service;

import java.sql.Connection;

import java.sql.SQLException;


import com.system.daoImpl.Student_TeacherDaoImpl;

import com.system.entity.Student;
import com.system.entity.Teacher;
import com.system.util.ConnectionFactory;

public class BindingService {

	/*
	 * 传入需要绑定的学生和老师，其中均必须有Email这个属性
	 */
	public boolean InsertBindStudentTeacherService(Student student, Teacher teacher) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();

		ConsultService service = new ConsultService();
		try {
			conn.setAutoCommit(false);
			student = service.getStudentID(student);
			teacher = service.getTeacherID(teacher);

			if (student == null || teacher == null || student.getId() == null || teacher.getId() == null
					|| teacher.getId().equals("") || student.getId().equals("")) {
				return false;
			} else {
				new Student_TeacherDaoImpl().insert(conn, student, teacher);
				conn.commit();
				//System.out.println("绑定申请提交");
				return true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				conn.rollback();
				//System.out.println("回滚");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return false;
		} finally {

			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/*
	 * 
	 * 更改绑定状态
	 * 
	 */
	public boolean acceptBindingService(Student student, Teacher teacher) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		ConsultService service = new ConsultService();
		try {
			conn.setAutoCommit(false);
			student = service.getStudentID(student);
			teacher = service.getTeacherID(teacher);

			if (student == null || teacher == null || student.getId() == null || teacher.getId() == null
					|| teacher.getId().equals("") || student.getId().equals("")) {
				return false;
			} else {
				new Student_TeacherDaoImpl().changeState(conn, student, teacher, true);
				conn.commit();
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
			return false;
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public boolean cancelBindingService(Student student, Teacher teacher) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		ConsultService service = new ConsultService();
		try {
			conn.setAutoCommit(false);
			student = service.getStudentID(student);
			teacher = service.getTeacherID(teacher);
			if (student == null || teacher == null || student.getId() == null || teacher.getId() == null
					|| student.getId().equals("") || teacher.getId().equals("")) {
				return false;
			}else{
				Student_TeacherDaoImpl std=new Student_TeacherDaoImpl();
				std.changeState(conn, student, teacher, false);
				std.delete(conn, student, teacher);
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
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
