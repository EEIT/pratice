package ch04.gson;

import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class Json2JavaObject {
	public static void main(String[] args) {
		Gson gson = new Gson();
		String s = "{\"isbn\":\"9951218273677\",\"name\":\"Java大全\",\"price\":640}"; 
		// Java物件
		Book b1 = gson.fromJson(s, Book.class);
		System.out.println(b1);
		
		// Collection
		s = "[{\"isbn\":\"9951218273677\",\"name\":\"Java大全\",\"price\":640},{\"isbn\":\"5968977412220\",\"name\":\"JSP入門與進階\",\"price\":540},{\"isbn\":\"9951218273677\",\"name\":\"快樂學Ajax\",\"price\":500}]"; 
		List<Book> list = gson.fromJson(s, new TypeToken<List<Book>>(){}.getType());
		System.out.println(list);
	}
}
