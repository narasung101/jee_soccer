package com.soccer.web.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soccer.web.commands.Commander;
import com.soccer.web.commands.Receiver;
import com.soccer.web.commands.Sender;
import com.soccer.web.domains.PlayerBean;
import com.soccer.web.serviceimpls.PlayerServiceImpl;
import com.soccer.web.services.PlayerService;
import com.soccer.web.enums.Action;

@WebServlet("/player.do")
public class PlayerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("★★★ 1. player 서블릿 들어옴 ★★★ ");
		System.out.println(String.format("request 값 출력 : %s, %s, %s, %s ",
				request.getParameter("playerId"), 
				request.getParameter("solar"),
				request.getParameter("action"),
				request.getParameter("page")));
		
		Receiver.init(request);
		switch (Action.valueOf(request.getParameter("action").toUpperCase())) {
		case CREATE :request.setAttribute("page", "login"); break;
		
		default: break;
		}
		Sender.forward(request, response);

	}

}

	/**
	 * Receiver r = new Receiver();
		r.init(request);
		Commander c = new Commander();
		Sender s = new Sender();	
	 *  
	 *  String action = request.getParameter("action");
		 PlayerBean player = null;
		System.out.println("액션: " + action);
				
		switch(action) {
		case "move" : break;
		
		case "find2" :
	        request.setAttribute("positions", PlayerServiceImpl.getInstance().findPositions());
	        break;		
			
		case "find4" :
					System.out.println("find4 진입" + action);	
			player = new PlayerBean();
			player.setTeamId(request.getParameter("teamId"));
			player.setPosition(request.getParameter("position"));
			request.setAttribute("players", PlayerServiceImpl.getInstance().findByTeamIdPosition(player));
			break;	
			
		case "find5" :
			
			player = new PlayerBean();
			player.setTeamId(request.getParameter("teamId"));
			player.setHeight(request.getParameter("height"));
			player.setPlayerName(request.getParameter("playerName"));
			request.setAttribute("players", PlayerServiceImpl.getInstance().findbyTeamIdHeightName(player));
			break;	
			
		}
		String page = request.getParameter("page");
		System.out.println("페이지:" + page);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/" + page + ".jsp");
		rd.forward(request, response); */

