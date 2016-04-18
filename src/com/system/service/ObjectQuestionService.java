package com.system.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.system.daoImpl.ObjectQuestionDaoImpl;
import com.system.entity.ObjectQuestion;
import com.system.entity.QuestionSpace;
import com.system.util.ConnectionFactory;

public class ObjectQuestionService {
	/*
	 * 添加题目的时候使用，需要题库对象（包含ID)，需要题目对象(包含详细信息）
	 */
	public boolean addQuestionToSpace(ObjectQuestion question, QuestionSpace space) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		try {
			conn.setAutoCommit(false);
			new ObjectQuestionDaoImpl().insert(conn, question, space);
			conn.commit();
			conn.close();
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
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	
	
}
