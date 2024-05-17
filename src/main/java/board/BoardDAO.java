package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

public class BoardDAO {
    private Connection conn;
    private ResultSet rs;

    public BoardDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/bbs?useSSL=false";
            Properties jdbcProperties = new Properties();
            jdbcProperties.setProperty("user", "user");
            jdbcProperties.setProperty("password", "12345678");
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, jdbcProperties);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getDate() {
        String SQL = "SELECT NOW()";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public int getNext() {
        String SQL = "SELECT boardID FROM board ORDER BY boardID DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int write(String boardTitle, String userID, String boardContent) {
        String SQL = "INSERT INTO board VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext());
            pstmt.setString(2, boardTitle);
            pstmt.setString(3, userID);
            pstmt.setString(4, getDate());
            pstmt.setString(5, boardContent);
            pstmt.setInt(6, 1);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
