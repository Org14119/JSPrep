package com.system.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.system.entity.ObjectQuestion;
import com.system.entity.QuestionSpace;

public interface ObjectQuestionDAO {
	public void insert(Connection conn, ObjectQuestion question, QuestionSpace space) throws SQLException;

	public void update(Connection conn, ObjectQuestion question) throws SQLException;

	public void delete(Connection conn, ObjectQuestion question) throws SQLException;

	public ResultSet get(Connection conn, QuestionSpace space) throws SQLException;
}
