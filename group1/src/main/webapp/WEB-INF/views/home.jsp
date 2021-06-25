<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="scroll.jsp"%>
<style>
#s_left{
	widows: 100px;
	height: 300px;
	float: left;
}

#contents {
	width: 1000px;
	height: 900px;
	float: left;
	font-size: small;
}

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
	width: 100px;
	font-weight: bold;
	font-size: 15px;
}
.hidden {
	display: none;
}

.title{
	font-weight: bold;
	font-size: 20px;
	color: blue;
	margin-top: 50px;
	margin-bottom: 10px;
}
</style>


<main>
<div id="fullpage">
	<div class="section" id="MAIN1" style="margin-left: 30px; margin-right: 30px;">
		<div id="s_left">	
			<div class="title">[유로 2020] 조별리그 순위표</div>
				<nav>
					<ul>
						<li><a class="A">A</a></li>
						<li><a class="B">B</a></li>
						<li><a class="C">C</a></li>
						<li><a class="D">D</a></li>
						<li><a class="E">E</a></li>
						<li><a class="F">F</a></li>
					</ul>
				</nav>
				<div class="list main"></div>
				<div class="A main hidden"></div>
				<div class="B main hidden"></div>
				<div class="C main hidden"></div>
				<div class="D main hidden"></div>
				<div class="E main hidden"></div>
				<div class="F main hidden"></div>
				
				<div class="title">[유로 2020] 득점왕을 향한 치열한 경쟁! </div>
				<div class="score_rank"></div>
		</div>
		
		<div id="contents" class="euroNews">
			<h1>EURO 2020 News</h1><br><br>
		</div>
		
	</div>


	<div class="section active" id="MAIN1" style="padding-left: 50px;">
			<div class="slide" id="slide1" data-anchor="slide1" style="text-align: center;">
				<div class="intro">
					<img src="${cpath }/resources/images/background/1.jpg" style="width: 80%; height: 500px;">
				</div>
			</div>
			<div class="slide active" id="slide2" data-anchor="slide2">
				<h1>Slide 2</h1>
			</div>
			<div class="slide" id="slide3" data-anchor="slide3">
				<h1>Slide 3</h1>
			</div>

		</div>

	<div class="section" id="MAIN3">
		<h2>HOME 3</h2>
	</div>
</div>
</main>

<script>
//유로 관련 뉴스 띄우기
const url = '${cpath}/api/euro/correct' 			// 여기서만 team, type 매개변수 바꿔주면 됨
		const opt = {
			method: 'GET',	
		}
		fetch(url, opt)				
		.then(resp => resp.json())		
		.then(json => {
			const eurolist = JSON.parse(json)
			console.log(eurolist)
			
			if(eurolist == null) {
				document.getElementById('news').innerText = '오류가 발생하였습니다.'
			}
			else {
				for(let i = 0; i < eurolist.items.length; i++){
					const child = document.createElement('div')		// 제목
					const child2 = document.createElement('div')	// 내용
					const newstitle = '<a href=' + eurolist.items[i].link + ' target="_blank" font-weight:bold; cursor: pointer;">' 
					+ '<span style="font-weight:bold;">' + (i+1) + '</span>' + '&nbsp&nbsp&nbsp[' + eurolist.items[i].title + ']</a>'
					const content = eurolist.items[i].description  + 
					'(' + eurolist.items[i].pubDate.slice(0, -5) + ')' + '<br>' +  '<br>'
					child.innerHTML = newstitle
					child2.innerHTML = content
					document.querySelector('div.euroNews').appendChild(child) 	// 제목 출력
					document.querySelector('div.euroNews').appendChild(child2)	// 내용 미리보기 출력
				}
			} 
		})
</script>



<script>
// 유로 득점 순위
$.ajax({
	  headers: {'X-Auth-Token': 'c5798934a44c482a822a642801a9e298'}, 
	  type: 'GET',
	  url: 'https://api.football-data.org/v2/competitions/EC/scorers',
	  dataType: 'json',
	}).done(function(score) {
		 for(let i=0; i<5; i++){
			 const score_child = document.createElement('div')
			 const rowScore = (i+1) + ' | ' + score.scorers[i].player.name + '(' + score.scorers[i].player.nationality + ') | ' +
			 score.scorers[i].player.position + ' | ' + score.scorers[i].numberOfGoals + '골<br>'
			 score_child.innerHTML = rowScore
			 document.querySelector('div.score_rank').appendChild(score_child)
		 }
		 
		 
	})
</script>

<script>
//조별 순위 리스트 기본 화면
$.ajax({
  headers: {'X-Auth-Token': 'c5798934a44c482a822a642801a9e298'}, 
  type: 'GET',
  url: 'https://api.football-data.org/v2/competitions/EC/standings',
  dataType: 'json',
}).done(function(response) {
	document.querySelector('div.list').innerText=''	 
	
	  for(let j = 0; j < response.standings[0].table.length; j++) {  
	  	  const child = document.createElement('div')
	  	  const rowRank = response.standings[0].table[j].position + ' | ' +
	  	  '<img src="' +  response.standings[0].table[j].team.crestUrl + '" height="20" width"20">' + '| ' +
	  	  response.standings[0].table[j].team.name + ' | ' +
	  	  response.standings[0].table[j].won + ' | ' +
	  	  response.standings[0].table[j].draw + ' | ' +
	  	  response.standings[0].table[j].lost + ' | ' +
	  	  response.standings[0].table[j].goalDifference + ' | ' +
	  	  response.standings[0].table[j].points + '<br>'
	  	  child.innerHTML = rowRank
	  	  document.querySelector('div.list').appendChild(child)
	  }
})
</script>

<script>
document.querySelectorAll('nav > ul > li > a').forEach(a => a.onclick = function(event) {
	const className = event.target.className	// A,B,C,D,E,F 조
	document.querySelectorAll('.main').forEach(div => div.classList.add('hidden'))
	document.querySelector('div.' + className).classList.remove('hidden')
	console.log(className)
	
	switch(className){ // A라면  div class="A"에 순위 출력
	case "A":
		var i = 0;	
		var divGroup = "div." + className;
		break;
	case "B":		
		var i = 1;	// const 사용시 already defined 에러 
		var divGroup = "div." + className;
		break;
	case "C":
		var i = 2;
		var divGroup = "div." + className;
		break;
	case "D":
		var i = 3;
		var divGroup = "div." + className;
		break;
	case "E":
		var i = 4;
		var divGroup = "div." + className;
		break;
	case "F":
		var i = 5;
		var divGroup = "div." + className;
		break;
	}
	
	//유로 조별 순위 출력
	$.ajax({
	  headers: {'X-Auth-Token': 'c5798934a44c482a822a642801a9e298'}, 
	  type: 'GET',
	  url: 'https://api.football-data.org/v2/competitions/EC/standings',
	  dataType: 'json',
	}).done(function(response) {
	  document.querySelector(divGroup).innerText=''	  
	  for(let j = 0; j < response.standings[i].table.length; j++) { // j = 0~3 
		  const child = document.createElement('div')
		  const rowRank = response.standings[i].table[j].position + ' | ' +
		  '<img src="' +  response.standings[i].table[j].team.crestUrl + '" height="20" width"20">' + '| ' +
		  response.standings[i].table[j].team.name + ' | ' +
		  response.standings[i].table[j].won + ' | ' +
		  response.standings[i].table[j].draw + ' | ' +
		  response.standings[i].table[j].lost + ' | ' +
		  response.standings[i].table[j].goalDifference + ' | ' +
		  response.standings[i].table[j].points + '<br>'
		  child.innerHTML = rowRank
		  document.querySelector(divGroup).appendChild(child)
	  }
	})
})
</script>

</body>
</html>