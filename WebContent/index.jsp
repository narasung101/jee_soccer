<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>


<h2><input id="btn2" type="button" value = "2.포지션 종류 보기 "/></h2>
<h2>4. 팀아이디로 해당 팀의 포지션별 선수 검색기능 예 ) 수원팀(ID: k02), 골기퍼 </h2>

	<form id ="btn4" action="<%=request.getContextPath()%>/player.do">
	팀아이디<input type="text" name="teamId"/>
	포지션<input type="text" name="position"/>
	<input type="hidden" name="action" value="find" />
	<input type="hidden" name="page" value="4_find_by_teamid_position"/>
	<input type="submit" value="전송" />
	</form>


<h2>5. 수원팀(ID: K02)키가 170 이상 선수 이면서 성이 고씨인 선수 정보 출력</h2>

	<form id ="btn5"action="<%=request.getContextPath()%>/player.do">
		팀아이디<input type="text" name="teamId" />
		선수 키<input type="text" name="height"/>
		선수 성<input type="text" name="playerName"/>
		<input type="hidden" name="action" value="find2"/>
		<input type="hidden" name="page" value="5_find_by_teamid_height_name" />
		<input type="submit" value="전송" />
	</form>
	
<script>
$('#btn2').click(function() {
	alert('연결');
	location.assign('<%=request.getContextPath()%>/player.do?action=find2&page=2_positions')
});

$('#btn4').submit(function() {
	alert('연결');
	});

$('#btn5').submit(function() {
	alert('연결');
	});
</script>	

</body>
</html>

