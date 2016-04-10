package com.system.daoImpl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.system.util.*;
import com.system.dao.Studnet_TeacherDAO;
import com.system.entity.Student;
import com.system.entity.Teacher;

public class Student_TeacherDaoImpl implements Studnet_TeacherDAO {

	@Override
	public void insert(Connection conn, Student student, Teacher teacher) throws SQLException {
		// TODO Auto-generated method stub
		String insertSql = "INSERT INTO tbl_student_teacher (studentID,teacherID,relationDate,relationState) VALUES(?,?,?,?) ";
		PreparedStatement ps = conn.prepareStatement(insertSql);
		ps.setLong(1, student.getId());
		ps.setLong(2, teacher.getId());
		ps.setDate(3, TimeUtil.getCurrentTime());
		ps.setInt(4, 0);// 默认绑定状态为0，即未绑定
		ps.execute();
	}

	@Override
	/*
	 * (non-Javadoc) 修改状态为1，即绑定成功
	 * 
	 * @see com.system.dao.Studnet_TeacherDAO#update(java.sql.Connection,
	 * com.system.entity.Student, com.system.entity.Teacher)
	 */
	public void update(Connection conn, Student student, Teacher teacher) throws SQLException {
		// TODO Auto-generated method stub
		String updateSql = "UPDATE tbl_student_teacher SET relationDate=? WHERE studentID=? AND teacherID=?";
		PreparedStatement ps = conn.prepareStatement(updateSql);
		ps.setDate(1, TimeUtil.getCurrentTime());
		ps.setLong(2, student.getId());
		ps.setLong(3, teacher.getId());
		ps.execute();
	}

	@Override
	public void delete(Connection conn, Student student, Teacher teacher) throws SQLException {
		// TODO Auto-generated method stub
		String deleteSql = "DELETE FROM tbl_student_teacher WHERE studentID=? AND teacherID=?";
		PreparedStatement ps = conn.prepareStatement(deleteSql);
		ps.setLong(1, student.getId());
		ps.setLong(2, teacher.getId());
		ps.execute();
	}

	@Override
	public ResultSet get(Connection conn, Student student, Teacher teacher) throws SQLException {
		// TODO Auto-generated method stub
		String getSql = "SELECT * FROM tbl_student_teacher WHERE studentID=? AND teacherID=?";
		PreparedStatement ps = conn.prepareStatement(getSql);
		ps.setLong(1, student.getId());
		ps.setLong(2, teacher.getId());
		return ps.executeQuery();
	}

	/*
	 * 更改绑定状态
	 */
	public void changeState(Connection conn, Student student, Teacher teacher, boolean bindingState)
			throws SQLException {
		String changeSql = "UPDATE tbl_student_teacher SET relationState=? WHERE studentID=? AND teacherID=?";
		PreparedStatement ps = conn.prepareStatement(changeSql);
		if (bindingState) {
			ps.setInt(1, 1);
		} else {
			ps.setInt(1, 0);
		}
		ps.setLong(2, student.getId());
		ps.setLong(3, teacher.getId());
		ps.execute();
	}
}
