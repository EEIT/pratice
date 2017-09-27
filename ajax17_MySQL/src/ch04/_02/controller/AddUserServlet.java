package ch04._02.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ch00.util.GlobalService;
import ch00.util.SystemUtil;
import ch04._02.model.CustomerBean;
import ch04._02.model.UserDAO;
import ch04._02.model.UserDAOMySQL;
import ch04._02.model.UserDAOSQLServer;
import jdk.nashorn.internal.runtime.GlobalConstants;

@WebServlet("/ch04/_02/AddUser.do")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		// 1. 讀取使用者輸入資料
		String userId = request.getParameter("userId");
		String pswd = request.getParameter("pswd");
		String email = request.getParameter("email");
		// 2. 進行必要的型態轉換，本程式不需要
		Map<String, String> errorMsg = new HashMap<>();
		request.setAttribute("errorMsg", errorMsg);
		// 3. 檢查輸入資料
		if (userId == null || userId.trim().length() == 0) {
			errorMsg.put("userIdError", "請輸入帳號");
		}
		if (pswd == null || pswd.trim().length() == 0) {
			errorMsg.put("pswdError", "請輸入密碼");
		}
		if (email == null || email.trim().length() == 0) {
			errorMsg.put("emailError", "請輸入eMail");
		}
		// 3-1. 如果輸入資料有錯誤，送回前端，請使用者修正
		if (!errorMsg.isEmpty()) {
			out.println(gson.toJson(errorMsg));
			out.close();
			return;
		}
		// 4. 進行企業邏輯運算
		CustomerBean cb = new CustomerBean(userId, pswd, email);
		UserDAO dao = null;
		try {
			if (GlobalService.DB_TYPE.equalsIgnoreCase(GlobalService.SQLSERVER)) {
				dao = new UserDAOSQLServer();
			} else if (GlobalService.DB_TYPE.equalsIgnoreCase(GlobalService.MYSQL)) {
				dao = new UserDAOMySQL();
			}
			int n = dao.saveUser(cb);
			if (n == -1) {
				Map<String, String> map = new HashMap<>();
				map.put("fail", "帳號已經存在，請更換帳號");
				out.println(gson.toJson(map));
				out.close();
				return;
			} else if (n == -2) {
				Map<String, String> map = new HashMap<>();
				map.put("fail", "資料庫異常，請檢查資料庫");
				out.println(gson.toJson(map));
				out.close();
				return;
			}
		} catch (Exception ex) {
			errorMsg.put("fail", ex.getMessage());
			out.println(gson.toJson(errorMsg));
			out.close();
			return;
		}
		// 5. 依照企業邏輯運算的結果送回適當的訊息
		Map<String, String> map = new HashMap<>();
		map.put("success", "新增成功");
		out.println(gson.toJson(map));
		out.close();
		return;
	}
}
