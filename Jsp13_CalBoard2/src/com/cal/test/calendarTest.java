package com.cal.test;

import static java.util.Calendar.*;
import java.util.Calendar;

public class calendarTest {

	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance();

		int year = cal.get(YEAR);
		int month = cal.get(MONTH) + 1;
		cal.set(year, month - 1, 1);
		int startDay = cal.get(DAY_OF_WEEK);
		// int lastDay = cal.getActualMaximum(DAY_OF_MONTH);

		System.out.println("\t\t\t" + year + "년 " + month + "월");
		for (int i = 1; i <= cal.getActualMaximum(DAY_OF_WEEK); i++) {
			System.out.print(SwitchDayOfWeek(i) + "\t");
		}
		System.out.println();

		// 공백
		for (int i = 0; i < startDay - 1; i++) {
			System.out.print("\t");
		}

		// 날짜
		for (int i = 1; i <= cal.getActualMaximum(DAY_OF_MONTH); i++) {
			System.out.print(i + "\t");

			if ((startDay - 1 + i) % 7 == 0) {
				System.out.println();
			}
		}
	}

	static String SwitchDayOfWeek(int dayOfWeek) {
		String res = "";
		switch (dayOfWeek) {
		case 1:
			res = "일";
			break;
		case 2:
			res = "월";
			break;
		case 3:
			res = "화";
			break;
		case 4:
			res = "수";
			break;
		case 5:
			res = "목";
			break;
		case 6:
			res = "금";
			break;
		case 7:
			res = "토";
			break;

		}
		return res;
	}
}
