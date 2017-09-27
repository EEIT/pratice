package ch04._07.model;

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



public class PlaceJDBC {
	DataSource ds;
	int placeId;
	int typeId;

	public int getPlaceId() {
		return placeId;
	}
	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public PlaceJDBC() {
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
	public List<PlaceBean> getAllPlacesJSON() throws SQLException {
		List<PlaceBean> list = new ArrayList<>();
		Connection con = ds.getConnection();
		try {
			String sql = "Select * from place";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				int id 		= rs.getInt("placeId");
				int typeId 	= rs.getInt("typeId");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				double longitude = rs.getDouble("longitude");
				double latitude = rs.getDouble("latitude");
				String link = rs.getString("link");
				
				PlaceBean pb = new PlaceBean(id, typeId, name, phone,
						address, longitude, latitude,  link);
				list.add(pb);
			}
		} finally {
			con.close();
		}
		return list;
	}
	public List<PlaceBean> getPlacesByTypeId() throws SQLException {
		List<PlaceBean> list = new ArrayList<>();
		Connection con = ds.getConnection();
		try {
			String sql = "Select * from place where typeId = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, typeId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				//
				int 	id 			= rs.getInt("placeId");
				int 	typeId 		= rs.getInt("typeId");
				String 	name 		= rs.getString("name");
				String 	phone 		= rs.getString("phone");
				String 	address 	= rs.getString("address");
				double 	longitude 	= rs.getDouble("longitude");
				double 	latitude 	= rs.getDouble("latitude");
				String 	link 		= rs.getString("link");
				
				PlaceBean pb = new PlaceBean(id, typeId, name, phone,
						address, longitude, latitude,  link);
				list.add(pb);
			}
		} finally {
			con.close();
		}
		return list;
	}
	public PlaceBean getPlace() throws SQLException {
		Connection con = null;
		PlaceBean pb = null;
		try {
			String sql = "Select * from place where placeId = ?";

			con = ds.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, placeId);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				int id = rs.getInt("placeId");
				int typeId = rs.getInt("typeId");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				double longitude = rs.getDouble("longitude");
				double latitude = rs.getDouble("latitude");
				String link = rs.getString("link");
				pb = new PlaceBean(id, typeId, name, phone,
						address, longitude, latitude,  link);
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return pb;

	}
}
