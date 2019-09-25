package com.soccer.web.commands;

import java.awt.Desktop.Action;

import javax.servlet.http.HttpServletRequest;

public class Commander {
	public static Command direct(HttpServletRequest request) {
		Command o = null;
		Action a = Action.valueOf(request.getParameter("action").toUpperCase());
		switch (request.getParameter("action")) {
		case "search": o = new SearchCommand();
			break;
		case "move": o = new MoveCommand();
			break;

		default:
			break;
		}
		
		return o;
		
				
	}

}
