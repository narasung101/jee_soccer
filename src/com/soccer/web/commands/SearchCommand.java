package com.soccer.web.commands;

import javax.servlet.http.HttpServletRequest;

import com.soccer.web.pool.Constants;
import com.soccer.web.serviceimpls.PlayerServiceImpl;

public class SearchCommand extends Command{
	
	public SearchCommand(HttpServletRequest request) {
		super.setRequest(request);
		setDomain(request.getServletPath().substring(1, request.getServletPath().indexOf(".")));
		setAction(request.getParameter("action"));
		execute();
	}
	
	@Override
	public void execute() {
	request.setAttribute("positions", PlayerServiceImpl.getInstance().findPositions());
	this.view = String.format(Constants.DOUBLE_PATH, "player", "main");
	}
}
