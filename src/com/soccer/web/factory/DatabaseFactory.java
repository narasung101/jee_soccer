package com.soccer.web.factory;

import java.sql.Connection;
import java.sql.DriverManager;

import com.soccer.web.pool.Constants;

public class DatabaseFactory {
	public static Database createDatabase(String vendor) {
		Database db = null;
		
		switch (vendor) {
		case "oracle":
			
			break;
			
		case "maria":
			
			break;

		default:
			break;
		}
		
		return db;
	}
	
}