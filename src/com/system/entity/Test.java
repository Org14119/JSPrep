package com.system.entity;

public class Test {
	private String testTime = "2016-01-01 09:00:00";
	private long testID;
	private boolean isExam = false;
	public boolean isExam() {
		return isExam;
	}

	public void setExam(boolean isExam) {
		this.isExam = isExam;
	}

	public long getTestID() {
		return testID;
	}

	public void setTestID(long testID) {
		this.testID = testID;
	}

	public String getTestTime() {
		return testTime;
	}

	public void setTestTime(String testTime) {
		this.testTime = testTime;
	}

}
