package com.soccer.web.enums;

public enum DBUrl {
	ORACLE_URL, MARIA_URL;
	
	@Override
	public String toString() {
		
		String url = "";
		switch (this) {
		
		case ORACLE_URL:
			url = "jdbc:oracle:thin:@localhosts:1521:xe\\\\r\\\\n";
			break;
			
		case MARIA_URL:
			url = "jdbc:mariadb://localhost:3306/test\\\\r\\\\n";
			break;


		default:
			break;
		}
		
		return url;
	}

}
