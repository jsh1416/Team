<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 풀페이지 스크롤 링크 jsh 06.14
	 scroll.jsp로 분리 jsh 0622
  -->
<link rel="stylesheet" type="text/css" href="resources/scroll/jquery.fullPage.css" />
<link rel="stylesheet" type="text/css" href="resources/scroll/examples.css" />
<script type="text/javascript" src="resources/scroll/scrolloverflow.js"></script>
<script type="text/javascript" src="resources/scroll/jquery.fullPage.js"></script>
<script type="text/javascript" src="resources/scroll/examples.js"></script>
	<!-- 스크롤 기능 jsh 06.14  -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#fullpage').fullpage({
			anchors: ['firstPage', 'secondPage', 'thirdPage'],
			navigation: true,
			css3: true,
			keyboardScrolling: true,
			// 06.23 bcg
			slidesNavigation : true,
			autoScrolling: true,
			keyboardScrolling: true,
		
			afterRender: function () {
	            setInterval(function () {
	                $.fn.fullpage.moveSlideRight();
	            }, 3000);
	        }
			// 06.23 bcg end
		});
	});
</script>
</head>
<body>
