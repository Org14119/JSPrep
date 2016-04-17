package com.system.util;


import java.sql.Date;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class TimeUtil {
	public static Date getCurrentTime(){
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now= new Date(System.currentTimeMillis());
		format.format(now);
		return now;
	}
	public static java.sql.Date parseStringToDate(String str){
		DateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//小写的mm表示的是分钟  
		try {
			java.util.Date date=sdf.parse(str);
			System.out.println(date.getTime());
			java.sql.Date sqlDate=new java.sql.Date(date.getTime());
			
			System.out.println(sqlDate);
			return sqlDate;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return null;
		}
	}
}
