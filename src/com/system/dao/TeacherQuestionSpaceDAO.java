package com.system.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.system.entity.QuestionSpace;
import com.system.entity.Teacher;

public interface TeacherQuestionSpaceDAO {
	public ResultSet insert(Connection conn, QuestionSpace space,Teacher teacher) throws SQLException;

	public void update(Connection conn, QuestionSpace space) throws SQLException;

	public void delete(Connection conn, QuestionSpace space) throws SQLException;

	public ResultSet get(Connection conn, Teacher teacher) throws SQLException;
}
