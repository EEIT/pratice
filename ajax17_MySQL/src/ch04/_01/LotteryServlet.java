package ch04._01;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/ch04/_01/LotteryServlet")
public class LotteryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
	          request.setCharacterEncoding("UTF-8");       // 說明傳送到本程式之資料的內碼
	          String name = request.getParameter("visitor");//讀取瀏覽器送來的資料("visitor")
	          if (name == null || name.trim().length() == 0 ) {
	             name = "訪客";   // 如果讀不到使用者輸入的資料，將變數name設為“訪客”; 
	          }
	          LotteryBean lottery = new LotteryBean();     // LotteryBean負責程式的邏輯運算
	          lottery.setLowerBound(1);                    // 設定LotteryBean所需的必要參數
	          lottery.setUpperBound(49);
	          lottery.setBallNumber(6);
	          Collection<Integer> coll = lottery.getLuckyNumbers(); // 請LotteryBean產生所需的結果
	          response.setContentType("application/json; charset=UTF-8");
	          PrintWriter out = response.getWriter();
	          Map<String, String> map = new HashMap<>();
	          map.put("name", name);
	          map.put("number", coll.toString());
	          Gson gson = new Gson();
	          out.println(gson.toJson(map));
	          out.flush();
	          return ;                                     // forward()之後會有一個return敘述
	       } catch(UnsupportedEncodingException e) {
	          throw new ServletException(e); 
	       }
	}
}