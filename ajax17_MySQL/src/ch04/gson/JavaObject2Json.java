package ch04.gson;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

public class JavaObject2Json {
	public static void main(String[] args) {
		Gson gson = new Gson();
		// Java物件
		Book b1 = new Book("9951218273677", "Java大全", 640);
		Book b2 = new Book("5968977412220", "JSP入門與進階", 540);
		Book b3 = new Book("9951218273677", "快樂學Ajax", 500);
		System.out.println(gson.toJson(b1));
		// 少量資料
		Map<String, String> map = new HashMap<>();
		map.put("code", "snoopy");
		map.put("no", "25800");
		System.out.println(gson.toJson(map));
		// Java陣列
        Book[] books = {b1, b2, b3};
        System.out.println(gson.toJson(books));
		// Collection
        List<Book> list = Arrays.asList(b1, b2, b3);
        System.out.println(gson.toJson(list));
	}

}
