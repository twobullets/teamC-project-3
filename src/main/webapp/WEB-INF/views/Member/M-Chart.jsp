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
<title>Member Chart</title>
<script src="/resources/Js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function()
	{
		//네비게이션
		$(".topgrid").click(function()
		{
			$(".navicontents").slideToggle(1000);
		});
		
		//운동 페이지로 이동
		$(".memberexercise").click(function()
		{
			var tno = $("input[name=t_no]").val();
			var pno = $("input[name=p_no]").val();
			var mqr = $("input[name=m_qr]").val();
			
			window.location.href = "/Member/M-Round?t_no="+tno+"&p_no="+pno+"&m_qr="+mqr;
		});
		
		//상단 뒤로가기
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
	background-color: #F2F2F2;
}
::-webkit-scrollbar { display: none; }
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
.tinfo
{
	width:100%; 
	height:20vh;
	margin-bottom:3em;
    text-align: center;
}
.chbutton, .exbutton
{
	border:1px solid #F2F2F2;
}
.select
{
	width: 100%	;
    text-align: center;
    height: 3em;
    font-size: 1.5vh;
    margin-top: 2em;
    margin-bottom:-1.8em;
}
.tdlist
{
    padding-top: 2em;
}
.memberchart
{
	border-right:1px solid #F2F2F2;
	/* border-bottom:1px solid #F2F2F2 */
	width:50%;
	height:5vh;
	float:left;
	font-size: 2em;
	padding:0.5em 7em;
	cursor:pointer;
}
.memberchart:hover
{
	background-color: #506EA5;
	color:white;
}
.memberexercise
{
	border-bottom:1px solid #F2F2F2;
	width:50%;
	height:5vh;
	float:right;
	font-size: 2em;
	padding:0.5em 7em;
	cursor:pointer;
	background-color: #F2F2F2;
}
.memberexercise:hover
{
	background-color: #506EA5;
	color:white;
}
.list:hover
{
	background-color:blue;
	cursor:pointer;
}
.Charts
{
	/* border: 1px solid black; */
	clear:both;
	width:100%;
	margin-top:5em;
}
.Charts table
{
	width:90%;
	height:50vh;
	margin:auto;
	font-size: 1.8em;
	font-weight:bold;
}
.Charts table > tr:last-child > td
{
	text-align:right;
}
#charts1
{
	width:100%;
	height:10vh;
	box-sizing: border-box;
	clear:both;
}
#charts2
{
	width:100%;
	height:10vh;
	box-sizing: border-box;
	clear:both;
}
#charts3
{
	width:100%;
	height:10vh;
	box-sizing: border-box;
	clear:both;
}
.ExerciseChart
{
	margin-top:10em;
	clear:both;
	padding-bottom:10em;
}
.ExerciseChart table
{
	width:90%;
	height:20vh;
	font-size: 1.8em;
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
	.memberchart{
		font-size:1.5em;
		padding:0.5em 5em;
	}
	.memberexercise{
		font-size:1.5em;
		padding:0.5em 5em;
	}
	.Charts table
	{
		font-size: 1.5em;
	}
	.ExerciseChart table
	{
		font-size:1.5em;
	}
	.angle-up{
		right:3%;
		bottom:2;
	}
}
</style>
<script src="//www.google.com/jsapi"></script>
<script>

	//첫번째 차트
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic1);
	function drawBasic1()
	{
		//체중
		var kg = $("input[name=kg]").val();
		
		if(kg == 0)
		{
			document.getElementById('charts1').innerHTML = '<b>트레이너에게 체중 입력을 요청해주세요</b>';
			
		}else
		{
			var data = google.visualization.arrayToDataTable([
				['', ''],
				['', Number(kg)]
			]);
		
			var options = {
				chartArea: {width: '100%'},
				hAxis:
				{
					title: '',
					minValue: 0,
					maxValue: 205
		        },
		        vAxis:
		        {
					title: '',
		        }
			};
		
			var chart = new google.visualization.BarChart(document.getElementById('charts1'));
			chart.draw(data, options);
		}
	}
	
	//두번째 차트
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic2);
	function drawBasic2()
	{
		//근골격량
		var bone = $("input[name=bone]").val();

		if(bone == 0)
		{
			document.getElementById('charts2').innerHTML = '<b>트레이너에게 근골격량 입력을 요청해주세요</b>';
			
		}else
		{
			var data = google.visualization.arrayToDataTable([
				['', ''],
				['', Number(bone)]
			]);
		
			var options = {
				chartArea: {width: '100%'},
				hAxis:
				{
					title: '',
					minValue: 0,
					maxValue: 170
		        },
		        vAxis:
		        {
					title: '',
		        }
			};
		
			var chart = new google.visualization.BarChart(document.getElementById('charts2'));
			chart.draw(data, options);
		}
	}
	
	//세번째 차트
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic3);
	function drawBasic3()
	{
		//체지방량
		var fat = $("input[name=fat]").val();
		
		if(fat == 0)
		{
			document.getElementById('charts3').innerHTML = '<b>트레이너에게 체지방량 입력을 요청해주세요</b>';
			
		}else
		{
			var data = google.visualization.arrayToDataTable([
				['', ''],
				['', Number(fat)]
			]);
		
			var options = {
				chartArea: {width: '100%'},
				hAxis:
				{
					title: '',
					minValue: 0,
					maxValue: 520
		        },
		        vAxis:
		        {
					title: '',
		        }
			};
		
			var chart = new google.visualization.BarChart(document.getElementById('charts3'));
			chart.draw(data, options);
		}
	}

</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    
    //파이형 차트 
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() 
      {
    	var P1 = $("input[name=Apart]").val();
  		var P2 = $("input[name=Bpart]").val();
  		var P3 = $("input[name=Cpart]").val();
  		var P4 = $("input[name=Dpart]").val();
  		var P5 = $("input[name=Epart]").val();
  		var P6 = $("input[name=Fpart]").val();
  		var P7 = $("input[name=Gpart]").val();
  		if(P1 == 0 && P2 == 0 && P3 == 0 && P4 == 0 && P5 == 0 && P6 == 0 && P7 == 0)
  		{
  			document.getElementById('piechart').innerHTML = '<b>운동을 시작하세요</b>';
  			
  		}else{
  			var data = google.visualization.arrayToDataTable([
  		        ['Task', 'Count Ex'],
  				['어깨', Number(P1)],
  				['가슴', Number(P2)],
  				['등',  Number(P3)],
  				['코어', Number(P4)],
  				['하체', Number(P5)],
  				['이두', Number(P6)],
  				['삼두', Number(P7)]
  		        ]);

  		        var options = {
  		  			chartArea: {width: '100%', height:'300'}
  		        };

  		        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

  		        chart.draw(data, options);
  		        
  		}
      }
      
  		$(window).resize(function()
  		{ 
  			if(this.resizeTO) clearTimeout(this.resizeTO);
  			this.resizeTO = setTimeout(function()
  				{ $(this).trigger('resizeEnd'); 
  				}, 00)
  		}); // redraw graph when window resize is completed
  		
  		$(window).on('resizeEnd', function() 
		{
			drawVisualization(); 
		});      
    </script>
</head>
<body>
	<!-- t_no/p_no/m_qr -->
	<input type="hidden" name="p_no" value="${m_ptVO.p_no }">
	<input type="hidden" name="t_no" value="${m_ptVO.t_no }">
	<input type="hidden" name="m_qr" value="${m_ptVO.m_qr }">

	<!-- 인바디 값들 체중(kg)/근골격량(bone)/체지방량(fat) -->
	<input type="hidden" name="kg"   value="${m_ptVO.p_kg }">
	<input type="hidden" name="bone" value="${m_ptVO.p_bone }">
	<input type="hidden" name="fat"  value="${m_ptVO.p_fat }">
	
	<!-- 운동 자극 부위 -->
	<input type="hidden" name="Apart" value="${exvo.A }">
	<input type="hidden" name="Bpart" value="${exvo.B }">
	<input type="hidden" name="Cpart" value="${exvo.C }">
	<input type="hidden" name="Dpart" value="${exvo.D }">
	<input type="hidden" name="Epart" value="${exvo.E }">
	<input type="hidden" name="Fpart" value="${exvo.F }">
	<input type="hidden" name="Gpart" value="${exvo.G }">
	
	<!-- 전체 컨텐츠를 감싼 div -->
	<div class="allcontents">
		
		<!-- 상단 로고와 네비게이션 버튼 -->
		<div class="topcontents">
			<button class="topback">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
				</svg>
			</button>
			<a href="/Member/M-List?m_qr=${m_ptVO.m_qr }" class="toplogo"><img src="/resources/Images/LOGO.png" class="topimg"></a>
		</div>
		
		<div class="memberchart">
			통계
		</div>
		
		<div class="memberexercise">
			운동
		</div>
		
		<!-- 인바디 차트 -->
		<div class="Charts">
			<table>
				<tr>
					<td colspan="2">회원님의 인바디</td>
				</tr>
				<tr>
					<td>체중</td>
					<td>[표준] 85-115</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="charts1">
							
						</div>
					</td>
				</tr>
				<tr>
					<td>근골격량</td>
					<td>[표준] 90-110</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="charts2">
							
						</div>
					</td>
				</tr>
				<tr>
					<td>체지방량</td>
					<td>[표준] 80-160</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="charts3">
							
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" height='1' style='background-color:#cccccc'></td>
				</tr>
			</table>
		</div>
		
		<!-- 운동 기록 차트 -->
		<div class="ExerciseChart">
			<table>
				<tr>
					<td colspan="2" height='1' style='background-color:#cccccc'></td>
				</tr>
				<tr>
					<td colspan="2" class="tdlist">
						 <div id="piechart"></div>
					</td>									
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${m_ptVO.p_comment eq null }"><td colspan="2"><b>등록된 comment가 없습니다.</b></td></c:when>
						<c:when test="${m_ptVO.p_comment ne null }">
							<td>트레이너 comment : </td>
							<td>
								<c:out value='${m_ptVO.p_comment }'/>
							</td>
						</c:when>
					</c:choose>
				</tr>
				<tr>
					<td colspan="2" height='1' style='background-color:#cccccc'></td>
				</tr>
			</table>
		</div>
		
		<!-- 누르면 상단으로 -->
		<a class="angle-up" href="#top">[TOP]</a>
		
	</div>
</body>
</html>