package com.system.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.system.dao.TeacherDAO;
import com.system.entity.Teacher;

public class TeacherDaoImpl implements TeacherDAO {

	@Override
	public void insert(Connection conn, Teacher teacher) throws SQLException {
		// TODO Auto-generated method stub
		String insertSql = "INSERT INTO tbl_teacher (teacherEmail,teacherPassword,teacherName,teacherGender,teacherPhone) VALUES(?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(insertSql);
		ps.setString(1, teacher.getEmail());
		ps.setString(2, teacher.getPassword());
		ps.setString(3, teacher.getName());
		ps.setString(4, teacher.getGender());
		ps.setString(5, teacher.getPhone());
		ps.execute();

	}

	@Override
	public void update(Connection conn, Teacher teacher) throws SQLException {
		// TODO Auto-generated method stub

		String updateSql = "UPDATE tbl_teacher SET teacherPassword=?,teacherName=?,teacherGender=?,teacherPhone=? WHERE teacherEmail=?";
		PreparedStatement ps = conn.prepareStatement(updateSql);
		ps.setString(1, teacher.getPassword());
		ps.setString(2, teacher.getName());
		ps.setString(3, teacher.getGender());
		ps.setString(4, teacher.getPhone());
		ps.setString(5, teacher.getEmail());
		ps.execute();
	}

	@Override
	public void delete(Connection conn, Teacher teacher) throws SQLException {
		// TODO Auto-generated method stub
		String deleteSql = "DELETE FROM tbl_teacher WHERE teacherEmail=?";
		PreparedStatement ps = conn.prepareStatement(deleteSql);
		ps.setString(1, teacher.getEmail());
		ps.execute();

	}

	@Override
	public ResultSet get(Connection conn, Teacher teacher) throws SQLException {
		// TODO Auto-generated method stub
		String getSql = "SELECT * FROM tbl_teacher WHERE teacherEmail=?";
		PreparedStatement ps = conn.prepareStatement(getSql);
		ps.setString(1, teacher.getEmail());

		return ps.executeQuery();
	}

}
