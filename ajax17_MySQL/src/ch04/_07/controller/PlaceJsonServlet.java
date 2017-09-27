package ch04._07.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ch04._07.model.PlaceBean;
import ch04._07.model.PlaceJDBC;

@WebServlet("/ch04/_07/getPlaceData.json")
                  
public class PlaceJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PlaceJsonServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("application/json; charset=utf-8");
	   
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		String sid = request.getParameter("id");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		System.out.println("name=" + name);
		System.out.println("address=" + address);
		int id = 0 ;
		try {
			id = Integer.parseInt(sid);
		}catch(Exception e){
			id = 0;
		}
		try {
			PlaceJDBC jdbc = new PlaceJDBC();
			jdbc.setTypeId(id);
			List<PlaceBean> list = jdbc.getPlacesByTypeId();
			String categoriesJson = new Gson().toJson(list); 
			System.out.println("----------------");
            System.out.println(categoriesJson);
            System.out.println("----------------");
            out.write(categoriesJson);
		} catch (SQLException e) {
			throw new ServletException("DB error", e);
		} finally {
			out.close();
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

}
