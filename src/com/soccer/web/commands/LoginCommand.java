package com.soccer.web.commands;

import javax.servlet.http.HttpServletRequest;

import com.soccer.web.domains.PlayerBean;
import com.soccer.web.pool.Constants;
import com.soccer.web.serviceimpls.PlayerServiceImpl;
public class LoginCommand extends Command {
	public LoginCommand(HttpServletRequest request) {
		
		System.out.println("★★★ 5. LoginCommand 들어옴 ★★★ ");
		System.out.println(String.format("request 값 출력 : %s, %s, %s, %s ",
				request.getParameter("playerId"), 
				request.getParameter("solar"),
				request.getParameter("action"),
				request.getParameter("page")));
		setRequest(request);
		setDomain(request.getServletPath()
				.substring(1,request.getServletPath().indexOf(".")));
		setAction(request.getParameter("action"));
		this.execute();
	}
	@SuppressWarnings("unused")
	@Override
	public void execute() {
		
		String playerId = request.getParameter("playerId");
		String solar = request.getParameter("solar");
		PlayerBean player = new PlayerBean();
		player.setPlayerId(playerId);
		player.setSolar(solar);
		player = PlayerServiceImpl.getInstance().login(player);
		//System.out.println("10. DB에서 커맨드로 전달된 로그인 객체 : "+player.toString());
		System.out.println("db에서 로그인커맨드도착");
		if (player.getPlayerId()==null) {
			setPage("login");
			System.out.println("로그인실패");
		} else {
			System.out.println(request.getParameter("page"));
			setPage(request.getParameter("page"));
			this.view = String.format(Constants.DOUBLE_PATH, domain, page);
			System.out.println("로그인성공");
		}
		//request.setAttribute("action", request.getServletContext()+"/facade.do");
		//super.execute();
		
		/**setPage((player!=null) ?request.getParameter("page"):"login");
		super.execute(); */
		
		/** if(!player.getPlayerId().equals("")) {
			setPage(request.getParameter("page"));
		}else {
			setPage("index.jsp");
		}
		*/
		
	}
}