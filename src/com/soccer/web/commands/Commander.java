package com.soccer.web.commands;

import javax.servlet.http.HttpServletRequest;
import com.soccer.web.enums.Action;

public class Commander {
	public static Command direct(HttpServletRequest request) {
		Command cmd = null;
		//Action a = Action.valueOf(request.getParameter("action").toUpperCase());
		switch (Action.valueOf(request.getParameter("action").toUpperCase())) {
		case SEARCH : cmd = new SearchCommand(request);
			break;
		case MOVE : cmd = new MoveCommand(request);
			break;
		case LOGIN : cmd = new LoginCommand(request);
			break;

		default:
			break;
		}
		
		return cmd;
		
				
	}

}