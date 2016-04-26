package com.system.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.system.daoImpl.FileDaoImpl;
import com.system.entity.SaveFile;
import com.system.entity.Student;
import com.system.entity.Teacher;
import com.system.util.ConnectionFactory;

public class NormalFileService {
	public boolean upFile(Student student, Teacher teacher, SaveFile file) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		student = new ConsultService().getStudentID(student);
		teacher = new ConsultService().getTeacherID(teacher);
		try {
			conn.setAutoCommit(false);
			new FileDaoImpl().insert(conn, student, teacher, file);
			conn.commit();
			return true;
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
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	public boolean upFile(Teacher teacher, Student student, SaveFile file) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		student = new ConsultService().getStudentID(student);
		teacher = new ConsultService().getTeacherID(teacher);
		try {
			conn.setAutoCommit(false);
			new FileDaoImpl().insert(conn, teacher, student, file);
			conn.commit();
			return true;
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
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
}
