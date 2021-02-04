<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Member Exercise</title>
<script src="/resources/Js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function()
	{
		$(".topgrid").click(function()
		{
			$(".navicontents").slideToggle(1000);
		});
		
		$(".topback").click(function()
		{
			window.location.href = document.referrer;
		})			
	});
</script>
<style>
@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
body
{
	font-family: 'NanumSquare', sans-serif;
	font-size:70%;
	width:100%;
	height:100vh;
	margin:0;
	padding:0;
	overflow: auto;
	/* background-color: #F2F2F2; */
}
.allcontents
{
	/* border:1px solid black; */
	width:40%;
	margin:auto;
	background-color: white;
	overflow:auto;
}
.topcontents
{
	border-bottom:1px solid #F2F2F2;
	top:0;
	text-align:center;
	width:100%;
	height:5vh;
	display:inline-block;
}
.toplogo
{
	display:inline-block;
	width:90%;
}
.topimg
{
	width:110px;
	height:50px;
	margin:auto;
}
.topback
{	
	border:0;
	background: none;
	margin:0;
	padding-bottom:0.01rem;
}
.topgrid
{
	border:0;
	background: none;
	margin:0;
	padding-bottom:0.01rem;
}
ul
{
	list-style: none;
}
.ExerciseArea
{
	width:100%;
	padding-top:8em;
	display: block;
	text-align:center;
	overflow:auto;
}
.ExerciseList
{
	width:80%;
	margin:3em auto;
	text-align:center;
	font-size:1em;
}
th
{
	background-color: #E8F5FF;
}
tr
{
	border-bottom:1px solid #F2F2F2;
	font-size:2em;
    font-weight: 700;
    width: 20%;
}
.subtitle
{
	width: 100%;
    height: 3vh;
    text-align: center;
    font-size: 2em;
    margin-bottom: 1em;
    margin-top: -3em;
    font-weight: 800;
}
.angle-up
{
	position:fixed;
	right:31%;
	bottom:2%;
	color:black;
	font-size: 1rem;
}
span
{
	font-size:0.5em;
}
@media screen and (max-width:787px)
{
	body
	{
		width:100%;
	}
	.allcontents
	{
		width:100%;
		padding-top: 3em;
	}
	.topcontents
	{
		height:6vh;
	}
	.topback
	{
		position:absolute;
		left:3%;
		top:6%;
	}
	.angle-up
	{
		right:3%;
		bottom:2;
	}
}
</style>
</head>
<body>
	<!-- 전체 컨텐츠를 감싼 div -->
	<div class="allcontents">
		
		<!-- 상단 로고와 네비게이션 버튼 -->
		<div class="topcontents">
			<button class="topback">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
				</svg>
			</button>
			<a href="/Member/M-List?m_qr=${vo.m_qr }" class="toplogo"><img src="/resources/Images/LOGO.png" class="topimg"></a>
		</div>

		<div class="ExerciseArea">
			<div class="subtitle">
				${vo.r_ct}회차-${vo.r_date }
			</div>
			<c:if test="${list.size() == 0 }">
				<h1>운동을 시작해주세요!</h1>
			</c:if>
			<c:forEach items="${list }" var="list">
			<table id="table_${list.e_no }" class="ExerciseList">
				<tr>
					<td colspan="6">
						<b>${list.e_name }</b>
					</td>
				</tr>
				<tr>
					<td colspan="6" height='1' style='background-color:#f2f2f2'></td>
				</tr>
				<tr>
					<td>${list.e_set }</td>
					<td><span>세트</span></td>
					<td>${list.e_cnt }</td>
					<td><span>회</span></td>
					<td>${list.e_kg }</td>
					<td><span>kg</span></td>
				</tr>
				<tr>
					<td>${list.e_time }</td>
					<td><span>분</span></td>
					<td>
						<c:choose>
							<c:when test="${list.e_part eq 'A' }">어깨</c:when>
							<c:when test="${list.e_part eq 'B' }">가슴</c:when>
							<c:when test="${list.e_part eq 'C' }">등</c:when>
							<c:when test="${list.e_part eq 'D' }">코어</c:when>
							<c:when test="${list.e_part eq 'E' }">하체</c:when>
							<c:when test="${list.e_part eq 'F' }">이두</c:when>
							<c:when test="${list.e_part eq 'G' }">삼두</c:when>
						</c:choose>
					</td>
					<td>&nbsp;<!-- 간격을 맞추기 위해 임의로 넣은 것 --></td>
					<td>${list.e_rest }</td>
					<td><span>초</span></td>				
				</tr>
				<tr>
					<td colspan="6" height='1' style='background-color:#f2f2f2'></td>
				</tr>
			</table>
			</c:forEach>
		</div>

		<!-- 누르면 상단으로 -->
		<a class="angle-up" href="#top">[TOP]</a>
		
	</div>
</body>
</html>