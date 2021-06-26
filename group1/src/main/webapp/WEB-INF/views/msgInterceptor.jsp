<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script>
	// 인터셉터 msg 페이지 jsh 06.25
	const msg = '${msg}'
	const url = '${cpath}${url}'
	
	alert(msg);
	if(url == '') {
		history.go(-1);
	}
	else {
		location.href = url;
	}
</script>
</body>
</html>