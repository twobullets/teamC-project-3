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
			window.history.back();
		});
		
		$(".profileTab").click(function()
		{
			location.href="/Trainer/T-Profile";
		});
		$(".accountTab").click(function()
		{
			 location.reload();
		});
		
/* 		$('#selfOut').click(function() 
		{ 
			var result = confirm("정말로 탈퇴하시겠습니까?"); 
			if(result) 
			{ 	
				alert("이용해주셔서 감사합니다.")
				location.href="/Trainer/T-Login";
			} else { 
				alert("취소되었습니다.")
			} 
		}); */
		
	});
	
/* 	function modifyAccount()
	{
		$("#phone").html("<input type='text' class='form-control' >");
		$("#email").html("<input type='text' class='form-control' placeholder='ex)john@ptm.com'>");
		$("#modifyAccountButton").attr("value","저장").attr("id","saveAccountButton").attr("onclick","saveAccount()");
	}
	 */
/* 	function saveAccount()
	{
		$("#phone").html("010-1234-5679");
		$("#email").html("Hong123@naver.com");
		$("#saveAccountButton").attr("value","수정").attr("id","modifyAccountButton").attr("onclick","modifyAccount()");
	}
	  */
	 
	 
	function modifyAccount(t_phone,t_email)
	{
		var t_phone = t_phone;
		var t_email = t_email;
		//alert(t_phone);
		//alert(t_email);
		$("#phone").html("<input type='tel' class='form-control' name='t_phone' value='"+t_phone+"'>");
		$("#email").html("<input type='email' class='form-control' name='t_email' value='"+t_email+"'>");
		$("#modifyAccountButton").attr("value","저장").attr("id","saveAccountButton").attr("onclick","saveAccount()");
	}
	function saveAccount()
	{
		
	 	var t_phone = $("input[name=t_phone]").val();
		var t_email = $("input[name=t_email]").val();

		if(t_phone=="")
		{
			alert('휴대폰 번호를 입력해 주세요');
		}
		if(t_email=="")
		{
			alert('이메일을 입력해 주세요');
		}
		else{
 		$.ajax({	    	
	           type : "POST",
	           url : "/Trainer/ModifyOK",
	           data : {"t_phone":t_phone,"t_email":t_email},
	           success : function(){ 
	        	   alert("변경이 완료되었습니다");
	        	   location.reload();
	           },
	           error:function(){
	               alert("변경오류 형식을 확인해주세요");
	           }
	      	 }); 
		}
	}
	var fa = false; 
	var fb = false; 
	function t_pwCheck()
	{
		var pw = $("#pw").val();     
		var sc = ["!","@","#","$","%","^","&","+","="];
		var check_sc= 0;
        for(var i=0;i<sc.length;i++)
        {
	         if(pw.indexOf(sc[i]) != -1)
	         {
	          check_sc = 1;
	         }
        }       
	     if(check_sc == 0 )
	     {
	     	$(".pw_message").html("!,@,#,$,%,^,&,+,= 등의 특수문자가 들어가 있지 않습니다.").css("color","red");
	     	$(".pw_message").css("display","inline");
	     	fa= false;
	     }else
	     {
	    	 $(".pw_message").html("").css("display","none");
	     	fa= true;
	     }
	     if(pw.length < 8 || pw.length > 16)
	     {
	      	fb = false;
	     }
	     else
	     {
	       	 fb = true;
	     }
	 }
	function PwChange()
	{
		if(fa==false)
		{
			alert("특수문자를 1개이상 넣어주세요");
			document.getElementById('pw').focus();
			return false
		}
		if(fb==false)
		{
			alert("비밀번호 길이는 8자리 이상 16자리 이하로 설정해주세요");
			document.getElementById('pw').focus();
			return false
		}
	}
	function Out()
	{
		if(confirm("회원을 탈퇴하시겠습니까?")==true)
		{
			location.href="/Trainer/Out";
		}
		else
		{
			return;
		}
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
.tab
{
	display:flex;
	width:100%;
	height:5%;
	margin-bottom:3em;
}
.profileTab
{
	margin:0;
	padding-top:0.5em;
	width:50%;
	text-align:center;
	font-size:1.5em;
	border: 0.1em #F2F2F2 solid;
	cursor:pointer;
	background-color: #F2F2F2;
}
.profileTab:hover
{
	background-color: #506EA5;
	color:white;
}
.accountTab
{
	margin:0;
	padding-top:0.5em;
	width:50%;
	text-align:center;
	font-size:1.5em;
	border: 0.1em #F2F2F2 solid;
	border-bottom:none;
	cursor:pointer;
	
}
.accountTab:hover
{
	background-color: #506EA5;
	color:white;
}
.trainerAccountTable
{
	width:80%;
	margin:auto;
	font-size:1.5em;
	
}
input[type=password]
{
	font-family: "Geogia";
	&::placeholder {font-family: "NanumSquare";}
}
#pw
{
	width:150px;
	display: inline;
	font-color: black;
}
#modifyAccountButton
{
	width:100%;
}
#saveAccountButton
{
	width:100%;
}
#selfOut
{
	width:100%;
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
		
		<div class="tab">
			<div class="profileTab">프로필 관리</div>
			<div class="accountTab">계정 관리</div>
		</div>
		
		<div class="trainerAccount">
			<table class="trainerAccountTable">
				<tr>
					<th>아이디</th>
					<td>${vo.t_id}</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr style="height:0.1em;"/>
					</td>
				</tr>
				<tr class="tjoin">
					<th>비밀번호</th>
					<td>
						*************
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr style="height:0.1em;"/>
					</td>
				</tr>
				<tr>
					<th>비밀번호 변경</th>
					<td>
						<form id="frm" method="post" action="/Trainer/PwChange" onsubmit="return PwChange()">
							<input type="password" class="form-control" id="pw" name="t_pw" oninput="t_pwCheck()" >
							<input type="submit" class="btn btn-primary" value="변경">
						</form>
						<span class="pw_message"></span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr style="height:0.1em;"/>
					</td>
				</tr>
				<tr>
					<th>휴대폰 번호</th>
					<td id="phone" name="t_phone">${vo.t_phone}</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr style="height:0.1em;"/>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td id="email" name="t_phone">${vo.t_email}</td>
				</tr>
				<tr>
					<td>
						<hr style="height:0.05em; color:white"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" class="btn btn-primary" id="modifyAccountButton" value="수정" onclick="modifyAccount('${vo.t_phone}','${vo.t_email}')">
					</td>
				</tr>
				<tr>
					<td>
					<hr style="height:0.0005em; color:white"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" class="btn btn-danger" id="selfOut" onclick="Out()">회원탈퇴</button>
					</td>
				</tr>
			</table>
		</div>
		
	</div>
</body>
</html>