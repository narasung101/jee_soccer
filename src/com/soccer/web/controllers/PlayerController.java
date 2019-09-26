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

@WebServlet("/player.do")
public class PlayerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Receiver r = new Receiver();
		r.init(request);
		Commander c = new Commander();
		Sender s = new Sender();		
				
		String playerId = request.getParameter("playerId");
		String solar = request.getParameter("solar");
		String action = request.getParameter("action");
		String page= request.getParameter("page");
		
		Receiver.init(request);
		
	/** String action = request.getParameter("action");
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

	}

}
