<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

	<script>
		
		const msg = '${msg}'
		const url = '${url}'
		const row = '${row}'
		//const requestURL = '${requestUrl}'
		
		
		
				
		if(row==0){
			swal('msg', ,'error');
			if(url == '') {
				history.go(-1);
			}
			else {
				location.href = url;
			}		
			
		}else{
			swal('msg', ,'success');
			if(url == '') {
				history.go(-1);
			}
			else {
				location.replace(url);
			}		
		}
		
		
		
		
	</script>

</body>
</html>