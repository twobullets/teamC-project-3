<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Member Search</title>
<!-- <script src="/resources/Js/jquery-3.5.1.min.js"></script> -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

	$(document).ready(function()
	{
		//네비게이션
		$(".topgrid").click(function()
		{
			$(".navicontents").slideToggle(1000);
		});
		
		//뒤로가기
		$(".topback").click(function()
		{
			window.location.href = document.referrer;
		});
		
		//바뀐 이미지 바로 변경		
		$("#fileUp").change(function()
		{
			LoadImg(this);
		});
	});
	
	//파일 이름 넣어주는 작업
	$(document).ready(function()
	{
		var fileTarget = $('.filebox .upload-hidden');
		
		fileTarget.on('change', function()
		{
			if(window.FileReader)
			{
				var filename = $(this)[0].files[0].name;
			}else
			{
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			
			$(".filebox").find('.upload-name').val(filename);
		});
	});
	
	//PT 등록
	function insertPt(m_qr,m_name){
		var m_qr = m_qr;
		var m_name = m_name;		
		var result = confirm(m_name+"님의 PT등록을 진행하시겠습니까?");
		if(result){
			$.ajax({	    	
	           type : "POST",
	           url : "/Trainer/InsertPT",
	           data : {"m_qr":m_qr},
	           success : function(){ 
	        	   alert("등록이 완료되었습니다");
	        	   /* 리스트로 이동 */
	        		location.href = "/Trainer/T-List" ;
	           },
	           error:function(){
	               alert("등록 오류 다시 시도해 주세요");
	           }
	       });
		} else
		{
			alert("PT등록이 취소되었습니다.");
		}
	}
	
	//PT 재등록
	function updatePt(m_qr, m_name, p_no)
	{
		var p_no   = p_no;
		var m_qr   = m_qr;
		var m_name = m_name;		
		var result = confirm(m_name+"님의 PT등록을 진행하시겠습니까?");
		if(result){
			$.ajax({	    	
	           type : "POST",
	           url : "/Trainer/UpdatePT",
	           data : {"p_no":p_no,"m_qr":m_qr},
	           success : function(){ 
	        	   alert("등록이 완료되었습니다");
	        	   /* 리스트로 이동 */
	        		location.href = "/Trainer/T-List" ;
	           },
	           error:function(){
	               alert("등록 오류 다시 시도해 주세요");
	           }
	       });
		} else
		{
			alert("PT등록이 취소되었습니다.");
		}
	}
	
	//회원등록 모달창 띄우기
	function accountmake()
	{
		$(".accountMakeContainer").css("visibility", "visible");
		$(".accountMakeContainer").css("opacity", "1");
		/* $(".acountMakeBox").toggle(); */
	}	

	//취소 눌렀을때
	function QRclose()
	{
		/* $(".accountMakeBox").toggle(); */
		$(".accountMakeContainer").css("visibility", "hidden");
		$(".accountMakeContainer").css("opacity", "0");
	}
	
	//파일 불러오기
	function LoadImg(value)
	{
		if(value.files && value.files[0])
		{
			var reader = new FileReader();
			reader.onload = function(e)
			{
				$("#profilimg").attr('src',e.target.result);
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
	
	//QR코드 생성
	function qr_code_create(){
	    var formData = new FormData($("#accountMake")[0]);
	    if($("#m_name").val()==""||$("#m_phone").val()==""||$("#m_email").val()=="")
	    {
	    	alert("정보를 전부 기입해 주십시오");
	    	return false;
	    }
	    alert("발급이 시작됩니다. 확인 버튼을 누르시고 발급 완료 메시지가 뜰때까지 기다려주세요");
	    $.ajax({
	           type : "POST",
	           url : "/Trainer/QRcreate",
	           data : formData,
				contentType:false,
				processData:false,
	           success : function(){                     
	                alert("발급이 완료되었습니다");
	        		$(".accountMakeBox").toggle();
	        		$(".accountMakeContainer").css("visibility", "hidden");
	        		$(".accountMakeContainer").css("opacity", "0");
	        		window.location.reload();
	           },
	           error:function(){
	               alert("이메일, 전화번호는 중복될 수 없습니다")
	           }
	       });
	}
	
	//QR코드 재전송
	function reQR(m_qr,m_email,m_name){
		var m_qr = m_qr;
		var m_email= m_email;		
		var m_name= m_name;		
		var result = confirm(m_name+"님에게 QR코드를 전송하시겠습니까?");
		if(result){
			alert("발급이 시작됩니다. 확인 버튼을 누르시고 발급 완료 메시지가 뜰때까지 기다려주세요");
			$.ajax({	    	
	           type : "POST",
	           url : "/Trainer/reQR",
	           data : {"m_qr":m_qr,"m_email":m_email,"m_name":m_name},
	           success : function(){ 
	        	   alert("전송이완료되었습니다");
	           },
	           error:function(){
	               alert("전송오류 다시 시도해 주세요");
	           }
	       });
		} else
		{
			alert("QR재발급이 취소되었습니다.");
		}
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
.allcontents
{
	/* border:1px solid black; */
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
	border:1px solid #F2F2F2;
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

.searchContainer
{
	font-size:1.5em;
}
#searchChang
{
	width:200px;
	display:inline;
}
.form-select
{
	width:100px;
	display: inline;
}
.searchBox
{
	margin:1em 0em;
	text-align:center;
}
.searchResult
{
	text-align:center;
}
.searchResultTable
{
	width:100%;
	text-align:center;
	font-size:1em;
	margin:auto;
}
#accountMakeTable
{
	width:100%; 
	cellpadding:1em; 
	cellspacing:1em; 	
	text-align:center;
}
#accountMakeTable td
{
	padding:0.3em;
}
.accountMakeContainer
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
.accountMakeBox
{
	/* display:none; */
	left:32.5%;
	top:20%;
	width:40em;
	height:33em;
	position:fixed;
	background-color: white;
	font-size:1.5em;
	border-radius: 20px;
}
#profilimg
{
	width:11em; 
	height:11em;
}
.angle-up
{
	position:fixed;
	right:31%;
	bottom:2%;
	color:black;
	font-size: 1rem;
}
.filebox input[type="file"]
{
	position:absolute;
	width:1px;
	height:1px;
	padding:0;
	margin:-1px;
	overflow:hidden;
	clip:rect(0,0,0,0);
	border:0;
}
.filebox label
{
	display:inline-block;
	padding: .5em .75em;
	color:#999;
	font-size:inherit;
	line-height:normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor:pointer;
	border:1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}
.filebox .upload-name
{
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
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
	.searchResultTable
	{
		width:100%;
	}
	.searchResultTable > thead > tr > th:first-child
	{
		width:20%;
	}
	.searchResultTable > tbody > tr > td:first-child
	{
		width:20%;
	}
	.accountMakeContainer
	{
		width:100%;
	}
	.accountMakeBox
	{
		top:13%;
		left:8%;
		width:85%;
	}
	#searchChang
	{
		width:150px;
	}
	.angle-up{
		right:3%;
		bottom:2;
	}
}
</style>
</head>
<body>
	<!-- t_no -->
	<input type="hidden" value="${sessionScope.t_no }">
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
		
		<div class="searchContainer">
		
			<form id="searchReason" method="get" action="/Trainer/SearchMember">
				<div class="searchBox" style="font-size:1.5em;">
					<select class="form-select" name="searchType">
						<option value="name">이름</option>
						<option value="phone">전화번호</option>
					</select>
					<input type="text" class="form-control" id="searchChang" name="keyword">
					<input type="submit" class="btn btn-primary" id="searchButton" value="조회">
					<button type="button" class="btn btn-primary" id="accountMakeButton" onclick="accountmake()">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
							<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
							<path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
						</svg>
					</button>
				</div>
			</form>
			
			<div class="searchResult">
				<table class="searchResultTable">
					<thead>
						<tr>
							<th>이름</th>
							<th>전화번호</th>
							<th colspan="2">PT등록현황</th>
						</tr>
							<tr><td colspan="4">&nbsp;</td></tr>
					</thead>
					<tbody>
						 <c:forEach items="${list}" var="item" varStatus="status">
							<tr>
								<td><c:out value="${item.m_name }"/></td>
								<td><c:out value="${item.m_phone }"/></td>
								<td>
								<c:if test="${item.ptState eq null }">
									<input type="button" class="btn btn-primary" id="ptMakeButton" onclick="insertPt('${item.m_qr}','${item.m_name}')" value="&nbsp;&nbsp;PT등록&nbsp;&nbsp;">
								</c:if>
								<c:if test="${item.ptState eq 'A' }">
									<b>PT진행중</b>
								</c:if>
								<c:if test="${item.ptState eq 'C' }">
									<input type="button" class="btn btn-warning" id="ptMakeButton" onclick="updatePt('${item.m_qr }','${item.m_name }',${item.p_no })" value="PT재등록">
								</c:if>
								</td>
								<td>	
									<input type="button" class="btn btn-outline-dark" id="QRremakeButton" value="QR재발급" onclick="reQR('${item.m_qr}','${item.m_email}','${item.m_name}')">
								</td>
							</tr>
							<tr><td colspan="4">&nbsp;</td></tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>	
		<div class="accountMakeContainer">
			<div class="accountMakeBox" >
			<form id="accountMake" name="accountMake" enctype="multipart/form-data" action="/Trainer/QRcreate" method="post">
				<table id="accountMakeTable">
					<!-- 결과를 가운데 정렬하고 싶어서 넣은 tr -->
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><h2>신규 회원 등록</h2></td>
					</tr>
					<tr>
						<td>
							<input type="text" class="form-control" name="m_name" id="m_name" placeholder="이름">
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" class="form-control" name="m_phone" id="m_phone" placeholder="전화번호">
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="text" class="form-control" name="m_email" id="m_email" placeholder="이메일">
						</td>
					</tr>
					<tr>
						<td>
							<img src='/resources/Images/BlankProfile.png'  id='profilimg'>
							<div class="filebox">
								<input class="upload-name" value="파일선택" disabled="disabled">
								<label>사진 첨부<input type='file' name='fileUp' id='fileUp' class="upload-hidden"></label>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" class="btn btn-outline-danger" value="취소" onclick="QRclose();">
							<input type="button" class="btn btn-outline-primary" value="QR발급" onclick="qr_code_create()">
						</td>
					</tr>
				</table>
			</form>	
			</div>
		</div>
		
		<!-- 누르면 상단으로 -->
		<a class="angle-up" href="#top">[TOP]</a>
		
	</div>
</body>
</html>