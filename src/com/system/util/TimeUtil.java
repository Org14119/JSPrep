package com.system.util;


import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class TimeUtil {
	public static Date getCurrentTime(){
		DateFormat format=new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
		Date now= new Date(System.currentTimeMillis());
		format.format(now);
		return now;
	}
}
