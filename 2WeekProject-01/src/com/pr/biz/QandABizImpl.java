package com.pr.biz;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import com.pr.dao.QandADaoImpl;
import com.pr.dto.QADto;

public class QandABizImpl implements QandABiz {

	QandADaoImpl qandaDao = new QandADaoImpl();

	@Override
	public List<QADto> selectAll() {

		return qandaDao.selectAll();
	}

	@Override
	public QADto selectOne(int qa_seq) {
		
		return qandaDao.selectOne(qa_seq);
	}

	@Override
	public int insert(QADto dto) {

		return qandaDao.insert(dto);
	}

	@Override
	public int delete(int seq) {
		
		return qandaDao.delete(seq);
	}

	@Override
	public int mulDelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(int seq) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	private String toDates;
	
	public String getToDates() {
		return toDates;
	}
	
	public void setToDates(String mdate) {
		// yyyy-MM-dd hh:mm:00
		String m = mdate.substring(0, 4) + "-" + mdate.substring(4, 6) + "-" + mdate.substring(6, 8) + " "
				+ mdate.substring(8, 10) + ":" + mdate.substring(10) + ":00";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분");
		Timestamp tm = Timestamp.valueOf(m);
		toDates = sdf.format(tm);
	}

	// 한자리 수(9 , 2, ...)를 두자리 수(09, 02, ...)로 변환
	public static String isTwo(String msg) {
		return msg.length() < 2 ? "0" + msg : msg;
	}
	@Override
	public QADto search(String writer) {
		
		return qandaDao.search(writer);	
	}
	
	

}
