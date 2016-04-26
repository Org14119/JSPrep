package com.system.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.system.daoImpl.StudentDaoImpl;
import com.system.daoImpl.TestDaoImpl;
import com.system.entity.QuestionSpace;
import com.system.entity.Student;
import com.system.entity.Test;
import com.system.util.ConnectionFactory;

public class ScoreAnalyzeService {
	/*
	 * 传入Test对象，其中包括testID属性，最好调用的时候确定这个考生的试题已经被批改
	 * 传回对应这个Test的题库的所有考试学生的分数的列表(已经排序) 如果没有被批改的Test，则返回一个不含有任何元素的List
	 * 如果发生异常，则返回null
	 */
	public List<Integer> getRangeList(Test test) {
		List<Integer> tempL = new ArrayList<Integer>();
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		TestDaoImpl Timpl = new TestDaoImpl();
		ResultSet testSet = null;
		ResultSet allSet = null;
		// long studentID;
		long spaceId = 0;
		try {
			conn.setAutoCommit(false);
			testSet = Timpl.get(conn, test);
			while (testSet.next()) {
				spaceId = testSet.getLong("questionSpaceID");
			}
			QuestionSpace tempSpace = new QuestionSpace();
			tempSpace.setId(spaceId);
			allSet = Timpl.getScores(conn, tempSpace);
			while (allSet.next()) {
				int score = allSet.getInt("testScore");
				tempL.add(score);
			}
			Collections.sort(tempL);

			conn.commit();
			return tempL;
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
				allSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				testSet.close();
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
	 * 传入QuestionSpace对象，其中至少包括id属性。 返回对value排序完成的map 其中key为Student，value为分数
	 * 如果发生异常，返回null
	 */
	public Map<Student, Integer> getRangeMap(QuestionSpace space) {
		Map<Student, Integer> map = new HashMap<Student, Integer>();
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		TestDaoImpl testImpl = new TestDaoImpl();
		StudentDaoImpl studentImpl = new StudentDaoImpl();
		ResultSet scoreSet = null;
		ResultSet studentSet = null;
		try {
			conn.setAutoCommit(false);
			scoreSet = testImpl.getScores(conn, space);
			Student tempS = new Student();
			while (scoreSet.next()) {
				int testScore = scoreSet.getInt("testScore");
				long studentID = scoreSet.getLong("studentID");
				tempS.setId(studentID);
				studentSet = studentImpl.getByID(conn, tempS);
				while (studentSet.next()) {
					Student trueS = new Student();
					trueS.setId(studentSet.getLong("studentID"));
					trueS.setEmail(studentSet.getString("studentEmail"));
					trueS.setName(studentSet.getString("studentName"));
					trueS.setGender(String.valueOf(studentSet.getInt("studentGender")));
					map.put(trueS, testScore);
				}
			}
			conn.commit();
			return sortMapByValue(map);
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
				studentSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				scoreSet.close();
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
	 * 同上，传入参数为考试
	 */
	public Map<Student, Integer> getRangeMap(Test test) {
		Connection conn = ConnectionFactory.getInstace().makeConnection();
		TestDaoImpl testImpl = new TestDaoImpl();
		ResultSet testSet = null;
		try {
			conn.setAutoCommit(false);
			testSet = testImpl.get(conn, test);
			// long spaceId=0L;
			QuestionSpace space = new QuestionSpace();
			while (testSet.next()) {
				space.setId(testSet.getLong("questionSpaceID"));
			}
			conn.commit();
			return getRangeMap(space);

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
	 * 以下方法私有，排序算法，使用链式散列表
	 */
	private static Map<Student, Integer> sortMapByValue(Map<Student, Integer> orimap) {

		if (orimap == null || orimap.isEmpty()) {
			return null;
		}
		Map<Student, Integer> sortedMap = new LinkedHashMap<Student, Integer>();
		List<Map.Entry<Student, Integer>> entryList = new ArrayList<Map.Entry<Student, Integer>>(orimap.entrySet());
		Collections.sort(entryList, new MapValueComparator());
		Iterator<Map.Entry<Student, Integer>> iter = entryList.iterator();
		Map.Entry<Student, Integer> tmpEntry = null;
		while (iter.hasNext()) {
			tmpEntry = iter.next();
			sortedMap.put(tmpEntry.getKey(), tmpEntry.getValue());
		}
		return sortedMap;

	}

}

class MapValueComparator implements Comparator<Map.Entry<Student, Integer>> {

	@Override
	public int compare(Entry<Student, Integer> me1, Entry<Student, Integer> me2) {

		return me2.getValue().compareTo(me1.getValue());
	}
}