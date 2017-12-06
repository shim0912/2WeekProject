package com.cal.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.cal.dao.CalDao;
import com.cal.dao.Util;
import com.cal.dto.CalDto;

@WebServlet("/CalController.do")
public class calendarConroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public calendarConroller() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		CalDao dao = new CalDao();

		if (command.equals("calendar")) {
			response.sendRedirect("calendar.jsp");

		} else if (command.equals("calList")) {
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String date = request.getParameter("date");

			String yyyyMMdd = year + Util.isTwo(month) + Util.isTwo(date);

			HttpSession session = request.getSession();
			session.setAttribute("ymd", yyyyMMdd);

			List<CalDto> list = dao.getCalList("hk", yyyyMMdd);
			request.setAttribute("list", list);
			dispatch("calList.jsp", request, response);

		} else if (command.equals("insertCal")) {
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String date = request.getParameter("date");
			String hour = request.getParameter("hour");
			String min = request.getParameter("min");

			String mdate = year + Util.isTwo(month) + Util.isTwo(date) + Util.isTwo(hour) + Util.isTwo(min);

			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			int res = dao.insertCalBoard(new CalDto(0, id, title, content, mdate, null));

			if (res > 0) {
				response.sendRedirect("CalController.do?command=calendar");
			} else {
				request.setAttribute("msg", "일정 추가 실패");
				dispatch("error.jsp", request, response);
			}

		} else if (command.equals("calDetail")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			CalDto res = new CalDto();

			res = dao.selectCalBoard(seq);

			if (res.getSeq() > 0) {
				request.setAttribute("dto", res);
				dispatch("calDetail.jsp", request, response);
			} else {
				request.setAttribute("msg", "일정 상세 보기 실패");
				dispatch("error.jsp", request, response);
			}

		} else if (command.equals("")) {

		} else if (command.equals("")) {

		} else if (command.equals("")) {

		} else if (command.equals("")) {

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
