package com.system.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import com.system.daoImpl.ObjectAnswerInfoDaoImpl;
import com.system.daoImpl.TestDaoImpl;
import com.system.entity.QuestionSpace;
import com.system.entity.Student;
import com.system.entity.Test;
import com.system.util.ConnectionFactory;

public class TestService {
	/*
	 * 创建一场考试或者测试的时候使用，需要传入Test对象，其中包含开始时间，是否是考试等信息 需要传入QuestionSpace对象， 包含其ID属性
	 * 需要传入Student对象，包含其ID属性 返回值为这次考试（测试）分配的ID信息，之后添加为每道题添加答案的时候需要利用该ID
	 * 如果发生异常，则返回-1L
	 */
	public long beginTest(Test test, QuestionSpace spaceWithID, Student studentWithID) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		ResultSet testIdSet = null;
		try {
			conn.setAutoCommit(false);
			testIdSet = new TestDaoImpl().insert(conn, studentWithID, spaceWithID, test);
			conn.commit();
			while (testIdSet.next()) {
				return testIdSet.getLong("max(testID)");
			}
			return -1L;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return -1L;
		} finally {
			try {
				testIdSet.close();
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
	 * 根据测试的ID查找测试的信息 需要传入测试对象，其中至少包含测试的ID 返回对应该ID的唯一测试结果，包含内容为：
	 * 测试时间，是否是考试，这次测试的分数。 如果没有查到相应，返回一个没有内容的Test对象 如果查询过程发生异常，返回null
	 */
	public Test getTestRecord(Test test) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		ResultSet recordSet = null;
		try {
			conn.setAutoCommit(false);

			recordSet = new TestDaoImpl().get(conn, test);
			while (recordSet.next()) {
				Test tempTest = new Test();
				int examflag = recordSet.getInt("isExam");
				switch (examflag) {
				case 1:
					tempTest.setExam(true);
					break;
				case 0:
					tempTest.setExam(false);
					break;
				default:
					return null;
				}
				tempTest.setTestID(recordSet.getLong("testID"));
				tempTest.setTestTime(recordSet.getTimestamp("testTime").toString());
				tempTest.setTestScore(recordSet.getInt("testScore"));
				conn.commit();
				return tempTest;
			}
			return new Test();
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
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				recordSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/*
	 * 根据题库的ID信息查找考试信息 。如果发生异常，返回null
	 */
	public Vector<Test> getTestRecord(QuestionSpace space) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		ResultSet testSet = null;
		try {
			conn.setAutoCommit(false);
			testSet = new TestDaoImpl().get(conn, space);
			Vector<Test> testVector = new Vector<Test>();
			while (testSet.next()) {
				Test tempTest = new Test();
				int examflag = testSet.getInt("isExam");
				switch (examflag) {
				case 1:
					tempTest.setExam(true);
					break;
				case 0:
					tempTest.setExam(false);
					break;
				default:
					return null;
				}
				tempTest.setTestID(testSet.getLong("testID"));
				tempTest.setTestScore(testSet.getInt("testScore"));
				tempTest.setTestTime(testSet.getTimestamp("testTime").toString());
				testVector.add(tempTest);
			}
			conn.commit();
			return testVector;

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
				testSet.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
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
	 * 通过学生的ID查询考试信息，如果发生异常，返回null
	 */
	public Vector<Test> getTestRecord(Student student) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		ResultSet testSet = null;
		try {
			conn.setAutoCommit(false);
			testSet = new TestDaoImpl().get(conn, student);
			Vector<Test> testVector = new Vector<Test>();
			while (testSet.next()) {
				Test tempTest = new Test();
				int examflag = testSet.getInt("isExam");
				switch (examflag) {
				case 1:
					tempTest.setExam(true);
					break;
				case 0:
					tempTest.setExam(false);
					break;
				default:
					return null;
				}
				tempTest.setTestID(testSet.getLong("testID"));
				tempTest.setTestScore(testSet.getInt("testScore"));
				tempTest.setTestTime(testSet.getTimestamp("testTime").toString());
				testVector.add(tempTest);
			}
			conn.commit();
			return testVector;

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
				testSet.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
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
	 * 检查这次考试是否被批改，返回一个Map，Map的Key是题目的总数，Value是被批改的题目的数目。
	 * 如果发生异常，返回null
	 */
	public Map<Integer,Integer> getCheckState(Test test){
		Connection conn= ConnectionFactory.getInstace().makeConnection();
		//ResultSet testSet=null;	
		ResultSet answerSet=null;
		try {
			conn.setAutoCommit(false);
			answerSet=new ObjectAnswerInfoDaoImpl().get(conn, test);
			Map<Integer,Integer>stateMap=new HashMap<Integer ,Integer>();
			int quizamount=0;
			int checkamount=0;
			while(answerSet.next()){
				quizamount++;
				int flag=answerSet.getInt("isChecked");
				if(flag==1){
					checkamount++;
				}
			}
			stateMap.put(quizamount, checkamount);
			conn.commit();
			return stateMap;
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
		}finally{
			
			try {
				answerSet.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
