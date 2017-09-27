package ch04._02.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import ch00.util.GlobalService;

public class UserDAOMySQL implements UserDAO {
	private DataSource ds = null;
	public UserDAOMySQL() throws NamingException, SQLException { 
		Context ctx = new InitialContext();
		ds = (DataSource) ctx.lookup(GlobalService.JNDI_DB_NAME);
	}
	/* (non-Javadoc)
	 * @see ch04._02.model.UserDAO#checkUserId(java.lang.String)
	 */
	@Override
	public String checkUserId(String userId) {
		String sql = "SELECT * FROM Customer WHERE custId = ?";
		String custId = ""; 
		try (
			Connection connection = ds.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(sql);
		) {
			pstmt.setString(1, userId);
			try (
				ResultSet rs = pstmt.executeQuery();
			) {
				if (rs.next()) {
					custId 	= rs.getString("custId").trim(); 
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			custId = "Error: 資料庫異常，請檢查資料庫";
		}
		return custId;
	}
	/* (non-Javadoc)
	 * @see ch04._02.model.UserDAO#saveUser(ch04._02.model.CustomerBean)
	 */
	@Override
	public int saveUser(CustomerBean cb) {
		String sql0 = "SELECT * FROM Customer where custId = ?";
		try (
				Connection connection = ds.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql0);
			) {
				pstmt.setString(1, cb.getCustId());
				ResultSet rs = pstmt.executeQuery();
				if (rs.next()){  // custId 已經存在
					return -1;
				}
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
				return -2;
			}
		String sql = "INSERT INTO Customer VALUES(null, ?, ?, ?)";
		int n = 0 ;
		try (
			Connection connection = ds.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(sql);
		) {
			pstmt.setString(1, cb.getCustId());
			pstmt.setString(2, cb.getPassword());
			pstmt.setString(3, cb.getEmail());
			n = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return n;
	}
}
