package com.system.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.system.daoImpl.TeacherDaoImpl;
import com.system.entity.Teacher;
import com.system.util.ConnectionFactory;

public class ConsultService {
	/*
	 * 返回所有老师的集合，如果查询异常返回null
	 */
	public List<Teacher> getAllTeachers() {
		List<Teacher> teachers = new ArrayList<Teacher>();
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		ResultSet teacherSet = null;
		try {
			conn.setAutoCommit(false);
			teacherSet = new TeacherDaoImpl().getAll(conn);
			while (teacherSet.next()) {
				Teacher temp = new Teacher();
				temp.setEmail(teacherSet.getString("teacherEmail"));
				temp.setGender(teacherSet.getString("teacherGender"));
				temp.setName(teacherSet.getString("teacherName"));
				temp.setPassword(teacherSet.getString("teacherPassword"));
				temp.setPhone(teacherSet.getString("teacherPhone"));
				teachers.add(temp);
			}
			conn.commit();
			return teachers;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return null;
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
	}
}
