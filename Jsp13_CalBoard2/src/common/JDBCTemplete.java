package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplete {

	public static Connection getConnetction() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("01. 드라이버 연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("01. 드라이버 연결 실패");
			e.printStackTrace();
		}

		Connection con = null;

		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "hk";
		String password = "hk";

		try {
			con = DriverManager.getConnection(url, user, password);
			con.setAutoCommit(false);
			System.out.println("02. 계정 연결 성공");
		} catch (SQLException e) {
			System.out.println("02. 계정 연결 실패");
			e.printStackTrace();
		}

		return con;
	}// con

	public static void Close(Connection con, Statement stmt, ResultSet rs) {
		try {
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("Close Error!!");
			e.printStackTrace();
		}
	}

	public static void Close(Connection con, Statement pstmt) {
		try {
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("Close Error!!");
			e.printStackTrace();
		}

	}// close con

	public static void Commit(Connection con) {
		try {
			con.commit();
		} catch (SQLException e) {
			System.out.println("Commit Error");
			e.printStackTrace();
		}
	}

	public static void Rollback(Connection con) {
		try {
			con.rollback();
		} catch (SQLException e) {
			System.out.println("Rollback Error");
			e.printStackTrace();
		}
	}

}
