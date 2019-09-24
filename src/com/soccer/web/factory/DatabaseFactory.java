package com.soccer.web.factory;

import com.soccer.web.pool.Constants;

public class DatabaseFactory {
	public static DatabaseBean createDatabase(String vendor) {
		DatabaseBean db = null;
		switch(vendor) {
		
		case "oracle" : db = new Oracle(); break;
		case "mariadb" : db = new Oracle(); break;
		case "h2" : db = break;
		case "db2" : db = break;
							
		}
		return db;
	}

}
