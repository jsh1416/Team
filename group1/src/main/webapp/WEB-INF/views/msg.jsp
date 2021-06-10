<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>


<div class="alert alert-dismissible alert-info">
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  <strong>Heads up!</strong> This <a href="#" class="alert-link">alert needs your attention</a>, but it's not super important.
</div>

	<script>
		
		const msg = '${msg}'
		const url = '${url}'
		//const requestURL = '${requestUrl}'
		alert(msg);
		
		$().ready(function () { 
			$("#alertStart").click(function () {
				Swal.fire({ icon: 'success',// Alert 타입 
					title: 'Alert가 실행되었습니다.', // Alert 제목 
					text: '이곳은 내용이 나타나는 곳입니다.', // Alert 내용 
					}); 
				}); 
			});

			
				
		if(url == '') {
			history.go(-1);
		}
		else {
			location.href = url;
		}		
		
		
	</script>

</body>
</html>