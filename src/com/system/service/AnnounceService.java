package com.system.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.system.daoImpl.AnnounceDaoImpl;
import com.system.entity.Announce;
import com.system.entity.Teacher;
import com.system.util.ConnectionFactory;

public class AnnounceService {
	public boolean addAnnounce(Announce announce, Teacher teacher) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		try {
			conn.setAutoCommit(false);
			new AnnounceDaoImpl().insert(conn, announce, teacher);
			conn.commit();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return false;
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
