<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trainer Main</title>
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
			location.href = "/";
		});
				
		
		$(".idTab").click(function()
		{
			 location.reload();
		});
		
		$(".pwTab").click(function()
		{
			 location.href="/Trainer/T-Pw";
		});
	});
	
	// 아이디 값 받고 출력하는 ajax
	function findId(){
		
		$.ajax({
			url:"/Trainer/T-IdOK",
			type:"POST",
			data: "t_email=" + $("#t_email").val(),
			success:function(result){
				//alert("result::"+typeof result);
				if(result == ""){
					$(".idResultContainer").css("visibility", "visible");
					$(".idResultContainer").css("opacity", "1");
					$('#idResultHere').text("회원 정보를 확인해주세요!");	
				} else  {
					$(".idResultContainer").css("visibility", "visible");
					$(".idResultContainer").css("opacity", "1");
				
					var fir = result.slice(0,4);	//결과값 앞에 4자리 잘라서 fir에 담기
					
					var sec = result.slice(4,Number.MAX_VALUE);//결과값 앞에 4자리 자르고 남은 부분 sec에 담기
					var secS = "";
					for(var i=0; i<sec.length; i++){//sec의 길이만큼 for문 돌려서 *로 채워서 secS에 담기
						secS += "*";
					}
					
					$('#idResultHere').text(fir+secS); //fir와 secS더한값 출력
					
				}
			}
		});
	}
	

	function idResultOK()
	{
		//alert("QR코드가 등록하신 이메일 주소로 발송되었습니다.");
		//$(".accountMakeBox").toggle();
		$(".idResultContainer").css("visibility", "hidden");
		$(".idResultContainer").css("opacity", "0");
	}
	
	
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
.allcontents
{
	width:40%;
	height:100vh;
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

.tab
{
	display:flex;
	width:100%;
	height:5%;
	margin-bottom:3em;
	
}
.idTab
{
	margin:0;
	width:50%;
	text-align:center;
	font-size:1.5em;
	border: 0.1em #F2F2F2 solid;
	border-bottom:none;
	cursor:pointer;
	padding:0.5em 3em;
}
.idTab:hover
{
	background-color: #506EA5;
	color:white;
}
.pwTab
{
	margin:0;
	padding:0;
	width:50%;
	text-align:center;
	font-size:1.5em;
	border: 0.1em #F2F2F2 solid;
	cursor:pointer;
	padding:0.5em 3em;
	background-color: #F2F2F2;
}
.pwTab:hover
{
	background-color: #506EA5;
	color:white;
}
.id_find
{
	margin:auto;
}
.id_find table
{
	width:90%;
	text-align:center;
	margin:auto;
	font-size:1.5em;
}
#idFindButton
{
	width:100%;
}
#idResultHere
{
	font-size:15px; 
	font-weight:bold;
}
.idResultContainer
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
.idResultBox
{
	/* display:none;  */
	left:40%;
	top:35%;
	width:25em;
	height:13em;
	position:fixed;
	border-radius:10px;
	background-color: white;
	font-size:1.5em;
}
#idResultTable
{
	width:100%; 
	cellpadding:1em; 
	cellspacing:1em; 	
	text-align:center;
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
	.tab
	{
		height:45px;
	}
	.idResultContainer
	{
		width:100%;
	}
	.idResultBox
	{
		left:8.5%;
		top:30%;
		width:83%;
	}
	#idResultTable
	{
		
	}
	.pwTab
	{
		padding:0.5em 1em;
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
			<a href="/" class="toplogo"><img src="/resources/Images/LOGO.png" class="topimg"></a>
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
					<a href="/Trainer/T-Login">로그인</a>
				</li>
				<li>
					<a href="/Trainer/T-Join">회원가입</a>
				</li>
			</ul>
		</div>
		
		<!-- 상단 탭 -->
		<div class="tab">
			<div class="idTab">내 아이디 찾기</div>
			<div class="pwTab">새 비밀번호 발급</div>
		</div>
		
		<!-- 아이디 찾는 부분 -->
		<div class="id_find">
			<form id="id_find" name="id_find" method="post" action="/Trainer/T-IdOK">
			<table>
				<tr>
					<td><h1>아이디 찾기</h1></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="이름" id="t_name" name="t_name" class="form-control" required></td>
				</tr>
				<tr>
					<td>
						<input type="text" placeholder="이메일 ex)john@ptm.com" id="t_email" name="t_email"  class="form-control" required>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" class="btn btn-primary" id="idFindButton"  value="찾기" onclick="findId()" >
					</td>
				</tr>
			</table>
			</form>
		</div>
		
		<!-- 아이디 찾은 결과 나오는 Modal -->
		<div class="idResultContainer">
			<div class="idResultBox" >
			<form id="idResult" name="idResult" method="post" action="#">
				<table id="idResultTable">
					<!-- 결과를 가운데 정렬하고 싶어서 넣은 tr -->
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td height="100" id="idResultHere" align="center" name="idResult">
						</td>
					</tr>
					<tr>
						<td><input type="button" class="btn btn-primary" id="idOkButton" value="확인" onclick="idResultOK()"> </td>
					</tr>
				</table>
			</form>	
			</div>
		</div>
		
	</div>
</body>
</html>