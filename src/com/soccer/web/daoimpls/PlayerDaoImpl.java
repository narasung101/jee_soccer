package com.soccer.web.daoimpls;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.soccer.web.daos.PlayerDao;
import com.soccer.web.domains.PlayerBean;
import com.soccer.web.factory.DatabaseFactory;
import com.soccer.web.pool.Constants;

public class PlayerDaoImpl implements PlayerDao{
	private static PlayerDaoImpl instance = new PlayerDaoImpl();
	public static PlayerDaoImpl getInstance() {return instance;}
	private PlayerDaoImpl() {}
	@Override
	public PlayerBean selectByPlayerIdSolar(PlayerBean param) {
		PlayerBean player = new PlayerBean();
		String sql = "SELECT *\r\n" + 
				"FROM PLAYER\r\n" + 
				"WHERE PLAYER_ID LIKE ?\r\n" + 
				"    AND SOLAR LIKE ?";
		System.out.println("sdsd" + param.getPlayerId()+param.getSolar());
		try {
			PreparedStatement pst = DatabaseFactory.createDatabase(Constants.VENDOR).getConnection().prepareStatement(sql);
			pst.setString(1, param.getPlayerId());
			pst.setString(2, param.getSolar());
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				player = new PlayerBean();
				player.setBackNo(rs.getString("BACK_NO"));
				player.setBirthDate(rs.getString("BIRTH_DATE"));
				player.setEPlayerName(rs.getString("E_PLAYER_NAME"));
				player.setHeight(rs.getString("HEIGHT"));
				player.setJoinYyyy(rs.getString("JOIN_YYYY"));
				player.setNation(rs.getString("NATION"));
				player.setNickname(rs.getString("NICKNAME"));
				player.setPlayerId(rs.getString("PLAYER_ID"));
				player.setPlayerName(rs.getString("PLAYER_NAME"));
				player.setPosition(rs.getString("POSITION"));
				player.setSolar(rs.getString("SOLAR"));
				player.setTeamId(rs.getString("TEAM_ID"));
				player.setWeight(rs.getString("WEIGHT"));
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		System.out.println("9. 반환된 결과값: "+player.toString());
		return player;
		
	}
	@Override
	public List<String> selectPositions() {
		List<String> positions = new ArrayList<>();
		System.out.println("12345678" );
		try {
			String sql = "SELECT DISTINCT POSITION position \n" + 
					"FROM PLAYER";
			PreparedStatement stmt = DatabaseFactory
					.createDatabase(Constants.VENDOR)
					.getConnection()
					.prepareStatement(sql);
			ResultSet rs =	stmt.executeQuery();
			while(rs.next()) {
				positions.add(rs.getString("POSITION"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return positions;
	}
	@Override
	public List<PlayerBean> selectByTeamIdPosition(PlayerBean param) {
		List<PlayerBean> list = new ArrayList<>();
		return list;
	}
	@Override
	public List<PlayerBean> selectByMany(PlayerBean param) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean insertPlayer(PlayerBean param) {
		boolean flag = false;
		try {
			String sql = "INSERT INTO PLAYER(PLAYER_ID, SOLAR, TEAM_ID, PLAYER_NAME)\r\n" + 
					"VALUES (?, ?, 'K02', '김나성')";
			PreparedStatement stmt = DatabaseFactory
					.createDatabase(Constants.VENDOR)
					.getConnection()
					.prepareStatement(sql);
			System.out.println("123123" + param.getPlayerId()+"  " +  param.getSolar());
			stmt.setString(1, param.getPlayerId());
			stmt.setString(2, param.getSolar());
			int rs = stmt.executeUpdate();
			flag = (rs == 1);  
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("DB "+ flag);
		return flag;
	}
}
	