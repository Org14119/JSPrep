package com.system.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.system.dao.ObjectQuestionDAO;
import com.system.entity.ObjectQuestion;
import com.system.entity.QuestionSpace;

public class ObjectQuestionDaoImpl implements ObjectQuestionDAO {

	@Override
	public void insert(Connection conn, ObjectQuestion question, QuestionSpace space) throws SQLException {
		// TODO Auto-generated method stub
		String insertSQL = "INSERT INTO tbl_ObjectQuestion (questionContent,answer1,answer2,answer3,answer4,trueAnswer,analyze,score,questionSpaceID) VALUE(?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(insertSQL);
		ps.setString(1, question.getTitle());
		ps.setString(2, question.getChoiceA());
		ps.setString(3, question.getChoiceB());
		ps.setString(4, question.getChoiceC());
		ps.setString(5, question.getChoiceD());
		ps.setInt(6, question.getCorrectAnswer());
		ps.setString(7, question.getAnswerAnalyze());
		ps.setInt(8, question.getScore());
		ps.setLong(9, space.getId());
		ps.execute();

	}

	@Override
	public void update(Connection conn, ObjectQuestion question) throws SQLException {
		// TODO Auto-generated method stub
		String updateSQL = "UPDATE tbl_ObjectQuestion SET questionContent=?,answer1=?,answer2=?,answer3=?,answer4=?,trueAnswer=?,analyze=?,score=? WHERE questionID=?";
		PreparedStatement ps = conn.prepareStatement(updateSQL);
		ps.setString(1, question.getTitle());
		ps.setString(2, question.getChoiceA());
		ps.setString(3, question.getChoiceB());
		ps.setString(4, question.getChoiceC());
		ps.setString(5, question.getChoiceD());
		ps.setInt(6, question.getCorrectAnswer());
		ps.setString(7, question.getAnswerAnalyze());
		ps.setInt(8, question.getScore());
		ps.setLong(9, question.getId());
		ps.execute();
	}

	@Override
	public void delete(Connection conn, ObjectQuestion question) throws SQLException {
		// TODO Auto-generated method stub
		String deleteSQL = "DELETE * FROM tbl_ObjectQuestion WHERE questionID=?";
		PreparedStatement ps = conn.prepareStatement(deleteSQL);
		ps.setLong(1, question.getId());
		ps.execute();
	}

	@Override
	public ResultSet get(Connection conn, QuestionSpace space) throws SQLException {
		// TODO Auto-generated method stub

		String getSQL = "SELECT tbl_objectquestion.questionContent ,tbl_objectquestion.answer1,tbl_objectquestion.answer2,tbl_objectquestion.answer3,tbl_objectquestion.answer4,tbl_objectquestion.trueAnswer,tbl_objectquestion.analyze,tbl_objectquestion.score FROM tbl_teacherquestionspace,tbl_objectquestion WHERE tbl_teacherquestionspace.id=? AND tbl_objectquestion.questionSpaceID=tbl_teacherquestionspace.id";
		PreparedStatement ps = conn.prepareStatement(getSQL);
		ps.setLong(1, space.getId());
		return ps.executeQuery();
	}

}
