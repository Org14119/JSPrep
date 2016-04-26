package com.system.entity;

import java.io.Serializable;

public class Announce implements Serializable {
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 8504742495971459160L;
	private long id;
	private String title;
	private String content;
	private String time;

}
