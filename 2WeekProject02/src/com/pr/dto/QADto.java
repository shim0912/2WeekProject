package com.pr.dto;

import java.util.Date;

public class QADto {
	private int qa_seq;
	private String qa_writer;
	private String qa_title;
	private String qa_content;
	private Date qa_regdate;
	private int qa_no;
	private String qa_enabled;

	public QADto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QADto(int qa_seq, String qa_writer, String qa_title, String qa_content, Date qa_regdate, int qa_no,
			String qa_enabled) {
		super();
		this.qa_seq = qa_seq;
		this.qa_writer = qa_writer;
		this.qa_title = qa_title;
		this.qa_content = qa_content;
		this.qa_regdate = qa_regdate;
		this.qa_no = qa_no;
		this.qa_enabled = qa_enabled;
	}

	public int getQa_seq() {
		return qa_seq;
	}

	public void setQa_seq(int qa_seq) {
		this.qa_seq = qa_seq;
	}

	public String getQa_writer() {
		return qa_writer;
	}

	public void setQa_writer(String qa_writer) {
		this.qa_writer = qa_writer;
	}

	public String getQa_title() {
		return qa_title;
	}

	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public Date getQa_regdate() {
		return qa_regdate;
	}

	public void setQa_regdate(Date qa_regdate) {
		this.qa_regdate = qa_regdate;
	}

	public int getQa_no() {
		return qa_no;
	}

	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}

	public String getQa_enabled() {
		return qa_enabled;
	}

	public void setQa_enabled(String qa_enabled) {
		this.qa_enabled = qa_enabled;
	}

	@Override
	public String toString() {
		return "QADto [qa_seq=" + qa_seq + ", qa_writer=" + qa_writer + ", qa_title=" + qa_title + ", qa_content="
				+ qa_content + ", qa_regdate=" + qa_regdate + ", qa_no=" + qa_no + "]";
	}

}
