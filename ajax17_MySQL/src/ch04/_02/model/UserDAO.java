package ch04._02.model;

public interface UserDAO {

	String checkUserId(String userId);

	int saveUser(CustomerBean cb);

}