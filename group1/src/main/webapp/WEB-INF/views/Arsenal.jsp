<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="scroll.jsp" %>
<!-- 0629 bcg -->
<style>
	.firstSection::before{
		content: "";
        background: url(${cpath}/resources/images/background/Arsenal/4.jpg);
        background-size: cover;
        opacity: 0.5;
        position: absolute;
        top: 0px;
        left: 0px;
        right: 0px;
        bottom: 0px;
	}
		.secondSection::before{
		content: "";
        background: url(${cpath}/resources/images/background/Arsenal/2.jpg);
        background-size: cover;
        opacity: 0.5;
        position: absolute;
        top: 0px;
        left: 0px;
        right: 0px;
        bottom: 0px;
	}
		.thirdSection::before{
		content: "";
        background: url(${cpath}/resources/images/background/Arsenal/3.jpg);
        background-size: cover;
        opacity: 0.5;
        position: absolute;
        top: 0px;
        left: 0px;
        right: 0px;
        bottom: 0px;
	}
</style>

	<div id="fullpage">
		<div class="section firstSection" id="ARS1">
			<div style="position: absolute; top: 100px;">
				<h1 style="display: inline-block; margin-right: 10px">Arsenal News</h1>
				<input id="correctNews" type="button" value="정확도순" style="display: inline-block; margin-right: 5px">
				<input id="latestNews" type="button" value="최신순" style="display: inline-block;">  <br></br>
				<div class="news">
				</div>
			</div>
		</div>

	<div class="section secondSection" id="ARS2">
			<h2>ARS 2</h2>
	</div>

		<div class="section thirdSection" id="ARS3">
			<h2>ARS 3</h2>
				<div class="limiter" style="padding-top: 75px; width:1000px; height:800px; color: #F00000;">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110"">
					<div class="table100-head"">
						<table>
							<thead>
								<tr class="row100 head" >
									<th class="cell100 column1" style="background:${clubColor};"><button style="color: #FFFFFF;" id="newNumber" >최신</button></th>
									<th class="cell100 column2" style="background:${clubColor};"><button style="color: #FFFFFF;" id="viewNumber" >조회수</button></th>
									<th class="cell100 column3" style="background:${clubColor};"><button style="color: #FFFFFF;" id="likeNumber">추천수</button></th>
									<th class="cell100 column3" style="background:${clubColor};"><button style="color: #FFFFFF;" id="likeNumber">글쓴이</button></th>
									<th class="cell100 column3" style="background:${clubColor};"><button style="color: #FFFFFF;" id="likeNumber">날짜</button></th>								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll"   >
							<table>
							<tbody>
							<c:forEach var="dto" items="${list }">
								<tr class="row100 body">
									<td class="cell100 column1 titleArea" ><a href="${cpath }/board/read/${dto.idxBo}?type=${param.type }&search=${param.search }&vc=true">${dto.title}</a></td>
									<td class="cell100 column2 viewCountArea">${ dto.viewCount}</td>
									<td class="cell100 column3 likeCountArea">${ dto.likeCount}</td>
									<td class="cell100 column3 likeCountArea">${ dto.writer}</td>
									<td class="cell100 column3 likeCountArea">${ dto.wdate}</td>
									
								</tr>
							</c:forEach>
							</table>
						
					<div class= "sb" style="background:${clubColor};">
							<form >
								<span >
								<select  name="type" style="background:${clubColor};">
									<option ${param.type == 'title' ? 'selected' : '' } value="title">제목</option>
									<option ${param.type == 'writer' ? 'selected' : '' } value="writer">글쓴이</option>
									<option ${param.type == 'content' ? 'selected' : '' } value="content">내용</option>
								</select>
								</span>
								
								<span><input style="background:${clubColor};" type="text" name="search" value="${param.search }" ></span>
                        		<span><input style="background:${clubColor};" type="submit" value="검색"></span>
                    			 </form>
                    			 
								<c:if test="${login.club == 'Arsenal'}">
								<span style=  "justify-content: space-between; "><a href="${cpath}/board/mylist/${login.nickName}">나의 글</a><a href="${cpath}/board/write">글쓰기</a></span>
								</c:if>
					</div>		
									
						
					</div>
				</div>
			</div>
		</div>
		</div>
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