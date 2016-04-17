package com.system.daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.system.dao.TeacherQuestionSpaceDAO;
import com.system.entity.QuestionSpace;
import com.system.entity.Teacher;

public class TeacherQuestionSpaceDaoImpl implements TeacherQuestionSpaceDAO {

	@Override
	public void insert(Connection conn, QuestionSpace space, Teacher teacher) throws SQLException {
		// TODO Auto-generated method stub
		String insertSQL = "INSERT INTO tbl_teacherquestionspace (name,type,beginTime,endTime,teacherID) VALUES(?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(insertSQL);
		ps.setString(1, space.getName());
		ps.setString(2, space.getType());
		ps.setDate(3, space.getBeginTime());
		ps.setLong(5, teacher.getId());
		ps.setDate(4, space.getEndTime());
		ps.execute();

	}

	@Override
	public void update(Connection conn, QuestionSpace space) throws SQLException {
		// TODO Auto-generated method stub
		String updateSQL = "UPDATE tbl_teacherquestionspace SET beginTime=? name=? type=? endTime=? WHERE id=?";
		PreparedStatement ps = conn.prepareStatement(updateSQL);
		ps.setDate(1, (Date) space.getBeginTime());
		ps.setString(2, space.getName());
		ps.setString(3, space.getType());
		ps.setDate(4, (Date) space.getEndTime());
		ps.setLong(5, space.getId());

		ps.execute();
	}

	@Override
	public void delete(Connection conn, QuestionSpace space) throws SQLException {
		// TODO Auto-generated method stub
		String deleteSQL = "DELETE FROM tbl_teacherquestionspace WHERE id=?";
		PreparedStatement ps = conn.prepareStatement(deleteSQL);
		ps.setLong(1, space.getId());
		ps.execute();

	}

	@Override
	public ResultSet get(Connection conn, Teacher teacher) throws SQLException {
		// TODO Auto-generated method stub
		String getSQL = "SELECT tbl_teacherquestionspace.id,tbl_teacherquestionspace.type,tbl_teacherquestionspace.name,tbl_teacherquestionspace.beginTime,tbl_teacherquestionspace.endTime FROM tbl_teacher,tbl_teacherquestionspace WHERE tbl_teacher.teacherID=? AND tbl_teacherquestionspace.teacherID=tbl_teacher.teacherID";
		PreparedStatement ps = conn.prepareStatement(getSQL);
		ps.setLong(1, teacher.getId());
		return ps.executeQuery();
	}

}
