package ch03._08;

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

/**
 * Servlet implementation class ReadFormDataServlet
 */
@WebServlet("/ch03/_08/register.do")
public class ReadFormDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String pswd = request.getParameter("pswd");
		String userName = request.getParameter("userName");
		String eMail = request.getParameter("eMail");
		String experience = request.getParameter("experience");
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        Map<String, String> map = new HashMap<>(); 
        map.put("userId", userId);
        map.put("pswd", pswd);
        map.put("userName", userName);
        map.put("eMail", eMail);
        map.put("experience", experience);
        String responseData = gson.toJson(map);
        out.print(responseData);
        out.flush();
	}

}
