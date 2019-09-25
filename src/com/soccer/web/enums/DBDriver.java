package com.soccer.web.enums;

public enum DBDriver {
	ORACLE_DRIVER, ORACLE_URL, MARIA_DRIVER, MARIA_URL;
	
	@Override
	public String toString() {
		String driver = "";
		switch (this) {
		case ORACLE_DRIVER:
			driver = "oracle.jdbc.OracleDriver";
			break;
							
		case MARIA_DRIVER:
			driver = "org.mariadb.jdbc.Driver";
			break;
	
		default:
			break;
		}
		return driver;
	}

}
