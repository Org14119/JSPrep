package com.system.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.system.daoImpl.Student_TeacherDaoImpl;
import com.system.entity.Student;
import com.system.entity.Teacher;
import com.system.util.ConnectionFactory;

public class viewTeacherService {
	/*
	 * 传入的内容至少是学生的Email，如果没有数据，返回null
	 */
	public List<Teacher> getBindingTeachers(Student s) {
		List<Teacher> teachers = new ArrayList<Teacher>();

		ConsultService cService = new ConsultService();
		s = cService.getStudentID(s);
		if (s != null) {
			Connection conn = ConnectionFactory.getInstace().makeConnection();
			ResultSet teacherSet = null;
			try {
				conn.setAutoCommit(false);
				teacherSet = new Student_TeacherDaoImpl().getAllBindingTeachersOfStudent(conn, s);
				while (teacherSet.next()) {
					Teacher teacher = new Teacher();
					teacher.setId(teacherSet.getLong("teacherID"));
					teacher = cService.getTeacherByID(teacher);
					teachers.add(teacher);
				}
				conn.commit();
				return teachers;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				try {
					conn.rollback();
					System.out.println("回滚");
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

			} finally {
				try {
					teacherSet.close();
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

		} else {
			return null;
		}
		return teachers;

	}

}
