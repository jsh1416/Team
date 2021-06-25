<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="scroll.jsp" %>
<!-- 개jjj -->

	<div id="fullpage">
		<div class="section" id="ARS1">
			<div style="position: absolute; top: 100px;">
				<h1 style="display: inline-block; margin-right: 10px">Arsenal News</h1>
				<input id="correctNews" type="button" value="정확도순" style="display: inline-block; margin-right: 5px">
				<input id="latestNews" type="button" value="최신순" style="display: inline-block;">  <br></br>
				<div class="news">
				</div>
			</div>
		</div>

		<div class="section" id="ARS2">
			<h2>ARS 2</h2>
		</div>

		<div class="section" id="ARS3">
			<h2>ARS 3</h2>
		</div>
	</div>

<script>
	// 정확도순 뉴스 
	document.getElementById('correctNews').onclick = function(event) {
		document.querySelector('div.news').innerText='' // 내용 비우기
		const url = '${cpath}/api/ars/correct' 			// 여기서만 team, type 매개변수 바꿔주면 됨
		const opt = {
			method: 'GET',	
		}
		fetch(url, opt)				
		.then(resp => resp.json())		
		.then(json => {
			
			const newslist = JSON.parse(json) // string -> obj
   			if(newslist == null) {
				document.getElementById('news').innerText = '오류가 발생하였습니다.'
			}
			else {
				for(let i = 0; i < newslist.items.length; i++){
					const child = document.createElement('div')		// 제목
					const child2 = document.createElement('div')	// 내용
					const newstitle = '<a href=' + newslist.items[i].link + ' target="_blank" style="color:#F00000; font-weight:bold; cursor: pointer;">' 
					+ '<span style="color:#E31B23; font-weight:bold;">' + (i+1) + '</span>' + '&nbsp&nbsp&nbsp[' + newslist.items[i].title + ']</a>'
					const content = newslist.items[i].description  + 
					'(' + newslist.items[i].pubDate.slice(0, -5) + ')' + '<br>' +  '<br>'
					child.innerHTML = newstitle
					child2.innerHTML = content
					document.querySelector('div.news').appendChild(child) 	// 제목 출력
					document.querySelector('div.news').appendChild(child2)	// 내용 미리보기 출력
				}
			} 
		})
	}
	
	// 최신순 뉴스
	document.getElementById('latestNews').onclick = function(event) {
		document.querySelector('div.news').innerText='' // 내용 비우기
		const url = '${cpath}/api/ars/latest' 			// 여기서만 team, type 매개변수 바꿔주면 됨
			const opt = {
				method: 'GET',	
			}
			fetch(url, opt)				
			.then(resp => resp.json())		
			.then(json => {
				
				 const newslist = JSON.parse(json) // string -> obj
			
	   			if(newslist == null) {
					document.getElementById('news').innerText = '오류가 발생하였습니다.'
				}
				else {
					for(let i = 0; i < newslist.items.length; i++){
						const child = document.createElement('div')	
						const child2 = document.createElement('div')
						const newstitle = '<a href=' + newslist.items[i].link + ' target="_blank" style="color:#F00000; font-weight:bold; cursor: pointer;">' 
						+ '<span style="color:#E31B23; font-weight:bold;">' + (i+1) + '</span>' + '&nbsp&nbsp&nbsp[' + newslist.items[i].title + ']</a>'
						const content = newslist.items[i].description  + 
						'(' + newslist.items[i].pubDate.slice(0, -5) + ')' + '<br>' +  '<br>'
						child.innerHTML = newstitle
						child2.innerHTML = content
						document.querySelector('div.news').appendChild(child)
						document.querySelector('div.news').appendChild(child2)
					}
				} 
			})
		}
</script>
</body>
</html>