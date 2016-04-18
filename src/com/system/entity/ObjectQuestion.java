package com.system.entity;

public class ObjectQuestion {
	private long id;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	private String title;
	private String choiceA;
	private String choiceB;
	private String choiceC;
	private String ChoiceD;
	private int correctAnswer;
	private int score;

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	private String answerAnalyze;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getChoiceA() {
		return choiceA;
	}

	public void setChoiceA(String choiceA) {
		this.choiceA = choiceA;
	}

	public String getChoiceB() {
		return choiceB;
	}

	public void setChoiceB(String choiceB) {
		this.choiceB = choiceB;
	}

	public String getChoiceC() {
		return choiceC;
	}

	public void setChoiceC(String choiceC) {
		this.choiceC = choiceC;
	}

	public String getChoiceD() {
		return ChoiceD;
	}

	public void setChoiceD(String choiceD) {
		ChoiceD = choiceD;
	}

	public int getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(int correctAnswer) {
		this.correctAnswer = correctAnswer;
	}

	public String getAnswerAnalyze() {
		return answerAnalyze;
	}

	public void setAnswerAnalyze(String answerAnalyze) {
		this.answerAnalyze = answerAnalyze;
	}

}
