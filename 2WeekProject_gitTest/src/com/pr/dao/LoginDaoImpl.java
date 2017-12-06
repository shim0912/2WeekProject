package com.pr.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pr.dto.UserDto;

public class LoginDaoImpl extends SqlMapConfig implements LoginDao {

	@Override
	public UserDto selectLogin(String pr_id, String pr_pw) {
		SqlSession session = null;
		UserDto res = new UserDto();

		res.setPr_id(pr_id);
		res.setPr_pw(pr_pw);

		try {
			System.out.println("02. Mapper와 Connect...");
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(nameSpace + "login", res);
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
	public List<UserDto> selectAllUser() {
		List<UserDto> res = new ArrayList<>();
		SqlSession session = null;

		try {
			System.out.println("02. Mapper와 Connect...");
			session = getSqlSessionFactory().openSession(true);
			res = session.selectList(nameSpace + "selectAllUser");
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
	public UserDto selectOne(int pr_no) {
		UserDto res = new UserDto();
		SqlSession session = null;

		try {
			System.out.println("02. Mapper와 Connect...");
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(nameSpace + "selectOneUser", pr_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("02. Error!!");
		} finally {
			session.close();
			System.out.println("03.DB 연결 종료");
		}

		return res;
	}

	public UserDto selectOne(String pr_id) {
		UserDto res = new UserDto();
		SqlSession session = null;

		try {
			System.out.println("02. Mapper와 Connect...");
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(nameSpace + "selectOneId", pr_id);
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
	public int updateRole(int pr_no, String pr_role) {

		return 0;
	}

	@Override
	public int insertUser(UserDto dto) {
		int res = 0;
		SqlSession session = null;

		try {
			System.out.println("02. Mapper와 Connect...");
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(nameSpace + "join", dto);
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
	public int userUpdate(UserDto dto) {

		return 0;
	}

	@Override
	public int userWithdrawal(int pr_no) {

		return 0;
	}

	public UserDto selectUserNo(String pr_id) {
		UserDto res = new UserDto();
		SqlSession session = null;

		try {
			System.out.println("02. Mapper와 Connect...");
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(nameSpace + "selectUserNo", pr_id);
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
