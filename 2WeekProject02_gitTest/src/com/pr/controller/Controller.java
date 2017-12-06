package com.pr.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pr.biz.LoginBizImpl;
import com.pr.biz.QandABizImpl;
import com.pr.dto.QADto;
import com.pr.dto.UserDto;

@WebServlet("/xe.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controller() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession webSession = request.getSession();
		String command = request.getParameter("command");
		QandABizImpl qaBiz = new QandABizImpl();
		LoginBizImpl loginBiz = new LoginBizImpl();

		if (command.equals("QandAList")) {
			List<QADto> qaList = qaBiz.selectAll();
			System.out.println("가져온 값 : " + qaList);

			request.setAttribute("qaList", qaList);
			dispatch("QandAList.jsp", request, response);

		} else if (command.equals("QandAwrite")) {
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			int qr_no = loginBiz.selectUserNo(writer).getPr_no();
			QADto dto = new QADto(0, writer, title, content, null, qr_no, null);
			int res = qaBiz.insert(dto);
			if(res > 0) {
				jsResponse("글을 추가 하였습니다.", "xe.do?command=QandAList", response);
			} else {
				jsResponse("글 생성에 실패 하였습니다.", "xe.do?command=QandAList", response);
			}

		} else if (command.equals("detailForm")) {
			int qa_seq = Integer.parseInt(request.getParameter("seq"));
			QADto res = qaBiz.selectOne(qa_seq);
			
			request.setAttribute("dto", res);
			dispatch("detailForm.jsp", request, response);
			
		} else if (command.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			pw = pw.toLowerCase();

			UserDto dto = loginBiz.selectLogin(id, pw);
			
			if (dto.getPr_id() != null) {
				webSession.setAttribute("sessionInfo", dto);
				webSession.setMaxInactiveInterval(10 * 60);

				String pr_role = dto.getPr_role();

				if (dto.getPr_enabled().toLowerCase().equals("n")) {
					jsResponse("탈퇴한 ID입니다!", "index.jsp", response);

				} else if (dto.getPr_enabled().toLowerCase().equals("y")) {
					if (pr_role.equals("ADMIN")) {
						response.sendRedirect("AdminMain.jsp");
					} else if (pr_role.equals("USER")) {
						response.sendRedirect("main.jsp");
					}
				}
			}else {
				jsResponse("ID와 비밀번호를 다시 한 번 확인해 주세요!!", "index.jsp", response);
			}

		} else if (command.equals("logout")) {
			webSession.invalidate();
			response.sendRedirect("index.jsp");

		} else if (command.equals("userListAll")) {
			List<UserDto> res = new ArrayList<>();
			res = loginBiz.selectAllUser();

			request.setAttribute("userListAll", res);
			dispatch("UesrInfoAll.jsp", request, response);

		} else if (command.equals("userRoleForm")) {
			String no = request.getParameter("no");
			int pr_no = Integer.parseInt(no);
			UserDto res = loginBiz.selectOne(pr_no);
			
			request.setAttribute("userOne", res);
			dispatch("userRoleForm.jsp", request, response);

		} else if (command.equals("idChk")) {
			String id = request.getParameter("id");
			UserDto dto = loginBiz.selectOne(id);
			System.out.println(dto);

			boolean idNotUsed = true;

			if (dto != null) {
				idNotUsed = false;
				response.sendRedirect("idChk.jsp?idNotUsed=" + idNotUsed);
			} else {
				response.sendRedirect("idChk.jsp?idNotUsed=" + idNotUsed);
			}

		} else if (command.equals("join")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String addr = request.getParameter("addr");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			
			UserDto userDto = new UserDto(0, id, pw, name, addr, phone, email, "y", "USER");
			System.out.println(userDto);
			int res = loginBiz.insertUser(userDto);
			
			if(res > 0) {
				selfClose("가입을 축하드립니다!", response);
			} else {
				jsResponse("가입에 실패하였습니다...", "index.jsp", response);
			}

		} else if (command.equals("userRoleForm")) {
			int pr_no = Integer.parseInt(request.getParameter("no"));
			
			UserDto res = loginBiz.selectOne(pr_no);
			request.setAttribute("dto", res);
			dispatch("userRoleForm.jsp", request, response);

		} else if (command.equals("delete")) {
			int pr_no = Integer.parseInt(request.getParameter("no"));
			int res = qaBiz.delete(pr_no);
			if(res>0) {
				dispatch("xe.do?command=QandAList",request,response);
			}

		} else if (command.equals("search")) {
			String writer = request.getParameter("writer");
			QADto res = qaBiz.search(writer);
			request.setAttribute("search",res);
			
			

		} else if (command.equals("weather")) {
			String code = request.getParameter("code");
			request.setAttribute("code", code);
			dispatch("/weather/weatherInfo.jsp", request, response);

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

	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
	public void selfClose(String msg, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "self.close();"
				+ "</script>";
		PrintWriter out = response.getWriter();
		out.print(s);
	}

}
