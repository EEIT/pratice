package ch01._01;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ch01/_01/SimpleServletAjax")
public class SimpleServletAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		try (
			PrintWriter out = response.getWriter();
		) {
			out.print("這是doGet()方法送出的訊息. (由Servlet送出回應)");
			return;                                   
		} catch (UnsupportedEncodingException e) {
			throw new ServletException(e);
		}
	}
}
