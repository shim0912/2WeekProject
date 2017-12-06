package com.pr.dao;

import java.util.List;

import com.pr.dto.QADto;

public interface QandADao {
	
	final String nameSpace = "com.pr.QAmapper.";
	
	public List<QADto> selectAll();

	public QADto selectOne(int qa_seq);

	public int insert(QADto dto);

	public int delete(int seq);

	public int mulDelete();

	public int update(int seq);

}
