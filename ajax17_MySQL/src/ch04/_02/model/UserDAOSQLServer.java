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

public class UserDAOSQLServer implements UserDAO {
	private DataSource ds = null;
	public UserDAOSQLServer() throws NamingException, SQLException { 
		Context ctx = new InitialContext();
		ds = (DataSource) ctx.lookup(GlobalService.JNDI_DB_NAME_MS);
	}
	public String checkUserId(String userId) {
		String sql = "SELECT * FROM Customer WHERE custId = ?";
		try (
			Connection connection = ds.getConnection();
			PreparedStatement pstmt = connection.prepareStatement(sql);
		) {
			pstmt.setString(1, userId);
			try (
				ResultSet rs = pstmt.executeQuery();
			) {
				if (rs.next()) {
					String custId 	= rs.getString("custId").trim(); 
					return custId;
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return null;
	}
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
		String sql = "INSERT INTO Customer VALUES(?, ?, ?)";
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
