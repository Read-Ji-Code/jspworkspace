package common;

import java.sql.Connection;
import java.sql.DriverManager;

import jakarta.servlet.ServletContext;

public class JDBConnect {
	private Connection con;
	
	
	public JDBConnect() {
		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/musthave";
			String id = "musthave";
			String pwd = "tiger";
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(기본 생성자)");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		return this.con;
	}

	
	//두번째 생성자
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(인수 생성자 1)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	//세번째 생성자
//	public JDBConnect(ServletContext application) {
//		try {
//			String driver = application.getInitParameter("MySQLDriver");
//			Class.forName(driver);
//			String url = application.getInitParameter("MySQLURL");
//			String id = application.getInitParameter("MySQLID");
//			String pwd = application.getInitParameter("MySQLPwd");
//
//			System.out.println("DB 연결 성공(인수 생성자2)");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}


	public void close() {
		try {
			if (con != null)
				con.close();
			System.out.println("JDBC 자원 해제");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
