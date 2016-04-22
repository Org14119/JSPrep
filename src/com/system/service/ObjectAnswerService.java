package com.system.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.Vector;

import com.system.daoImpl.ObjectAnswerInfoDaoImpl;
import com.system.entity.ObjectAnswer;
import com.system.entity.ObjectQuestion;
import com.system.entity.Test;
import com.system.util.ConnectionFactory;

public class ObjectAnswerService {
	/*
	 * 
	 * 通过Test的ID获取answer内容 传入Test对象，其中至少包含ID
	 * 返回Vector<ObjectAnswer>,包含answer对象的ID，如果还要查看解析，需要调用其它方法; 如果发生异常，返回null
	 * 
	 */
	public Vector<ObjectAnswer> getObjectAnswer(Test test) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		ResultSet questionSet = null;
		Vector<ObjectAnswer> questionV = new Vector<ObjectAnswer>();
		try {
			conn.setAutoCommit(false);
			questionSet = new ObjectAnswerInfoDaoImpl().get(conn, test);
			while (questionSet.next()) {
				ObjectAnswer answer = new ObjectAnswer();
				answer.setAnswerInfoID(questionSet.getLong("answerInfoID"));
				answer.setAnswerContent(questionSet.getInt("studentAnswer"));
				answer.setAnswerScore(questionSet.getInt("answerScore"));
				answer.setChecked(false);
				int tempState = questionSet.getInt("isChecked");
				if (tempState == 1) {
					answer.setChecked(true);
				}
				answer.setAnswerTime(questionSet.getTimestamp("answerTime").toString());
				questionV.add(answer);
			}
			conn.commit();
			return questionV;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return null;
		} finally {
			try {
				questionSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

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
