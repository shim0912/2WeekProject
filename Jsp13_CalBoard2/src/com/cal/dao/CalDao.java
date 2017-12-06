package com.cal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cal.dto.CalDto;

import common.JDBCTemplete;

public class CalDao extends JDBCTemplete {

	// 일정 목록 조회
	public List<CalDto> getCalList(String id, String yyyyMMdd) {

		Connection con = getConnetction();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CalDto> res = new ArrayList<>();
		String sql = "SELECT * FROM CALBOARD WHERE ID = ? AND SUBSTR(MDATE,1,8)=? ORDER BY SEQ DESC";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, yyyyMMdd);
			System.out.println("03. SQL구문 준비...");

			rs = pstmt.executeQuery();
			System.out.println("04. SQL 실행 - 결과값 Return...");

			while (rs.next()) {
				CalDto tmp = new CalDto();
				tmp.setSeq(rs.getInt(1));
				tmp.setId(rs.getString(2));
				tmp.setTitle(rs.getString(3));
				tmp.setContent(rs.getString(4));
				tmp.setMdate(rs.getString(5));
				tmp.setRegdate(rs.getDate(6));

				res.add(tmp);
			}

		} catch (SQLException e) {
			Rollback(con);
			e.printStackTrace();
			System.out.println("03/04. Error!!");
		} finally {
			Close(con, pstmt, rs);
			System.out.println("05. DB 연결 종료...");
		}

		return res;
	}

	// 일정 추가
	public int insertCalBoard(CalDto dto) {
		Connection con = getConnetction();
		PreparedStatement pstmt = null;
		int res = 0;

		String sql = "INSERT INTO CALBOARD VALUES(CALBOARDSQ.NEXTVAL, ?, ?, ?, ?, SYSDATE)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getMdate());
			System.out.println("03. SQL구문 준비...");

			res = pstmt.executeUpdate();
			System.out.println("04. SQL 실행 - 결과값 Return...");

			if (res > 0) {
				Commit(con);
			}

		} catch (SQLException e) {
			Rollback(con);
			e.printStackTrace();
			System.out.println("03/04. Error!!");
		} finally {
			Close(con, pstmt);
			System.out.println("05. DB 연결 종료...");
		}

		return res;
	}

	public CalDto selectCalBoard(int seq) {
		Connection con = getConnetction();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM CALBOARD WHERE SEQ = ?";
		CalDto res = new CalDto();

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			System.out.println("03. SQL구문 준비...");

			rs = pstmt.executeQuery();
			System.out.println("04. SQL 실행 - 결과값 Return...");

			while (rs.next()) {
				res.setSeq(rs.getInt(1));
				res.setId(rs.getString(2));
				res.setTitle(rs.getString(3));
				res.setContent(rs.getString(4));
				res.setMdate(rs.getString(5));
				res.setRegdate(rs.getDate(6));

			}

			if (res.getSeq() > 0) {
				Commit(con);
			}

		} catch (SQLException e) {
			Rollback(con);
			e.printStackTrace();
			System.out.println("03/04. Error!!");
		} finally {
			Close(con, pstmt);
			System.out.println("05. DB 연결 종료...");
		}

		return res;
	}

	public int getCalViewCount(String id, String yyyyMMdd) {

		Connection con = getConnetction();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int count = 0;

		String sql = "SELECT COUNT(*) FROM CALBOARD WHERE ID = ? AND SUBSTR(MDATE, 1, 8) = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, yyyyMMdd);
			System.out.println("03. SQL구문 준비...");

			rs = pstmt.executeQuery();
			System.out.println("04. SQL 실행 - 결과값 Return...");

			while (rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println("dao의 일정 갯수 : " + count);

		} catch (SQLException e) {
			Rollback(con);
			e.printStackTrace();
			System.out.println("03/04. Error!!");
		} finally {
			Close(con, pstmt);
			System.out.println("05. DB 연결 종료...");
		}

		return count;
	}

	// 달력에 일정 표현
	public List<CalDto> getCalViewList(String id, String yyyyMM) {

		Connection con = getConnetction();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<CalDto> res = new ArrayList<>();

		String sql = "SELECT SEQ, ID, TITLE, CONTENT, MDATE, REGDATE FROM (SELECT (ROW_NUMBER() OVER(PARTITION BY SUBSTR(MDATE,1,8) ORDER BY MDATE)) RN, SEQ, ID, TITLE, CONTENT, MDATE, REGDATE FROM CALBOARD WHERE ID = ? AND SUBSTR(MDATE,1,6) = ?) WHERE RN BETWEEN 1 AND 3";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, yyyyMM);
			System.out.println("03. SQL구문 준비...");

			rs = pstmt.executeQuery();
			System.out.println("04. SQL 실행 - 결과값 Return...");

			while (rs.next()) {
				CalDto tmp = new CalDto();
				tmp.setSeq(rs.getInt(1));
				tmp.setId(rs.getString(2));
				tmp.setTitle(rs.getString(3));
				tmp.setContent(rs.getString(4));
				tmp.setMdate(rs.getString(5));
				tmp.setRegdate(rs.getDate(6));

				res.add(tmp);
			}

		} catch (SQLException e) {
			Rollback(con);
			e.printStackTrace();
			System.out.println("03/04. Error!!");
		} finally {
			Close(con, pstmt);
			System.out.println("05. DB 연결 종료...");
		}

		return res;
	}

}
