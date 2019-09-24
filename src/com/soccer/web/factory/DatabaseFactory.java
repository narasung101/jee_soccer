package com.soccer.web.factory;



public class DatabaseFactory {
	public static Database createDatabase(String vendor) {
		Database db = null;
		
		switch (vendor) {
		case "oracle":
			db = new Oracle();
			break;
			
		case "maria":
			db = new Maria();
			break;

		default:
			break;
		}
		
		return db;
	}
	
}