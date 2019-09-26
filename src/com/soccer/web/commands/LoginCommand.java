package com.soccer.web.commands;

import javax.servlet.http.HttpServletRequest;

import com.soccer.web.serviceimpls.PlayerServiceImpl;
public class LoginCommand extends Command {
	public LoginCommand(HttpServletRequest request) {
		super.setRequest(request);
		setDomain(request.getServletPath().substring(1, request.getServletPath().indexOf(".")));
		setAction(request.getParameter("action"));
		execute();
	}
	
	@Override
	public void execute() {
				
		if (PlayerServiceImpl.getInstance().login(null)) {
			setPage(request.getParameter("page"));
		} else {
			setPage("index.jsp");
		}
		super.execute();
}
}