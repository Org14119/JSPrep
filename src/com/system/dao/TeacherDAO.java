package com.system.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.system.entity.*;

public interface TeacherDAO {
	public void save(Connection conn, Teacher teacher) throws SQLException;

	public void update(Connection conn, Teacher teacher) throws SQLException;

	public void delete(Connection conn, Teacher teacher) throws SQLException;

	public ResultSet get(Connection conn, Teacher teacher) throws SQLException;
}
