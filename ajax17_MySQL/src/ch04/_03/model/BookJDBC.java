package ch04._03.model;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import ch00.util.GlobalService;
import ch00.util.SystemUtil;
import ch04._02.model.UserDAOMySQL;
import ch04._02.model.UserDAOSQLServer;

public class BookJDBC {
	DataSource ds;
	int bookId;

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public BookJDBC() {
		try {
			Context context = new InitialContext();
			if (GlobalService.DB_TYPE.equalsIgnoreCase(GlobalService.SQLSERVER)) {
				ds = (DataSource) context.lookup(GlobalService.JNDI_DB_NAME_MS);
			} else if (GlobalService.DB_TYPE.equalsIgnoreCase(GlobalService.MYSQL)) {
				ds = (DataSource) context.lookup(GlobalService.JNDI_DB_NAME);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	public List<BookBean> getAllBooksJSON() throws SQLException {
		List<BookBean> list = new ArrayList<>();
		Connection con = ds.getConnection();
		try {
			String sql = "Select * from eBook";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				//
				int id = rs.getInt("bookID");
				String title = rs.getString("title");
				String author = rs.getString("author");
				double price = rs.getDouble("price");
				double discount = rs.getDouble("discount");
				int companyId = rs.getInt("companyId");
				String filename = rs.getString("filename");
				String bookNo = rs.getString("bookNo");
				//Blob blob = rs.getBlob("CoverImage");
				BookBean bb = new BookBean(id, title, author, price, discount,
						companyId, filename, bookNo, null);
				list.add(bb);
			}
		} finally {
			con.close();
		}
		return list;
	}
	public List<BookBean> getAllBooks() throws SQLException {
		List<BookBean> list = new ArrayList<>();
		Connection con = ds.getConnection();
		try {
			String sql = "Select * from eBook";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				//
				int id = rs.getInt("bookID");
				String title = rs.getString("title");
				String author = rs.getString("author");
				double price = rs.getDouble("price");
				double discount = rs.getDouble("discount");
				int companyId = rs.getInt("companyId");
				String filename = rs.getString("filename");
				String bookNo = rs.getString("bookNo");
				Blob blob = rs.getBlob("CoverImage");
				BookBean bb = new BookBean(id, title, author, price, discount,
						companyId, filename, bookNo, blob);
				list.add(bb);
			}
		} finally {
			con.close();
		}
		return list;

	}

	public BookBean getBook() throws SQLException {
		
		Connection con = null;
		BookBean bb = null;
		try {
			String sql = "Select * from eBook where bookId = ?";

			con = ds.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, bookId);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				int id = rs.getInt("bookID");
				String title = rs.getString("title");
				String author = rs.getString("author");
				double price = rs.getDouble("price");
				double discount = rs.getDouble("discount");
				int companyId = rs.getInt("companyId");
				String filename = rs.getString("filename");
				String bookNo = rs.getString("bookNo");
				Blob blob = rs.getBlob("CoverImage");
				bb = new BookBean(id, title, author, price, discount,
						companyId, filename, bookNo, blob);
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return bb;
	}
	public BookBean getBookTextOnly() throws SQLException {
		Connection con = null;
		BookBean bb = null;
		try {
			String sql = "Select * from eBook where bookId = ?";

			con = ds.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, bookId);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				int id = rs.getInt("bookID");
				String title = rs.getString("title");
				String author = rs.getString("author");
				double price = rs.getDouble("price");
				double discount = rs.getDouble("discount");
				int companyId = rs.getInt("companyId");
				String filename = rs.getString("filename");
				String bookNo = rs.getString("bookNo");
				bb = new BookBean(id, title, author, price, discount,
						companyId, filename, bookNo);
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return bb;

	}
}
