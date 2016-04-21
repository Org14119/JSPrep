package com.system.daoImpl;

import java.sql.Connection;
import java.sql.SQLException;

import java.util.Map;

import com.system.entity.ObjectAnswer;
import com.system.entity.ObjectQuestion;
import com.system.entity.Test;
import com.system.util.ConnectionFactory;

public class ObjectAnswerService {
	/*
	 * 在学生回答了一道题之后使用。 传入test对象，其中包含ID属性 传入question对象，其中包含ID属性
	 * 传入ObjectAnswer对象，其中包含学生的回答内容，回答的时间信息等 返回操作是否成功
	 * 
	 */
	public boolean addObjectAnswer(Test test, ObjectQuestion question, ObjectAnswer answer) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		try {
			conn.setAutoCommit(false);
			new ObjectAnswerInfoDaoImpl().insert(conn, test, question, answer);
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
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/*
	 * 需要添加许多answer信息的时候使用，注意事项如上 如果发生异常，返回false
	 */
	public boolean addObjectAnswer(Test test, Map<ObjectQuestion, ObjectAnswer> answerMap) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		ObjectAnswerInfoDaoImpl impl = new ObjectAnswerInfoDaoImpl();
		// long testID=test.getTestID();

		try {
			conn.setAutoCommit(false);
			for (Map.Entry<ObjectQuestion, ObjectAnswer> entry : answerMap.entrySet()) {
				impl.insert(conn, test, entry.getKey(), entry.getValue());
			}
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
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
}
