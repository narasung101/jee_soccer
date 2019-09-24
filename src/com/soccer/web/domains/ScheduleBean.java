package com.soccer.web.domains;
import java.io.Serializable;

import lombok.Data;
@Data
public class ScheduleBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private String scheDate, stadiumId, gubun, hometeamID, awayteamID, 
	homeScore, awayScore;

}
