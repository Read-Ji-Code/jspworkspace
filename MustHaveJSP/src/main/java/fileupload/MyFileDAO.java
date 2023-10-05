package fileupload;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import common.JDBConnect;

public class MyFileDAO extends JDBConnect {
	public int insertFile(MyFileDTO dto) {
		int applyResult = 0;
		PreparedStatement psmt = null;
		try {
			String query = "INSERT INTO myfile (" + " idx, title, cate, ofile, sfile)" + " values ("
					+ " seq_board_num.nextval, ?, ?, ?, ?, ?)";

			psmt = getConnection().prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getCate());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());

			applyResult = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("INSERT 중 예외 발생");
			e.printStackTrace();
		} finally {
			if (psmt != null)
				try {
					psmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return applyResult;
	}

	public List<MyFileDTO> myFileList() {
		Statement stmt = null;
		List<MyFileDTO> fileList = new Vector<>();
		String query = "select from myfile order by desc";
		try {
			stmt = getConnection().createStatement();
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
				MyFileDTO dto = new MyFileDTO();
				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setCate(rs.getString(3));
				dto.setOfile(rs.getString(4));
				dto.setSfile(rs.getString(5));
				dto.setPostdate(rs.getString(6));

				fileList.add(dto);
			}
		} catch (Exception e) {
			System.out.println("select 시 예외 발생");
			e.printStackTrace();
		}
		return fileList;
	}
}
