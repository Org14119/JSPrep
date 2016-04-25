package com.system.util;

import java.io.InputStream;
import java.util.*;

public class FileRootFactory {
	private static String upLoacation = "";
	private static String trueLocation = "";
	static {
		Properties prop = new Properties();
		try {
			InputStream in = FileRootFactory.class.getClassLoader().getResourceAsStream("fileconfig.properties");
			prop.load(in);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		upLoacation = prop.getProperty("fileUpLocation");
		trueLocation = prop.getProperty("trueLocation");
	}

	public static String getUpLocation() {
		// System.out.println("upLoc"+upLoacation);
		return upLoacation;
	}

	public static String getTrueLoacation() {
		// System.out.println("upLoc"+trueLocation);
		return trueLocation;
	}
}
