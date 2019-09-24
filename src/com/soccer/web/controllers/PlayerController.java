package com.soccer.web.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soccer.web.domains.PlayerBean;
import com.soccer.web.serviceimpls.PlayerServiceImpl;
import com.soccer.web.services.PlayerService;

@WebServlet("/player.do")
public class PlayerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PlayerBean player = null;
		
		String action = request.getParameter("action");
		System.out.println("액션: " + action);
		
		switch(action) {
		case "move" : break;
		
		case "find2" :
	        request.setAttribute("positions", PlayerServiceImpl.getInstance().findPositions());
	        break;		
			
		case "find4" :
						
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
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/" + request.getParameter("page") + ".jsp");
		rd.forward(request, response);
	}

}
