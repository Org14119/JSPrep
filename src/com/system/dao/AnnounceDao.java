package com.system.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.system.entity.Announce;
import com.system.entity.Teacher;

public interface AnnounceDao {
	public void insert(Connection conn, Announce announce, Teacher teacher) throws SQLException;

	public void update(Connection conn, Announce annnounce) throws SQLException;

	public void delete(Connection conn, Announce announce) throws SQLException;

	public ResultSet get(Connection conn, Announce announce) throws SQLException;

	public ResultSet get(Connection conn, Teacher teacher) throws SQLException;
}
