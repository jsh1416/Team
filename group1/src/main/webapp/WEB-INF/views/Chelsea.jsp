<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="scroll.jsp" %>
	<div id="fullpage">
		<div class="section" id="CHE1">
			<div style="position: absolute; top: 100px;">
				<h1 style="display: inline-block; margin-right: 10px">Chelsea News</h1>
				<input id="correctNews" type="button" value="정확도순" style="display: inline-block; margin-right: 5px">
				<input id="latestNews" type="button" value="최신순" style="display: inline-block;">  <br></br>
				<div class="news">
				</div>
			</div>
		</div>

		<div class="section" id="CHE2">
			<h2>CHE 2</h2>
					<div class="limiter" style="padding-top: 75px; width:1000px; height:800px;">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1"><button style="color: #FFFFFF;" id="newNumber" >최신</button></th>
									<th class="cell100 column2"><button style="color: #FFFFFF;" id="viewNumber" >조회수</button></th>
									<th class="cell100 column3"><button style="color: #FFFFFF;" id="likeNumber">추천수</button></th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
							<table>
							<tbody>
							<c:forEach var="dto" items="${list }">
								<tr class="row100 body">
									<td class="cell100 column1 titleArea"><a href="${cpath }/board/read/${dto.idxBo}?type=${param.type }&search=${param.search }&vc=true">${dto.title}</a></td>
									<td class="cell100 column2 viewCountArea">${ dto.viewCount}</td>
									<td class="cell100 column3 likeCountArea">${ dto.likeCount}</td>
								</tr>
							</c:forEach>
							</table>
						
					<div class= "sb">
							<form>
								<span >
								<select  name="type">
									<option ${param.type == 'title' ? 'selected' : '' } value="title">제목</option>
									<option ${param.type == 'writer' ? 'selected' : '' } value="writer">글쓴이</option>
									<option ${param.type == 'content' ? 'selected' : '' } value="content">내용</option>
								</select>
								</span>
								
								<span><input type="text" name="search" value="${param.search }" placeholder="검색어를 입력하세요"></span>
                        		<span><input type="submit" value="검색"></span>
                    			 </form>
                    			 
								<c:if test="${login.club == 'Chelsea'}">
								<span style=  "justify-content: space-between; "><a href="${cpath}/board/mylist/${login.nickName}">나의 글</a><a href="${cpath}/board/write">글쓰기</a></span>
								</c:if>
					</div>		
									
						
					</div>
				</div>
			</div>
		</div>
	</div>
		</div>

		<div class="section" id="CHE3">
			<h2>CHE 3</h2>
		</div>
	</div>

<script>
	// 정확도순 뉴스 
	document.getElementById('correctNews').onclick = function(event) {
		document.querySelector('div.news').innerText='' // 내용 비우기
		const url = '${cpath}/api/che/correct' 			// 여기서만 team, type 매개변수 바꿔주면 됨
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
					const newstitle = '<a href=' + newslist.items[i].link + ' target="_blank" style="color:#162E59; font-weight:bold; cursor: pointer;">' 
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
		const url = '${cpath}/api/che/latest' 			// 여기서만 team, type 매개변수 바꿔주면 됨
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
						const newstitle = '<a href=' + newslist.items[i].link + ' target="_blank" style="color:#162E59; font-weight:bold; cursor: pointer;">' 
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