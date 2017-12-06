package com.pr.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {

	private SqlSessionFactory sqlSessionFactory;
	
	public SqlSessionFactory getSqlSessionFactory() {
		
		String resource = "com/pr/db/Config.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			System.out.println("01. getSqlSessionFactory Seccess!!!");
		} catch (IOException e) {
			System.out.println("01. getSqlSessionFactory Error!");
			e.printStackTrace();
		}
		
		return sqlSessionFactory;
	}
}
