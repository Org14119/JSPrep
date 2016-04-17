package com.system.util;


import java.sql.Date;
import java.util.*;
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
	public static java.util.Date parseStringToDate(String str){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//小写的mm表示的是分钟  
		try {
			java.util.Date date=sdf.parse(str);
			return date;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return null;
		}
	}
}
