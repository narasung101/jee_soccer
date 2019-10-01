package com.soccer.web.commands;

import javax.servlet.http.HttpServletRequest;

import com.soccer.web.domains.PlayerBean;
import com.soccer.web.serviceimpls.PlayerServiceImpl;

public class CreateCommand extends Command{
	public CreateCommand(HttpServletRequest request) {
		setRequest(request);
		setDomain(domain);
		setAction(action);
		super.execute();
		this.execute();
	}
	@Override
	public void execute() {
		PlayerBean param = new PlayerBean();
		param.setPlayerId(request.getParameter("playerId"));
		param.setSolar(request.getParameter("solar"));
		if(PlayerServiceImpl.getInstance().join(param)){
			System.out.println("회원가입 성공");
	}else {
	    	System.out.println("회원가입 실패");
	}
		
	}

}
