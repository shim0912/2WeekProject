package com.cal.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cal.dao.CalDao;

import net.sf.json.JSONObject;

@WebServlet("/CalListCountAjax.do")
public class CalListCountAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CalListCountAjax() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/json; charset=UTF-8");

		String id = request.getParameter("id");
		String yyyyMMdd = request.getParameter("yyyyMMdd");
		System.out.println("전달된 param : " + id + ", " + yyyyMMdd);

		CalDao dao = new CalDao();

		int count = dao.getCalViewCount(id, yyyyMMdd);
		System.out.println("일정 갯수 : " + count);

		Map<String, Integer> map = new HashMap<>();
		map.put("calCount", count);
		
		// map를 json객체로 변환
		JSONObject obj = JSONObject.fromObject(map);
		
		// response 준비
		PrintWriter out = response.getWriter();

		// json객체에 구현된 write()메서드가 out(printwriter)을 이용하여
		// 생성된 객체를 브라우저로 출력
		// 우리가 만든 json를 response로 던져주는 메서드
		obj.write(out);

	}

}
