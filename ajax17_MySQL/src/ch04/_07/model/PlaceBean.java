package ch04._07.model;

import java.io.Serializable;
import java.sql.Blob;
// 本類別封裝單筆書籍資料
public class PlaceBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int     placeId ;
	private int     typeId;
	private String  name;
	private String  phone   ;
	private String  address		;
	private double  longitude	;
	private double  latitude	;
	private String  link;
	
	public PlaceBean() {
	}

	public PlaceBean(int placeId, int typeId, String name, String phone,
			String address, double longitude, double latitude, String link) {
		super();
		this.placeId = placeId;
		this.typeId = typeId;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.longitude = longitude;
		this.latitude = latitude;
		this.link = link;
	}

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	
}



