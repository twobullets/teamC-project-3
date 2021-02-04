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
<title>PT Member Exercise detail</title>
<script src="/resources/Js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function()
	{
		//네비게이션
		$(".topgrid").click(function()
		{
			$(".navicontents").slideToggle(1000);
		});
		
		//상단 뒤로가기
		$(".topback").click(function()
		{
			var m_qr = $("input[name=m_qr]").val();
			var p_no = $("input[name=p_no]").val();
			
			window.location.href = "/Trainer/T-Round?m_qr="+m_qr+"&p_no="+p_no;
		});
		
		//차트 페이지로 이동
		$(".memberchart").click(function()
		{
			var m_qr = $("input[name=m_qr]").val();
			var p_no = $("input[name=p_no]").val();
			
			window.location.href = "/Trainer/T-Chart?m_qr="+m_qr+"&p_no="+p_no;
		});
	});
	
	//운동 입력하는 모달창
	function Exerciseinsert(e_no)
	{	
		//e_no가 null일 경우 insert
		$(".modalchang").css("visibility", "visible");
		$(".modalchang").css("opacity", "1");
		$(".modalnaeyong").show();
		
		//e_no가 not null일 경우 update
		if(e_no != undefined)
		{
			modifyClick = true;
			//넘어온 e_no를 참고해서 수정을 누른 값에 대한 정보 셋팅
			var table = $("#table_"+e_no);
			var Ename = table.find("tr:eq(0)").find("td:eq(0)").text().trim();
			var Eset  = table.find("tr:eq(2)").find("td:eq(0)").text().trim();
			var Ecnt  = table.find("tr:eq(2)").find("td:eq(2)").text().trim();
			var Ekg   = table.find("tr:eq(2)").find("td:eq(4)").text().trim();
			var Etime = table.find("tr:eq(3)").find("td:eq(0)").text().trim();
			var Epart = table.find("tr:eq(3)").find("td:eq(2)").text().trim();
			var Erest = table.find("tr:eq(3)").find("td:eq(4)").text().trim();
			
			//select box 표현
			if(Epart == "어깨")
			{
				Epart = "A";
			}else if(Epart == "가슴")
			{
				Epart = "B";
			}else if(Epart == "등")
			{
				Epart = "C";
			}else if(Epart == "코어")
			{
				Epart = "D";
			}else if(Epart == "하체")
			{
				Epart = "E";
			}else if(Epart == "이두")
			{
				Epart = "F";
			}else if(Epart == "삼두")
			{
				Epart = "G";
			}
			
			$("#e_no").val(e_no);
			$("#e_name").val(Ename);
			$("#e_set").val(Eset);
			$("#e_cnt").val(Ecnt);
			$("#e_kg").val(Ekg);
			$("#e_time").val(Etime);
			$("#e_part").val(Epart);
			$("#e_rest").val(Erest);
		}
		
	}
	//운동 수정하는 모달창 닫는 버튼
	function ExerciseClose()
	{	
		$(".modalnaeyong").hide();
		$(".modalchang").css("visibility", "hidden");
		$(".modalchang").css("opacity", "0");
		location.reload();
	}
	
	//수정할 경우 데이터가 새로 쌓이지 않고 해당 데이터에서 변경되게 하기위한 전역변수
	var modifyClick = false;
	
	function ExerciseInsertOK()
	{
		// 입력 or 수정 시 null 처리
		
		if($("#e_name").val() == "")
		{
			$("#e_name").focus();
			return false;
		}
		if($("#e_set").val() == "")
		{
			$("#e_set").val(0);
		}
		if($("#e_cnt").val() == "")
		{
			$("#e_cnt").val(0);
		}
		if($("#e_kg").val() == "")
		{
			$("#e_kg").val(0);
		}
		if($("#e_time").val() == "")
		{
			$("#e_time").val(0);
		}
		if($("#e_rest").val() == "")
		{
			$("#e_rest").val(0);
		}
		$.ajax
		({
			url:"/Trainer/T-ExerciseAdd",
			type:"post",
			data:$("#Ewrite").serialize(),
			success:function(data)
			{
				if(!modifyClick)
				{
					if(data.e_part == "A")
					{
						data.e_part = "어깨";
					}else if(data.e_part == "B")
					{
						data.e_part = "가슴";
					}else if(data.e_part == "C")
					{
						data.e_part = "등";
					}else if(data.e_part == "D")
					{
						data.e_part = "코어";
					}else if(data.e_part == "E")
					{
						data.e_part = "하체";
					}else if(data.e_part == "F")
					{
						data.e_part = "이두";
					}else if(data.e_part == "G")
					{
						data.e_part = "삼두";
					}
					var output  = " ";
						output += "<table id='table_"+data.e_no+"'>";
						output += "<tr>";
						output += "<td colspan='3'><b>"+data.e_name+"</b></td>";
						output += "<td colspan='3'><button type='button' class='btn btn-default' onclick='Exerciseinsert("+data.e_no+")'>";
						output += "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-pencil-square' viewBox='0 0 16 16'>";
						output += "<path d='M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z'/>";
						output += "<path fill-rule='evenodd' d='M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z'/>";
						output += "</svg></button>";
						output += "</td>";
						output += "</tr>";
						output += "<tr>";
						output += "<td colspan='6' height='1' style='background-color:#f2f2f2'></td>";
						output += "</tr>";
						output += "<tr>";
						output += "<td>"+data.e_set+"</td>";
						output += "<td><span>세트</span></td>";
						output += "<td>"+data.e_cnt+"</td>";
						output += "<td><span>회</span></td>";
						output += "<td>"+data.e_kg+"</td>";
						output += "<td><span>kg</span></td>";
						output += "</tr>";
						output += "<tr>";
						output += "<td>"+data.e_time+"</td>";
						output += "<td><span>분</span></td>";
						output += "<td>"+data.e_part+"</td>";
						output += "<td>&nbsp;</td>";
						output += "<td>"+data.e_rest+"</td>";	
						output += "<td><span>초</span></td>";				
						output += "</tr>";
						output += "<tr>";
						output += "<td colspan='6' height='1' style='background-color:#f2f2f2'></td>";
						output += "</tr>";
						output += "</table>";
					$("#ExerciseArea").prepend(output);
					location.reload();
				}else
				{
					//수정을 누른 table을 찾아서 받아온 data로 변경
					var table = $("#table_"+data.e_no);
						table.find("tr:eq(0)").find("td:eq(0)").html("<b>"+data.e_name+"</b>");
						table.find("tr:eq(2)").find("td:eq(0)").text(data.e_set);
						table.find("tr:eq(2)").find("td:eq(2)").text(data.e_cnt);
						table.find("tr:eq(2)").find("td:eq(4)").text(data.e_kg);
						table.find("tr:eq(3)").find("td:eq(0)").text(data.e_time);
						table.find("tr:eq(3)").find("td:eq(2)").text(data.e_part);
						table.find("tr:eq(3)").find("td:eq(4)").text(data.e_rest);
						
						if(data.e_part == "A")
						{
							table.find("tr:eq(3)").find("td:eq(2)").text("어깨");
						}else if(data.e_part == "B")
						{
							table.find("tr:eq(3)").find("td:eq(2)").text("가슴");
						}else if(data.e_part == "C")
						{
							table.find("tr:eq(3)").find("td:eq(2)").text("등");
						}else if(data.e_part == "D")
						{
							table.find("tr:eq(3)").find("td:eq(2)").text("코어");
						}else if(data.e_part == "E")
						{
							table.find("tr:eq(3)").find("td:eq(2)").text("하체");
						}else if(data.e_part == "F")
						{
							table.find("tr:eq(3)").find("td:eq(2)").text("이두");
						}else if(data.e_part == "G")
						{
							table.find("tr:eq(3)").find("td:eq(2)").text("삼두");
						}
						location.reload();
				}
				$(".modalnaeyong").hide();
				$(".modalchang").css("visibility", "hidden");
				$(".modalchang").css("opacity", "0");
			}
		});
		
	}
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
	background-color: #F2F2F2;
}
::-webkit-scrollbar { display: none; }
.allcontents
{
	width:40%;
	margin:auto;
	background-color: white;
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
.topback
{	
	border:0;
	background: none;
	margin:0;
	padding-bottom:0.01rem;
}
.toplogo
{
	display:inline-block;
	width:80%;
}
.topimg
{
	width:110px;
	height:50px;
	margin:auto;
}
.topgrid
{
	border:0;
	background: none;
	margin:0;
	padding-bottom:0.01rem;
}
.navicontents
{
	border-bottom:1px solid #F2F2F2;
	position:relative;
	font-size: 1.5rem;
	padding-top:1em;
	display: none;
}
a
{
	text-decoration:none;
	color:black;
}
a:hover
{
	color:#288CD2
}
ul
{
	list-style: none;
}
.membercontents
{
	width:100%;
	overflow: auto;
}
.memberprofilimg
{
	border-right:1px solid #F2F2F2;
	border-bottom:1px solid #F2F2F2;
	width:50%;
	height:20vh;
	float:left;
}
.memberprofil
{
	border-bottom:1px solid #F2F2F2;
	width:50%;
	height:20vh;
	float:right;
	font-size: 2.3em;
	padding:0.5em 0.5em;
	overflow: auto;
}
.profilimg
{
	width:130px;
	margin:2em 10em 2em 10em;
}
.memberchart
{
	border-right:1px solid #F2F2F2;
	border-bottom:1px solid #F2F2F2;
	width:50%;
	height:5vh;
	float:left;
	font-size: 2em;
	padding:0.5em 7em;
	cursor:pointer;
	background-color: #F2F2F2;
}
.memberchart:hover
{
	background-color: #506EA5;
	color:white;
}
.memberexercise
{
	width:50%;
	height:5vh;
	float:right;
	font-size: 2em;
	padding:0.5em 7em;
	cursor:pointer;
}
.memberexercise:hover
{
	background-color: #506EA5;
	color:white;
}
.Exercises
{
	clear:both;
	width:100%;
	padding:5em 0;
	display: block;
	text-align:center;
}
.Exercises > input[type=button]
{
	width:80%;
}
#ExerciseArea
{
	clear:both;
	width:100%;
	/* padding:2em 0; */
	display: block;
	text-align:center;
	overflow:auto;
}
#ExerciseArea > table
{
	width:80%;
	margin:0px auto;
	text-align:center;
	font-size:2em;
	margin-bottom:2em;
}
#ExerciseArea table tr:first-child > td:first-child
{
	text-align: left;
	color:#006400;
}
#ExerciseArea table tr:first-child > td:last-child
{
	text-align:right;
}
.modalchang
{
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	opacity: 0;
	visibility: hidden;
	transform: scale(1.1);
	transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s;
}
.modalnaeyong
{
	display:none;
	left:40%;
	top:32%;
	width:30em;
	height:22em;
	position:fixed;
	border-radius:20px;
	background-color: white;
	padding-top:4em;
}
.modalnaeyong > form > table
{
	width:95%;
	height:20vh;
	text-align:center;
	margin:auto;
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
		background-color: white;
	}
	.allcontents
	{
		width:100%;
		/* padding-top: 3em; */
	}
	.topcontents
	{
		height:50px;
	}
	.profilimg
	{
		width:100px;
		margin:1em 5em;
	}
	.memberprofil
	{
		font-size: 1.5em;
		margin:auto;
		overflow:auto;
	}
	.memberchart
	{
		height:45px;
		font-size:1.5em;
		padding:0.8em 5em;
	}
	.memberexercise
	{
		height:45px;
		font-size:1.5em;
		padding:0.8em 5em;
	}
	.modalchang
	{
		width:100%;
	}
	.modalnaeyong
	{
		left:9%;
		top:25%;
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
			<a href="/Trainer/T-List" class="toplogo"><img src="/resources/Images/LOGO.png" class="topimg"></a>
			<button class="topgrid">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-grid-fill" viewBox="0 0 16 16">
				<path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zm8 0A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm-8 8A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm8 0A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3z"/>
				</svg>
			</button>
		</div>
		
		<!-- 네비게이션 div -->
		<div class="navicontents">
			<ul>
				<li>
					<a href="/Trainer/T-List">회원관리</a>
				</li>
				<li>
					<a href="/Trainer/T-Search">회원 조회 및 등록</a>
				</li>
				<li>
					<a href="/Trainer/T-Profile">마이페이지</a>
				</li>
				<li>
					<a href="/Trainer/T-Logout">로그아웃</a>
				</li>
			</ul>
		</div>
		
		<!-- 회원의 상세 데이터 -->
		<div class="membercontents">
			
			<!-- 이미지/왼쪽 div -->
			<div class="memberprofilimg">
				<c:if test="${roundvo.m_realP ne null }">
				<img class="profilimg" src="/resources/MemberImages/${roundvo.m_realP }">
				</c:if>
				<c:if test="${roundvo.m_realP eq null }">
				<img class="profilimg" src="/resources/Images/BlankProfile.png">
				</c:if>
			</div>
			
			<!-- 프로필/오른쪽 div -->
			<div class="memberprofil">
				<table>
					<tr>
						<th>-회원성함</th>
					</tr>
					<tr>
						<td>${roundvo.m_name }</td>
					</tr>
					<tr>
						<th>-전화번호</th>
					</tr>
					<tr>
						<td>${roundvo.m_phone }</td>
					</tr>
					<tr>
						<th>-이메일</th>
					</tr>
					<tr>
						<td>${roundvo.m_email }</td>
					</tr>
				</table>
			</div>
			
			<div class="memberchart">
				통계
			</div>
			
			<div class="memberexercise">
				운동
			</div>
			
			<!-- 운동 상세 기록 부분 -->
			<div class="Exercises">
				<input type="button" value="+" class="btn btn-success" onclick="Exerciseinsert()">
			</div>
			<div id="ExerciseArea">
				<c:if test="${list.size() == 0 }">
					<h1>운동을 시작해주세요!</h1>
				</c:if>
				<c:forEach items="${list }" var="list">
				<table id="table_${list.e_no }">
					<tr>
						<td colspan="3">
							<b>${list.e_name }</b>
						</td>
						<td colspan="3">
							<button type="button" class="btn btn-default" onclick="Exerciseinsert(${list.e_no })">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
									<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
									<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
								</svg>
							</button>
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
		
	</div>
	
	<!-- e_no의 유/무에따라 운동 입력/수정하는 div -->
	<div class="modalchang">
		<div class="modalnaeyong">
			<form id="Ewrite" name="Ewrite" method="post" onsubmit="return ExerciseCheck()">
			<input type="hidden" name="p_no" value="${roundvo.p_no }">
			<input type="hidden" name="m_qr" value="${roundvo.m_qr }">
			<input type="hidden" name="r_no" value="${roundvo.r_no }">
			<input type="hidden" id="e_no" name="e_no" value="0"> <!-- 수정시 넘겨 받은 e_no를 받는 부분 -->
			<table>
				<tr>
					<td colspan="3">
						<input type="text" id="e_name" name="e_name" class="form-control" placeholder="운동명" >
					</td>
				</tr>
				<tr>
					<td><input type="number" id="e_set" name="e_set" class="form-control" placeholder="세트" ></td>
					<td><input type="number" id="e_cnt" name="e_cnt" class="form-control" placeholder="횟수" ></td>
					<td><input type="number" id="e_kg"  name="e_kg"  class="form-control" placeholder="무게" ></td>
				</tr>
				<tr>
					<td><input type="number" id="e_time" name="e_time" class="form-control" placeholder="소요시간" ></td>
					<td>
						<select id="e_part" name="e_part" class="form-select" >	
							<option value="A" selected>어깨</option>
							<option value="B">가슴</option>
							<option value="C">등</option>
							<option value="D">코어</option>
							<option value="E">하체</option>
							<option value="F">이두</option>
							<option value="G">삼두</option>
						</select>
					</td>
					<td><input type="number" id="e_rest" name="e_rest" class="form-control" placeholder="세트간 휴식" ></td>					
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td><input type="button" value="SAVE" class="btn btn-outline-success" onclick="ExerciseInsertOK()"></td>
					<td>&nbsp;</td>
					<td><input type="button" value="CLOSE" class="btn btn-outline-danger" onclick="ExerciseClose()"></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	
</body>
</html>