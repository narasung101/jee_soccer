
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="p" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/head.jsp"/>
<p:choose>
 <p:when test="${page eq 'main'}">
 	<jsp:include page="2_positions_q.jsp"/>
 </p:when>
 <p:when test="${page eq '2_positions_a' }">
 	<jsp:include page="2_positions_a.jsp"/>
 </p:when>
</p:choose>
<jsp:include page="../common/foot.jsp"/>
<script>
app.init('${ctx}');
</script>