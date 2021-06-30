<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="scroll.jsp" %>
<style>
	.firstSection::before{
		content: "";
        background: url(${cpath}/resources/images/background/ManchesterUnited/4.jpg);
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
        background: url(${cpath}/resources/images/background/ManchesterUnited/2.jpg);
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
        background: url(${cpath}/resources/images/background/ManchesterUnited/3.jpg);
        background-size: cover;
        opacity: 0.5;
        position: absolute;
        top: 0px;
        left: 0px;
        right: 0px;
        bottom: 0px;
	}
</style>

<!-- google charts -->
       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script type="text/javascript">
			const seasonArr = '${seasonArr}';
			const clubNameList = '${clubNameList}';
			
			const score1617 = '${point0}';
			const score1718 = '${point1}';
			const score1819 = '${point2}';
			const score1920 = '${point3}';
			const score2021 = '${point4}';
			
			
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawVisualization);

			function drawVisualization() { 
				var data = google.visualization.arrayToDataTable([
						['Season', 'Liverpool', 'Manchester United', 'Manchester City', 'Chelsea', 'Arsenal' ],
						['2016/2017', +(score1617[1].concat(score1617[2])), +(score1617[5]+score1617[6]), +(score1617[9]+score1617[10]), +(score1617[13]+score1617[14]), +(score1617[17]+score1617[18]) ],
						['2017/2018', +(score1718[1]+score1718[2]), +(score1718[5]+score1718[6]), +(score1718[9]+score1718[10]+score1718[11]), +(score1718[14]+score1718[15]), +(score1718[18]+score1718[19]) ],
						['2018/2019', +(score1819[1]+score1819[2]), +(score1819[5]+score1819[6]), +(score1819[9]+score1819[10]), +(score1819[13]+score1819[14]), +(score1819[17]+score1819[18]) ],
						['2019/2020', +(score1920[1]+score1920[2]), +(score1920[5]+score1920[6]), +(score1920[9]+score1920[10]), +(score1920[13]+score1920[14]), +(score1920[17]+score1920[18]) ],
						['2020/2021', +(score2021[1]+score2021[2]), +(score2021[5]+score2021[6]), +(score2021[9]+score2021[10]), +(score2021[13]+score2021[14]), +(score2021[17]+score2021[18]) ],
						
					]);
				var options = {
						title : 'EPL Club win point',
						curveType: 'function',
						pointSize: 8,
						annotations: {
						    textStyle: {
						      fontName: 'Times-Roman',
						      fontSize: 10,
						      bold: true,
						      italic: true,
						      // The color of the text.
						      color: '#871b47',
						      // The color of the text outline.
						      auraColor: '#d799ae',
						      // The transparency of the text.
						      opacity: 0.8
						    }
						  },
						vAxis: {title: 'Win Point',
							 textStyle: {
						     	color: '#3A066B',
						        fontSize: 17,
								bold: true,
								
						     },
						     titleTextStyle: {
								color: '#3A066B',
								fontSize: 24,
								bold: true
							}
						},
						hAxis: {title: 'Season',
							textStyle: {
						     	color: '#3A066B',
						        fontSize: 17,
								bold: true
						     },
						     titleTextStyle: {
								color: '#3A066B',
								fontSize: 24,
								bold: true
							},
							minorGridlines: {color: '#3A066B', minSpacing: 20}
						}, 
// 						seriesType: 'bars',
						series: {
							0: {lineWidth: 4, color: '#E31B23'},
							1: {lineWidth: 4, color: '#FFE500'},
							2: {lineWidth: 4, color: '#98C5E9'},
							3: {lineWidth: 4, color: '#162E59'},
							4: {lineWidth: 4, color: '#9C824A'},
							
							5: {type: 'point'}
						},
						
						
						
					};
				
				var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
				chart.draw(data, options);
			}
		</script>


	<div id="fullpage">
		<div class="section firstSection" id="MU1">
			<div style="position: absolute; top: 100px;">
				<h1 style="display: inline-block; margin-right: 10px">Manchester United News</h1>
				<input id="correctNews" type="button" value="정확도순" style="display: inline-block; margin-right: 5px">
				<input id="latestNews" type="button" value="최신순" style="display: inline-block;">  <br></br>
				<div class="news">
				</div>
			</div>
		</div>

		<div class="section secondSection" id="MU2">
			<div style="text-align: center; width: 100%; height: 70%">
				<div id="chart_div" style="width:80%; height: 100%; margin: auto;"></div>
			</div>
		</div>

		<div class="section thirdSection" id="MU3">
			<div class="limiter" style="padding-top: 75px; width:1000px; height:800px; color: #F00000;">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head" >
									<th class="cell100 column1" style="background:${clubColor};"><button style="color: #FFFFFF;" id="newNumber" ><h6>Title</h6></button></th>
									<th class="cell100 column2" style="background:${clubColor};"><button style="color: #FFFFFF;" id="viewNumber" ><h6>View</h6></button></th>
									<th class="cell100 column3" style="background:${clubColor};"><button style="color: #FFFFFF;" id="likeNumber"><h6>Like</h6></button></th>
									<th class="cell100 column3" style="background:${clubColor};"><button style="color: #FFFFFF;" id="writer"><h6>Writer</h6></button></th>
									<th class="cell100 column3" style="background:${clubColor};"><button style="color: #FFFFFF;" id="wdate"><h6>Date</h6></button></th>										</tr>
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
					</div>	
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
                    			 
								<c:if test="${login.club == 'Manchester United'}">
								<span style=  "justify-content: space-between; "><a href="${cpath}/board/mylist/${login.nickName}">나의 글</a><a href="${cpath}/board/write">글쓰기</a></span>
								</c:if>
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
		const url = '${cpath}/api/mu/correct' 			// 여기서만 team, type 매개변수 바꿔주면 됨
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
					const newstitle = '<a href=' + newslist.items[i].link + ' target="_blank" style="color:#C70101; font-weight:bold; cursor: pointer;">' 
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
		const url = '${cpath}/api/mu/latest' 			// 여기서만 team, type 매개변수 바꿔주면 됨
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
						const newstitle = '<a href=' + newslist.items[i].link + ' target="_blank" style="color:#C70101; font-weight:bold; cursor: pointer;">' 
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