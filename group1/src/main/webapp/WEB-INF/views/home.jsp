<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="scroll.jsp"%>
<style>
nav {
	display: flex;
	justify-content: flex-start;
}

nav>ul {
	display: flex;
	left: 20px;
	list-style: none;
	padding: 0;
	width: 20%;
	justify-content: space-between;
}

nav>ul>li {
	text-align: center;
	font-weight: bold;
	font-size: 15px;
	margin-right: 30px;
}
.hidden {
	display: none;
}

.title{	/* 0625.jsh */
	padding: 0;
	margin: 0;
	font-weight: bold;
	font-size: 20px;
	color: #3A0640;
	margin-top: 20px;
	margin-bottom: 10px;
}

li:hover{
	color: blue;
	text-decoration: underline;
}
.winTeam{
	color: red;
	font-weight: bold;
}

table {
	height: 100px;
}

th {
	font-weight: bold;
}

.secondSection::before{
		content: "";
        background: url(${cpath}/resources/images/background/league.png);
        background-size: cover;
        opacity: 0.5;
        position: absolute;
        top: 0px;
        left: 0px;
        right: 0px;
        bottom: 0px;
/*         0629 bcg */
        z-index: -1;
	}
	
</style>


<main>
<div id="fullpage">
		<div class="section active" id="MAIN1" style="padding-top: 3%; position: relative;">
			<div class="slide " id="slide1" data-anchor="slide1" style="text-align: center;">
					<img src="${cpath }/resources/images/background/wallEx.jpg" style="">
			</div>
			<div class="slide " id="slide2" data-anchor="slide2">
				<div style="text-align: center;">
					<img src="${cpath }/resources/images/background/wall22.jpg" style="width: ; height: ;">
				</div>
			</div>
			<div class="slide " id="slide3" data-anchor="slide3">
				<div style="text-align: center;">
					<img src="${cpath }/resources/images/background/wall33.jpg" style="">
				</div>
			</div>
			
		</div>

	<div class="section secondSection" id="MAIN2" style="margin-left: 0px; padding-left: 5%; padding-top: 2%;">
		<div class="mainflex">
			<div id="s_left">
				<div class="title">[유로 2020] 조별리그 순위표</div>
				<div>
					<ul class="pagination">
						<li class="page-item"><a class="A page-link" href="#">A조</a>
						</li>
						<li class="page-item"><a class="B page-link" href="#">B조</a>
						</li>
						<li class="page-item"><a class="C page-link" href="#">C조</a>
						</li>
						<li class="page-item"><a class="D page-link" href="#">D조</a>
						</li>
						<li class="page-item"><a class="E page-link" href="#">E조</a>
						</li>
						<li class="page-item"><a class="F page-link" href="#">F조</a>
						</li>
					</ul>
				</div>

				<table class="table table-hover">
					<thead>
						<tr class="table" style="background-color: #3A066B !important; color: #ffff;">
							<th scope="col">순위</th>
							<th scope="col">국가</th>
							<th scope="col">승</th>
							<th scope="col">무</th>
							<th scope="col">패</th>
							<th scope="col">골득실</th>
							<th scope="col">승점</th>
						</tr>
					</thead>
					<tbody class="list main" style="background-color: #ffff;">
					</tbody>
					<tbody class="A main hidden" style="background-color: #ffff;">
					</tbody>
					<tbody class="B main hidden" style="background-color: #ffff;">
					</tbody>
					<tbody class="C main hidden" style="background-color: #ffff;">
					</tbody>
					<tbody class="D main hidden" style="background-color: #ffff;">
					</tbody>
					<tbody class="E main hidden" style="background-color: #ffff;">
					</tbody>
					<tbody class="F main hidden" style="background-color: #ffff;">
					</tbody>
				</table>

				<div class="title">[유로 2020] 득점왕을 향한 치열한 경쟁!</div>
				<table class="table table-hover">
					<thead style="background-color: #3A066B !important; color: #ffff;">
						<tr>
							<th scope="col">순위</th>
							<th scope="col">선수명</th>
							<th scope="col">국가</th>
							<th scope="col">득점수</th>
						</tr>
					</thead>
					<tbody id="score_tbody" style="background-color: #ffff;">
					</tbody>
				</table>
			</div>


			<div id="contents" class="euroNews"
				style="height: 700px; padding-top: 70px">
				<button type="button" class="btn-EPL btn btn-dark" id="correctNews">정확도순 뉴스</button> 
				<button type="button" class="btn-EPL btn btn-dark" id="latestNews">최신순 뉴스</button>
				
				<!-- news부분 jsh 0630 -->
				<div class="list-group">
					<a id="link0" href=""
						class="list-group-item list-group-item-action flex-column align-items-start"
						target="_blank">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="euro_title0 mb-1" style="font-weight: bold;"></h5>
							<small class="euro_time0 text-muted"></small>
						</div>
						<br>
						<p class="euro_des0 mb-1"></p>
					</a> 
					
					<a id="link1" href=""
						class="list-group-item list-group-item-action flex-column align-items-start"
						target="_blank">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="euro_title1 mb-1" style="font-weight: bold;"></h5>
							<small class="euro_time1 text-muted"></small>
						</div>
						<br>
						<p class="euro_des1 mb-1"></p>
					</a> 
					
					<a id="link2" href=""
						class="list-group-item list-group-item-action flex-column align-items-start"
						target="_blank">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="euro_title2 mb-1" style="font-weight: bold;"></h5>
							<small class="euro_time2 text-muted"></small>
						</div>
						<br>
						<p class="euro_des2 mb-1"></p>
					</a> 
					
					<a id="link3" href=""
						class="list-group-item list-group-item-action flex-column align-items-start"
						target="_blank">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="euro_title3 mb-1" style="font-weight: bold;"></h5>
							<small class="euro_time3 text-muted"></small>
						</div>
						<br>
						<p class="euro_des3 mb-1"></p>
					</a> 
					
					<a id="link4" href=""
						class="list-group-item list-group-item-action flex-column align-items-start"
						target="_blank">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="euro_title4 mb-1" style="font-weight: bold;"></h5>
							<small class="euro_time4 text-muted"></small>
						</div>
						<br>
						<p class="euro_des4 mb-1"></p>
					</a>
				</div>
			</div>

		</div>
		</div>
		

		
<!-- 	<div class="section" id="MAIN3">
		<h2>HOME 3</h2>
	</div> -->
</div>
</main>

<script>
// 유로 토너먼트 일정 띄우기 (현재시간과 경기시간 비교 통해서 출력) jsh 06.25
let today = new Date(); 
let RoundOf16 = new Date(2021, 06, 30, 4, 0, 0);  // 지남
let QuarterFinal = new Date(2021, 07, 4, 4, 0, 0);
let SemiFinal = new Date(2021, 07, 8, 4, 0, 0);
let Final = new Date(2021, 07, 12, 4, 0, 0);
let stage
let title

console.log(today > RoundOf16) 	  // T 
console.log(today > QuarterFinal) // F 떠야함

switch(true){ 
case today < RoundOf16: 
	stage = 4;			
	title = "16강"
	break;
case today < QuarterFinal:
	stage = 5;
	title = "8강"
	break;
case today < SemiFinal:
	stage = 6;
	title = "준결승"
	break;
default:
	stage = 7;
	title = "결승"
}



$.ajax({
	  headers: {'X-Auth-Token': 'c5798934a44c482a822a642801a9e298'}, 
	  type: 'GET',
	  url: 'https://api.football-data.org/v2/competitions/EC/matches?matchday=' + stage,
	  dataType: 'json',
	}).done(function(schedule) {
		
		document.getElementById('stageTitle').innerHTML = title
		
		for(let i=0; i < schedule.matches.length; i++){
			const schedule_child = document.createElement('div')
			
			let korDate = new Date(schedule.matches[i].utcDate) // 한국 시간으로 변경
			let strDate = korDate.toString()
			
			// 종료된 경기는 점수 표시
			if(schedule.matches[i].status == "FINISHED" && schedule.matches[i].score.fullTime.homeTeam > schedule.matches[i].score.fullTime.awayTeam ){ 
				// 홈팀 이겼을 때
				var content = '<span class="winTeam">' + schedule.matches[i].homeTeam.name + '</span>' + ' vs ' + schedule.matches[i].awayTeam.name +
				' ( ' + '<span class="winTeam">' + schedule.matches[i].score.fullTime.homeTeam + '</span>' + ' : ' + schedule.matches[i].score.fullTime.awayTeam + ' ) 종료'
			}
			else if(schedule.matches[i].status == "FINISHED" && schedule.matches[i].score.fullTime.homeTeam < schedule.matches[i].score.fullTime.awayTeam){
				// 어웨이팀 이겼을 때
				var content = schedule.matches[i].homeTeam.name + ' vs ' + '<span class="winTeam">' + schedule.matches[i].awayTeam.name  + '</span>' +
				' ( ' + schedule.matches[i].score.fullTime.homeTeam+ ' : ' + '<span class="winTeam">' + schedule.matches[i].score.fullTime.awayTeam + '</span>'  + ' ) 종료'
			}
			else {
				// 경기 전
				var content = schedule.matches[i].homeTeam.name + ' vs ' + schedule.matches[i].awayTeam.name +
			' ( ' + strDate.substring(0,10) + ', ' + strDate.substring(16,21) + ' )'
			}
			schedule_child.innerHTML = content
			document.querySelector('div.schedule').appendChild(schedule_child) 
		}

		 
	})
</script>

<script>
//유로 관련 뉴스 띄우기 jsh
const url = '${cpath}/api/euro/correct' 			// 여기서만 team, type 매개변수 바꿔주면 됨
		const opt = {
			method: 'GET',	
		}
		fetch(url, opt)				
		.then(resp => resp.json())		
		.then(json => {
			const eurolist = JSON.parse(json)
			
			for(let i=0; i<5; i++){		
				let title = eurolist.items[i].title
				let des = eurolist.items[i].description
				let time = eurolist.items[i].pubDate.slice(0, -5)
				let href = eurolist.items[i].link
				
				document.querySelector('h5.euro_title'+i).innerHTML = title
				document.querySelector('p.euro_des'+i).innerHTML = des
				document.querySelector('small.euro_time'+i).innerHTML = time	
				document.getElementById('link'+i).href = href	
			}
		})
</script>

<script>
//정확도순 뉴스 
	document.getElementById('correctNews').onclick = function(event) {
		const url = '${cpath}/api/euro/correct'		// 여기서만 team, type 매개변수 바꿔주면 됨
		const opt = {
			method: 'GET',	
		}
		fetch(url, opt)				
		.then(resp => resp.json())		
		.then(json => {
			const eurolist = JSON.parse(json)
			
			for(let i=0; i<5; i++){		
				let title = eurolist.items[i].title
				let des = eurolist.items[i].description
				let time = eurolist.items[i].pubDate.slice(0, -5)
				let href = eurolist.items[i].link
				
				document.querySelector('h5.euro_title'+i).innerHTML = title
				document.querySelector('p.euro_des'+i).innerHTML = des
				document.querySelector('small.euro_time'+i).innerHTML = time	
				document.getElementById('link'+i).href = href	
			}
		})
	}
	
	//최신순 뉴스 
	document.getElementById('latestNews').onclick = function(event) {
		const url = '${cpath}/api/euro/latest' 			// 여기서만 team, type 매개변수 바꿔주면 됨
		const opt = {
			method: 'GET',	
		}
		fetch(url, opt)				
		.then(resp => resp.json())		
		.then(json => {
			const eurolist = JSON.parse(json)
			
			for(let i=0; i<5; i++){		
				let title = eurolist.items[i].title
				let des = eurolist.items[i].description
				let time = eurolist.items[i].pubDate.slice(0, -5)
				let href = eurolist.items[i].link
				
				document.querySelector('h5.euro_title'+i).innerHTML = title
				document.querySelector('p.euro_des'+i).innerHTML = des
				document.querySelector('small.euro_time'+i).innerHTML = time	
				document.getElementById('link'+i).href = href	
			}
		})
	}
</script>


<script>
// 유로 득점 순위
$.ajax({
	  headers: {'X-Auth-Token': 'c5798934a44c482a822a642801a9e298'}, 
	  type: 'GET',
	  url: 'https://api.football-data.org/v2/competitions/EC/scorers',
	  dataType: 'json',
	}).done(function(score) {
		 
		const tbody = document.getElementById('score_tbody')
		for(let i=0; i<5; i++){
			const row = document.createElement("tr");
			const col1 = document.createElement("td");
			col1.innerHTML = (i+1)
			const col2 = document.createElement("td");
			col2.innerHTML = score.scorers[i].player.name
			const col3 = document.createElement("td");
			col3.innerHTML = score.scorers[i].player.nationality
			const col4 = document.createElement("td");
			col4.innerHTML = score.scorers[i].numberOfGoals
			row.appendChild(col1); row.appendChild(col2); row.appendChild(col3); row.appendChild(col4);
			tbody.appendChild(row)
		}
	})
</script>

<script>

</script>

<script>
//조별 순위 리스트 기본 화면 jsh
  $.ajax({
  headers: {'X-Auth-Token': 'c5798934a44c482a822a642801a9e298'}, 
  type: 'GET',
  url: 'https://api.football-data.org/v2/competitions/EC/standings',
  dataType: 'json',
}).done(function(response) {
	 	let tbody_list = document.querySelector('tbody.list')

		for(let j = 0; j < response.standings[0].table.length; j++) {
		    let row = document.createElement("tr");
		    let col1 = document.createElement("td");	
		    let col2 = document.createElement("td");
		    let col3 = document.createElement("td");	
		    let col4 = document.createElement("td");	
		    let col5 = document.createElement("td");	
		    let col6 = document.createElement("td");	
		    let col7 = document.createElement("td");
			col1.innerHTML = response.standings[0].table[j].position
			col2.innerHTML = '<img src="' +  response.standings[0].table[j].team.crestUrl + '" height="20" width"20">' 
			 + response.standings[0].table[j].team.name
			col3.innerHTML = response.standings[0].table[j].won
			col4.innerHTML = response.standings[0].table[j].draw
			col5.innerHTML = response.standings[0].table[j].lost
			col6.innerHTML = response.standings[0].table[j].goalDifference
			col7.innerHTML = response.standings[0].table[j].points
			row.appendChild(col1); row.appendChild(col2); row.appendChild(col3); row.appendChild(col4); row.appendChild(col5);
			row.appendChild(col6); row.appendChild(col7);
			tbody_list.appendChild(row)
			}
	})
</script>

<!-- <script>
const pageLink =  document.querySelectorAll('.page-link');
pageLink.forEach(pageLink => pageLink.onclick = function(event){
   const className = event.target.className[0]
   document.querySelector('.page-item .'+ className).classList.add('active')   
})
</script> -->


<script>
//  클릭시 해당 조 순위 출력 jsh
	const pageLink =  document.querySelectorAll('.page-link');
	pageLink.forEach(pageLink => pageLink.onclick = function(event) {
	const className = event.target.className[0]
	document.querySelectorAll('.main').forEach(div => div.classList.add('hidden'))
	document.querySelector('tbody.' + className).classList.remove('hidden')
	
	
	switch(className){ // A라면  div class="A"에 순위 출력
	case "A":
		var i = 0;	
		var tbodyGroup = "tbody." + className;
		break;
	case "B":		
		var i = 1;	// const 사용시 already defined 에러 
		var tbodyGroup = "tbody." + className;
		break;
	case "C":
		var i = 2;
		var tbodyGroup = "tbody." + className;
		break;
	case "D":
		var i = 3;
		var tbodyGroup = "tbody." + className;
		break;
	case "E":
		var i = 4;
		var tbodyGroup = "tbody." + className;
		break;
	case "F":
		var i = 5;
		var tbodyGroup = "tbody." + className;
		break;
	}
	
	//유로 조별 순위 출력
	$.ajax({
	  headers: {'X-Auth-Token': 'c5798934a44c482a822a642801a9e298'}, 
	  type: 'GET',
	  url: 'https://api.football-data.org/v2/competitions/EC/standings',
	  dataType: 'json',
	}).done(function(response) {
		
		$('.main').empty();
		
		let tbody_group = document.querySelector(tbodyGroup)
		for(let j = 0; j < response.standings[i].table.length; j++) {
		    let row = document.createElement("tr");
		    let col1 = document.createElement("td");	
		    let col2 = document.createElement("td");
		    let col3 = document.createElement("td");	
		    let col4 = document.createElement("td");	
		    let col5 = document.createElement("td");	
		    let col6 = document.createElement("td");	
		    let col7 = document.createElement("td");
			col1.innerHTML = response.standings[i].table[j].position
			col2.innerHTML = '<img src="' +  response.standings[i].table[j].team.crestUrl + '" height="20" width"20">' 
			 + response.standings[i].table[j].team.name
			col3.innerHTML = response.standings[i].table[j].won
			col4.innerHTML = response.standings[i].table[j].draw
			col5.innerHTML = response.standings[i].table[j].lost
			col6.innerHTML = response.standings[i].table[j].goalDifference
			col7.innerHTML = response.standings[i].table[j].points
			row.appendChild(col1); row.appendChild(col2); row.appendChild(col3); row.appendChild(col4); row.appendChild(col5);
			row.appendChild(col6); row.appendChild(col7);
			tbody_group.appendChild(row)
		}
	})
})
</script>

</body>
</html>