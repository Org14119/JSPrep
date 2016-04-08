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
	private Connection conn = null;// ʹ�õ���ģʽ
	static {// ��ʼ���࣬Ϊ������Ը�ֵ����JVm�������ʱ�򣬻�ִ�о�̬����飬��̬�����ֻ��ִ��һ��
		Properties prop = new Properties();// �̳���hashtable�������ֵ��
		try {
			InputStream in = ConnectionFactory.class.getClassLoader().getResourceAsStream("dbconfig.properties");// �����������
			prop.load(in);// �����ж�ȡ�����б�
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

	public static ConnectionFactory getInstace() {// ����ģʽ��������ȡConneciotnFactoryʵ��
		return factory;
	}

	public Connection makeConnection() {

		try {
			Class.forName(driver);// ע��Mysql�������򣬳�ʼ������ָ������
			conn = DriverManager.getConnection(dburl, user, password);// ��ȡmysql���ӣ��ֱ���url���û���������
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
