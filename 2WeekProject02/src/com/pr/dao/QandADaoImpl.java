package com.pr.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pr.dto.QADto;

public class QandADaoImpl extends SqlMapConfig implements QandADao {

	@Override
	public List<QADto> selectAll() {
		List<QADto> res = new ArrayList<>();
		SqlSession session = null;

		try {
			System.out.println("02. Mapper와 Connect...");
			session = getSqlSessionFactory().openSession(true);
			res = session.selectList(nameSpace + "selectAll");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("02. Error!!");
		} finally {
			session.close();
			System.out.println("03.DB 연결 종료");
		}

		return res;
	}

	@Override
	public QADto selectOne(int qa_seq) {
		QADto res = new QADto();
		SqlSession session = null;
		
		try {
			System.out.println("02. Mapper와 Connect...");
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(nameSpace + "selectOneQA", qa_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("02. Error!!");
		} finally {
			session.close();
			System.out.println("03.DB 연결 종료");
		}
		
		return res;
	}

	@Override
	public int insert(QADto dto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			System.out.println("02. Mapper와 Connect...");
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(nameSpace + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("02. Error!!");
		} finally {
			session.close();
			System.out.println("03.DB 연결 종료");
		}
		
		return res;
	}

	@Override
	public int delete(int seq) {
		int res=0;
		SqlSession session = null;
		try {
			System.out.println("02. Mapper와 Connect...");
		session = getSqlSessionFactory().openSession(true);
		res=session.delete(nameSpace+"delete",seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("02. Error!!");
		} finally {
			session.close();
			System.out.println("03.DB 연결 종료");
		}
		
		return res;
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
	public QADto search(String writer) {
		QADto res = new QADto();
		SqlSession session = null;
		try {
			System.out.println("02. Mapper와 Connect...");
			session = getSqlSessionFactory().openSession(true);
			res=session.selectOne(nameSpace+"search",writer);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("02. Error!!");
		} finally {
			session.close();
			System.out.println("03.DB 연결 종료");
		}
		
		return res;
	}

}
