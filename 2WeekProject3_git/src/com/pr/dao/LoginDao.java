package com.pr.dao;

import java.util.List;

import com.pr.dto.UserDto;

public interface LoginDao {

	final String nameSpace = "com.pr.LoginMapper.";

	public UserDto selectLogin(String id, String pw);

	public List<UserDto> selectAllUser();

	public UserDto selectOne(int pr_no);
	
	public int updateRole(int pr_no, String pr_role);
	
	public int insertUser(UserDto dto);
	
	public int userUpdate(UserDto dto);
	
	public int userWithdrawal(int pr_no);

}
