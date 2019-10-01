package com.soccer.web.commands;

import javax.servlet.http.HttpServletRequest;

public class MoveCommand extends Command {
	
	public MoveCommand(HttpServletRequest request) {
		System.out.println("★★★ 6. MoveCommand 들어옴 ★★★ ");
		System.out.println(String.format("request 값 출력 : %s, %s, %s, %s ",
				request.getParameter("playerId"), 
				request.getParameter("solar"),
				request.getParameter("action"),
				request.getParameter("page")));
		
		super.setRequest(request);
		setDomain(request.getServletPath().substring(1, request.getServletPath().indexOf(".")));
		setAction(request.getParameter("action"));
		execute();
	}
	
	@Override
	public void execute() {
				
		setPage(request.getParameter("page"));
		super.execute();
		// request.setAttribute("pagename", request.getParameter("page"));
	}
	
	}


