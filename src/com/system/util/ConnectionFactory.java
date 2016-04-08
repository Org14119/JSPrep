package com.system.util;

import java.util.Properties;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	private static String driver;
	private static String dburl;
	private static String user;
	private static String password;
	private static final ConnectionFactory factory = new ConnectionFactory();
	private Connection conn = null;// 使用单例模式
	static {// 初始化类，为类的属性赋值，在JVm加载类的时候，会执行静态代码块，静态代码块只会执行一次
		Properties prop = new Properties();// 继承自hashtable，保存键值对
		try {
			InputStream in = ConnectionFactory.class.getClassLoader().getResourceAsStream("dbconfig.properties");// 获得属性内容
			prop.load(in);// 从流中读取属性列表
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		driver = prop.getProperty("driver");
		dburl = prop.getProperty("dburl");
		user = prop.getProperty("user");
		password = prop.getProperty("password");
	}

	private ConnectionFactory() {

	}

	public static ConnectionFactory getInstace() {// 单例模式，用来获取ConneciotnFactory实例
		return factory;
	}

	public Connection makeConnection() {

		try {
			Class.forName(driver);// 注册Mysql驱动程序，初始化参数指定的类
			conn = DriverManager.getConnection(dburl, user, password);// 获取mysql链接，分别是url，用户名，密码
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
}
