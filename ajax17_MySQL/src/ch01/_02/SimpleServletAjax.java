package ch01._02;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch01/_02/SimpleServletAjax")
public class SimpleServletAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Thread.sleep(	5000);
		} catch(InterruptedException e){
			e.printStackTrace();
		}
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		try (
			PrintWriter out = response.getWriter();
		) {
			out.print("這是doGet()方法送出的訊息. (由Servlet送出回應 ，同步請求的缺點)");
			return;                                   
		} catch (UnsupportedEncodingException e) {
			throw new ServletException(e);
		}
	}
}
