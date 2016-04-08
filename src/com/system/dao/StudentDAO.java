package com.system.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.system.entity.*;

public interface StudentDAO {
	public void save(Connection conn, Student studnet) throws SQLException;

	public void update(Connection conn,Student studnet) throws SQLException;

	public void delete(Connection conn, Student student) throws SQLException;

	public ResultSet get(Connection conn, Student student) throws SQLException;
}
