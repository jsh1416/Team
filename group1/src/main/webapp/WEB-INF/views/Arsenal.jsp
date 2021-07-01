<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="scroll.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 0629 bcg -->
<style>
	.firstSection::before{
		content: "";
        background: url(${cpath}/resources/images/background/Arsenal/4.png);
        background-size: cover;
        opacity: 0.5;
        position: absolute;
        top: 0px;
        left: 0px;
        right: 0px;
        bottom: 0px;
        z-index: -1; /* 팀별페이지에서만 추가 */
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
	table {
	height: 100px;
	}

	th {
	font-weight: bold;
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
		<div class="section firstSection" id="ARS1">
			<div class="mainflex">
				<div id="s_left">
					<div class="btn-EPL alert alert-dismissible alert-danger" style="color:#ffff; width: 318px; padding: 0; margin-bottom:20px; text-align: center;">
					  <button type="button" data-bs-dismiss="alert"></button>
					  <strong style="font-size: xx-large;">MATCHDAY 1</strong>
					</div>
				
					<!-- homeTeam 정보-->
					<div class="card border-dark mb-3" style="max-width: 25rem;">
					  <div class="card-header">HOME TEAM</div>
					  <div class="card-body">
					    <h4 class="homeName card-title">
					    
					    </h4>
					    <p class="homeInfo card-text"></p>
					  </div>
					</div>
					
					
					<!-- awayTeam 정보  jsh-->
					<div class="card border-dark mb-3" style="max-width: 25rem;">
					  <div class="card-header">AWAY TEAM</div>
					  <div class="card-body">
					    <h4 class="awayName card-title"></h4>
					    <p class="awayInfo card-text"></p>
					  </div>
					</div>
				</div>
				
				<div id="contents" class="News"
					style="height: 700px; padding-top: 70px">
					<button type="button" class="btn-EPL btn btn-dark" id="correctNews">정확도순 뉴스</button> 
					<button type="button" class="btn-EPL btn btn-dark" id="latestNews">최신순 뉴스</button>
					
					<!-- news부분 jsh 0630 -->
					<div class="list-group">
						<a id="link0" href=""
							class="list-group-item list-group-item-action flex-column align-items-start"
							target="_blank">
							<div class="d-flex w-100 justify-content-between">
								<h5 class="title0 mb-1" style="font-weight: bold;"></h5>
								<small class="time0 text-muted"></small>
							</div>
							<br>
							<p class="des0 mb-1"></p>
						</a> 
						
						<a id="link1" href=""
							class="list-group-item list-group-item-action flex-column align-items-start"
							target="_blank">
							<div class="d-flex w-100 justify-content-between">
								<h5 class="title1 mb-1" style="font-weight: bold;"></h5>
								<small class="time1 text-muted"></small>
							</div>
							<br>
							<p class="des1 mb-1"></p>
						</a> 
						
						<a id="link2" href=""
							class="list-group-item list-group-item-action flex-column align-items-start"
							target="_blank">
							<div class="d-flex w-100 justify-content-between">
								<h5 class="title2 mb-1" style="font-weight: bold;"></h5>
								<small class="time2 text-muted"></small>
							</div>
							<br>
							<p class="des2 mb-1"></p>
						</a> 
						
						<a id="link3" href=""
							class="list-group-item list-group-item-action flex-column align-items-start"
							target="_blank">
							<div class="d-flex w-100 justify-content-between">
								<h5 class="title3 mb-1" style="font-weight: bold;"></h5>
								<small class="time3 text-muted"></small>
							</div>
							<br>
							<p class="des3 mb-1"></p>
						</a> 
						
						<a id="link4" href=""
							class="list-group-item list-group-item-action flex-column align-items-start"
							target="_blank">
							<div class="d-flex w-100 justify-content-between">
								<h5 class="title4 mb-1" style="font-weight: bold;"></h5>
								<small class="time4 text-muted"></small>
							</div>
							<br>
							<p class="des4 mb-1"></p>
						</a>
					</div>
				</div>

		</div>
		</div>

	<div class="section secondSection" id="ARS2">
			<div style="text-align: center; width: 100%; height: 70%">
				<div id="chart_div" style="width:80%; height: 100%; margin: auto;"></div>
			</div>
	</div>

		<div class="section thirdSection" id="ARS3">
				<div class="limiter" style="padding-top: 75px; width:1000px; height:800px; color: #F00000;">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head" >
									<th class="cell100 column1" style="background:${clubColor};"><button style="color: #FFFFFF;" id="newNumber" ><h6>Title</h6></button></th>
									<th class="cell100 column2" style="background:${clubColor};"><a href="${cpath }/4?param=viewOrder#thirdPage" style="color: #FFFFFF;"><h6>View</h6></a></th>
									<th class="cell100 column3" style="background:${clubColor};"><a href="${cpath }/4?param=likeOrder#thirdPage" style="color: #FFFFFF;"><h6>Like</h6></a></th>
									<th class="cell100 column3" style="background:${clubColor};"><button style="color: #FFFFFF;" id="writer"><h6>Writer</h6></button></th>
									<th class="cell100 column3" style="background:${clubColor};"><a href="${cpath }/4?param=newOrder#thirdPage" style="color: #FFFFFF;"><h6>Date</h6></a></th>		
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll" style="margin-top:50px"  >
							<table>
							<tbody>
							<c:forEach var="dto" items="${list }">
								<tr class="row100 body">
									<td class="cell100 column1 titleArea"><a href="${cpath }/board/read/${dto.idxBo}?type=${param.type }&search=${param.search }&vc=true">
									${fn:length(dto.title) gt 10 ? fn:substring(dto.title, 0, 10) : dto.title }
									${fn:length(dto.title) gt 10 ? '...' : ''}</a></td>
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

<script>
// 해당팀 다음 경기 정보 불러오기 jsh
$.ajax({
	  headers: {'X-Auth-Token': 'c5798934a44c482a822a642801a9e298'}, 
	  type: 'GET',
		url: 'https://api.football-data.org/v2/competitions/PL/matches?matchday=1',
	  dataType: 'json',
	}).done(function(matchday) {
		let stop = true
		let isHome = true
		const color = '${clubColor}';
		const clubName = '${clubName}';
		
		for(let i = 0; i < matchday.matches.length; i++) { // 팀 고유 id를 받아와서 비교
			if(matchday.matches[i].homeTeam.id == 57 || matchday.matches[i].awayTeam.id == 57){
				matchday.matches[i].homeTeam.id == 57 ? isHome=true : isHome=false // 해당팀이 홈팀인지 어웨이팀인지 구분
				
				if(isHome){
					var homename = '<img src="'+cpath+'/resources/images/logo/${clubName}.png">'
						+ '<span style="color: ' + color + ';">' + matchday.matches[i].homeTeam.name + '</span>'
					var awayname = matchday.matches[i].awayTeam.name
				}
				else{
					var homename = matchday.matches[i].homeTeam.name
					var awayname = '<img src="'+cpath+'/resources/images/logo/${clubName}.png">'
						+ '<span style="color: ' + color + ';">' + matchday.matches[i].awayTeam.name + '</span>'
				}
				
				let status = matchday.matches[i].status == 'SCHEDULED' ? ' 예정' : ' 종료'
				let utcDate = matchday.matches[i].utcDate.substring(0,10)
				
				document.querySelector('h4.homeName').innerHTML = homename
				document.querySelector('p.homeInfo').innerHTML = utcDate + status
				document.querySelector('h4.awayName').innerHTML = awayname
				stop = false
			}
			if(stop == false) break;
		}
		 
	})
</script>


<script>
//해당팀 관련 뉴스 띄우기 jsh
const url = '${cpath}/api/ars/correct' 			// 여기서만 team, type 매개변수 바꿔주면 됨
		const opt = {
			method: 'GET',	
		}
		fetch(url, opt)				
		.then(resp => resp.json())		
		.then(json => {
			let newslist = JSON.parse(json)
			
			for(let i=0; i<5; i++){		
				let title = newslist.items[i].title
				let des = newslist.items[i].description
				let time = newslist.items[i].pubDate.slice(0, -5)
				let href = newslist.items[i].link
				
				document.querySelector('h5.title'+i).innerHTML = title
				document.querySelector('p.des'+i).innerHTML = des
				document.querySelector('small.time'+i).innerHTML = time	
				document.getElementById('link'+i).href = href	
			}
		})
</script>


<script>
//정확도순 뉴스 
document.getElementById('correctNews').onclick = function(event) {
	const url = '${cpath}/api/ars/correct'		// 여기서만 team, type 매개변수 바꿔주면 됨
	const opt = {
		method: 'GET',	
	}
	fetch(url, opt)				
	.then(resp => resp.json())		
	.then(json => {
		let newslist = JSON.parse(json)
		
		for(let i=0; i<5; i++){		
			let title = newslist.items[i].title
			let des = newslist.items[i].description
			let time = newslist.items[i].pubDate.slice(0, -5)
			let href = newslist.items[i].link
			
			document.querySelector('h5.title'+i).innerHTML = title
			document.querySelector('p.des'+i).innerHTML = des
			document.querySelector('small.time'+i).innerHTML = time	
			document.getElementById('link'+i).href = href	
		}
	})
}
	
//최신순 뉴스 
document.getElementById('latestNews').onclick = function(event) {
	const url = '${cpath}/api/ars/latest' 			// 여기서만 team, type 매개변수 바꿔주면 됨
	const opt = {
		method: 'GET',	
	}
	fetch(url, opt)				
	.then(resp => resp.json())		
	.then(json => {
		let newslist = JSON.parse(json)
		
		for(let i=0; i<5; i++){		
			let title = newslist.items[i].title
			let des = newslist.items[i].description
			let time = newslist.items[i].pubDate.slice(0, -5)
			let href = newslist.items[i].link
			
			document.querySelector('h5.title'+i).innerHTML = title
			document.querySelector('p.des'+i).innerHTML = des
			document.querySelector('small.time'+i).innerHTML = time	
			document.getElementById('link'+i).href = href	
		}
	})
}
</script>

</body>
</html>