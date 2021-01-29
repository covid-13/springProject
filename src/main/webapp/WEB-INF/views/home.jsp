<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<c:import url="common/menubar.jsp"/>
	
	<script>
		$(function(){
			var msg = "<%= request.getAttribute("msg") %>";
			if(msg != "null"){
				alert(msg);
			}
		});
	</script>
	
	<h1 align="center">게시글 TOP 5 목록</h1>
	<table align="center" border="1" cellspacing="0" width="700" id="tb">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
				<th>첨부파일</th>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	
	
	<script>
		$(function(){
			topList();
			
			//setInterval : 지정한 시간(밀리세컨즈 1/1000초 5000이면 5초)
			//              시간만큼 지정한 작업을 계속수행하라는 의미
			setInterval(function(){
				topList();
			}, 5000);
			
		});
		
		function topList(){
			$.ajax({
				url:"topList.do",	
				dataType:"json",
				success:function(data){
					
					$tableBody = $("#tb tbody");
					$tableBody.html("");
					
					console.log(data);
					
					// 1번 방법.
					for(var i in data){
						
						var $tr = $("<tr>");
						var $bId = $("<td>").text(data[i].bId);
						var $bTitle = $("<td>").text(data[i].bTitle);
						var $bWriter = $("<td>").text(data[i].bWriter);
						var $bCreateDate = $("<td>").text(data[i].bCreateDate);
						var $bCount = $("<td>").text(data[i].bCount);
						var $bFile = $("<td>").text(" ");
						
						if(data[i].originalFileName != null){
							$bFile = $("<td>").text("◎");
						}
						
						$tr.append($bId);
						$tr.append($bTitle);
						$tr.append($bWriter);
						$tr.append($bCreateDate);
						$tr.append($bCount);
						$tr.append($bFile);
						
						$tableBody.append($tr);
					}
				
					// 2번 방법, 3번 방법
					/*
					for(var i in data){
						
						console.log(data[i]);
						
						var $tr = $("<tr>");
						var $bId = $("<td>").text(data[i].bId);
						var $bTitle = $("<td>").text(decodeURIComponent(data[i].bTitle.replace(/\+/g, " ")));
						var $bWriter = $("<td>").text(data[i].bWriter);
						var $bCreateDate = $("<td>").text(data[i].bCreateDate);
						var $bCount = $("<td>").text(data[i].bCount);
						var $bFile = $("<td>").text(" ");
						
						if(data[i].originalFileName != null){
							$bFile = $("<td>").text("◎");
						}
						
						$tr.append($bId);
						$tr.append($bTitle);
						$tr.append($bWriter);
						$tr.append($bCreateDate);
						$tr.append($bCount);
						$tr.append($bFile);
						
						$tableBody.append($tr);
					} 
					*/
				}, 
				error:function(request, status, error){
					
				}
			});
		}
	
		
	</script>
	
</body>
</html>
