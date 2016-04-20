package com.system.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.system.dao.TestDAO;
import com.system.entity.QuestionSpace;
import com.system.entity.Student;
import com.system.entity.Test;

public class TestDaoImpl implements TestDAO {
	private final String format = "%Y-%m-%d %H:%i:%s";

	@Override
	public void insert(Connection conn, Student student, QuestionSpace space, Test test) throws SQLException {
		// TODO Auto-generated method stub
		String insertSql = "INSERT INTO tbl_test (testTime,isExam,studentID,questionSpaceID,testScore) VALUES(STR_TO_DATE(?,?),?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(insertSql);

		ps.setString(1, test.getTestTime());
		ps.setString(2, format);
		ps.setInt(3, test.isExam() == true ? 1 : 0);
		ps.setLong(4, student.getId());
		ps.setLong(5, space.getId());
		ps.setInt(6, test.getTestScore());
		ps.execute();
	}

	@Override
	public void update(Connection conn, Test test) throws SQLException {
		// TODO Auto-generated method stub
		String updateSql = "UPDATE tbl_test SET testTime=STR_TO_DATE(?,?),isExam=?,testScore=? WHERE testID=?";
		PreparedStatement ps = conn.prepareStatement(updateSql);
		ps.setString(1, test.getTestTime());
		ps.setString(2, format);
		ps.setInt(3, test.isExam() == true ? 1 : 0);
		ps.setLong(4, test.getTestID());
		ps.setInt(5, test.getTestScore());
		ps.execute();

	}

	@Override
	public void delete(Connection conn, Test test) throws SQLException {
		// TODO Auto-generated method stub
		String deleteSql = "DELETE * FROM tbl_test WHERE testID=?";
		PreparedStatement ps = conn.prepareStatement(deleteSql);
		ps.setLong(1, test.getTestID());
		ps.execute();

	}

	@Override
	public ResultSet get(Connection conn, Test test) throws SQLException {
		// TODO Auto-generated method stub
		String getSql = "SELECT * FROM tbl_test WHERE testID=?";
		PreparedStatement ps = conn.prepareStatement(getSql);
		ps.setLong(1, test.getTestID());
		return ps.executeQuery();
	}

	/*
	 * 通过学生ID查找Test信息
	 */
	public ResultSet get(Connection conn, Student student) throws SQLException {

		String getSql = "SELECT tbl_test.testScore,tbl_test.testTime,tbl_test.isExam ,tbl_test.testID FROM tbl_test,tbl_student WHERE tbl_student.studentID=? AND tbl_student.studentID=tbl_test.studentID";
		PreparedStatement ps = conn.prepareStatement(getSql);
		ps.setLong(1, student.getId());
		return ps.executeQuery();
	}

	/*
	 * 通过题库ID查找Test信息,注意，该方法可以返回老师的ID
	 */
	public ResultSet get(Connection conn, QuestionSpace space) throws SQLException {
		String getSql = "SELECT tbl_test.testScore,tbl_test.testTime,tbl_test.isExam ,tbl_test.testID ,tbl_teacherquestionspace.id FROM tbl_test,tbl_teacherquestionspace WHERE tbl_teacherquestionspace.id=? AND tbl_teacherquestionspace.id=tbl_test.questionspaceID";
		PreparedStatement ps=conn.prepareStatement(getSql);
		ps.setLong(1, space.getId());
		return ps.executeQuery();
	}

}
