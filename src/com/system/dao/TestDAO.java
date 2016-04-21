package com.system.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.system.entity.QuestionSpace;
import com.system.entity.Student;
import com.system.entity.Test;

public interface TestDAO {
	public ResultSet insert(Connection conn, Student student, QuestionSpace space,Test test) throws SQLException;

	public void update(Connection conn, Test test) throws SQLException;

	public void delete(Connection conn, Test test) throws SQLException;

	public ResultSet get(Connection conn, Test test) throws SQLException;
}
