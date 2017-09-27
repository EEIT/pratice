package ch04._03.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ch04._03.model.BookBean;
import ch04._03.model.BookJDBC;
/*
1. 呼叫DAO類別(BookJDBC.java)來取得單筆書籍資料
2. 將前端程式送來的書籍記錄的主鍵值，經由DAO類別(BookJDBC.java)的setBookId(bookId);方法傳入DAO內
3. 呼叫DAO類別的getBookTextOnly()讀取由主鍵值指定的一筆書籍資料。由於書籍表格含有BLOB欄位，無法轉為JSON格式，
        所以getBookTextOnly()讀取非BLOB欄位的資料
4. 呼叫Gson的toJson()方法，將單一書籍資料轉換為JSON格式的物件
5. 要寫出JSON格式的資料必須撰寫下列兩行敘述:
	    response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();

*/
@WebServlet("/ch04/_03/singlebook.json")

public class SingleBookJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SingleBookJsonServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int bookId = 0;
		bookId = Integer.parseInt(request.getParameter("bookId").trim());
	    response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		try {
			BookJDBC jdbc = new BookJDBC();
			jdbc.setBookId(bookId);
			BookBean bb = jdbc.getBookTextOnly();
//			Map<String, Object> map = new HashMap<>();
//			map.put("bookId", bb.getBookId());
//			map.put("title", bb.getTitle());
//			map.put("author", bb.getAuthor());
//			map.put("price", bb.getPrice());
//			map.put("bookNo", bb.getBookNo());
			
			String singleBookJson = new Gson().toJson(bb); 
			
            out.write(singleBookJson);
		} catch (SQLException e) {
			throw new ServletException("DB error", e);
		} finally {
			out.close();
		}
	}
}
