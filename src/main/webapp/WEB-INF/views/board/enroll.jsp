<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
	$(document).ready(function() {
		$("#submit").on("click", function() {
			alert("작성이 완료되었습니다.");
		});
	});
</script> -->

</head>
<body>

	<h1>게시판 등록</h1>
	<form action="/board/enroll" method="post">
	<!-- <div class="input_wrap">
			<label>bno</label> <input name="bno">
		</div> -->
		<div class="input_wrap">
			<label>Title</label> <input name="title">
		</div>
		<div class="input_wrap">
			<label>Content</label>
			<textarea rows="3" name="content"></textarea>
		</div>
		<div class="input_wrap">
			<label>Writer</label> <input name="writer">
		</div>
		<button type="submit" class="btn" id="submit">등록</button>
	</form>
</body>
</html>