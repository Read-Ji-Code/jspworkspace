package membership;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.JDBConnect;

public class MemberDAO2 extends JDBConnect {
	private Connection con;
	public MemberDAO2(String driver, String url, String id, String pwd) {
		super(driver, url, id, pwd);
		con = super.getConnection();
	}
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pass=?";
		PreparedStatement psmt;
		ResultSet rs;
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1,uid);
			psmt.setString(2,upass);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
