package com.cal.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import com.cal.dto.CalDto;

public class Util {

	private String toDates;

	public String getToDates() {
		return toDates;
	}

	// mdate를 날짜 형식으로 표현하기 위한 setter
	public void setToDates(String mdate) {
		// yyyy-MM-dd hh:mm:00
		String m = mdate.substring(0, 4) + "-" + mdate.substring(4, 6) + "-" + mdate.substring(6, 8) + " "
				+ mdate.substring(8, 10) + ":" + mdate.substring(10) + ":00";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분");
		Timestamp tm = Timestamp.valueOf(m);
		toDates = sdf.format(tm);
	}

	// 한자리 수(9 , 2, ...)를 두자리 수(09, 02, ...)로 변환
	public static String isTwo(String msg) {
		return msg.length() < 2 ? "0" + msg : msg;
	}

	// 달력의 토요일, 일요일, 평일 색상 설정
	public static String fontColor(int date, int start) {
		String color = "";

		if ((start - 1 + date) % 7 == 0) {
			color = "blue";
		} else if ((start - 1 + date) % 7 == 1) {
			color = "red";
		} else {
			color = "black";
		}
		return color;
	}

	// 달력의 일정 일부를 출력
	public static String getCalView(int i, List<CalDto> clist) {
		String d = isTwo(i + "");
		String res = "";

		for (CalDto dto : clist) {
			if (dto.getMdate().substring(6, 8).equals(d)) {
				res += "<p><a href='CalController.do?command=calDetail&seq=" + dto.getSeq() + "'>"
						+ (dto.getTitle().length() > 6 ? dto.getTitle().substring(0, 6) + "..." : dto.getTitle())
						+ "</a></p>";
			}
		}

		return res;
	}

}
