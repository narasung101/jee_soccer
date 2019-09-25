package com.soccer.web.factory;

import com.soccer.web.enums.DB;

public class DatabaseFactory {
	public static Database createDatabase(String vendor) {
		Database db = null;
		switch (DB.valueOf(vendor)) {   //String이면 .vallueof
		case ORACLE :
			db = new Oracle();
			break;
			
		case MARIA :
			db = new Maria();
			break;

		default:
			break;
		}
		
		return db;
	}
	
}