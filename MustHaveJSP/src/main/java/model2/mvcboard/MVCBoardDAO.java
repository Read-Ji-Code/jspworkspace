package model2.mvcboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;

public class MVCBoardDAO extends JDBConnect {
	JDBConnect jdbc = new JDBConnect();
	private Connection con = jdbc.getConnection();
	Statement stmt;
	ResultSet rs;
	PreparedStatement psmt = null;

	public MVCBoardDAO() {
		super();
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM mvcboard";

		if (map.get("searchWord") != null) {
			query += "where" + map.get("searchField") + " " + " like '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}

	public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {

		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();

		String query = "select * from mvcboard";

		if (map.get("searchWord") != null) {
				query += "where" + map.get("searchField") + " " + " like '%" + map.get("searchWord") + "%'";
			}

			query += " order by idx desc limit ?,?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, (int)map.get("start"));
			psmt.setInt(2, (int)map.get("pageSize"));
			rs = psmt.executeQuery();

			while (rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setPass(rs.getString("pass"));
				dto.setVisitcount(rs.getInt("visitcount"));

				board.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}
	
	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;
		try {
			String query = "insert into mvcboard ( "
						+ " idx, name, title, content, ofile, sfile, pass)"
						+ " values ("
						+ " seq_board_num.nextval,?,?,?,?,?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6,dto.getPass());
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	public MVCBoardDTO selectView(String idx) {
		MVCBoardDTO dto = new MVCBoardDTO();
		String query = "select * from mvcboard where idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setPass(rs.getString("pass"));
				dto.setVisitcount(rs.getInt("visitcount"));
			}
		}catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	public void updateVisitCount(String idx) {
		String query = "update mvcboard set visitcount=visitcount+1 where idx=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
			
		}catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	public class MVCBoardDAO extends DBConnPool {
		public void downCountPlus(String idx) {
			String sql = "update mbcboard set" + "downcount=downcount+1" + "where idx=? ";
			try {
				psmt = con.preparedStatement(sql);
				psmt.setString(1,idx);
				psmt.executeUpdate();
				
			} catch (Exception e) {}
		}
	}
}