package com.pr.biz;

import java.util.List;

import com.pr.dao.LoginDaoImpl;
import com.pr.dto.UserDto;

public class LoginBizImpl implements LoginBiz {
	LoginDaoImpl loginDao = new LoginDaoImpl();

	@Override
	public UserDto selectLogin(String id, String pw) {
		String lowerPw = pw.toLowerCase();

		return loginDao.selectLogin(id, lowerPw);
	}

	@Override
	public List<UserDto> selectAllUser() {

		return loginDao.selectAllUser();
	}

	@Override
	public UserDto selectOne(int pr_no) {

		return loginDao.selectOne(pr_no);
	}

	public UserDto selectOne(String pr_id) {

		return loginDao.selectOne(pr_id);
	}

	@Override
	public int updateRole(int pr_no, String pr_role) {
		return 0;
	}

	@Override
	public int insertUser(UserDto dto) {
		
		return loginDao.insertUser(dto);
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
		
		return loginDao.selectUserNo(pr_id);
	}

}
