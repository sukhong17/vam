<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
    let mForm = $("#modifyForm");    // 페이지 데이터 수정 from
    
    /* 목록 페이지 이동 버튼 */
    $("#list_btn").on("click", function(e){
        form.find("#bno").remove();
        form.attr("action", "/board/list");
        form.submit();
        console.log("목록페이지 이동");
    });
    
    /* 수정 하기 버튼 */
    $("#modify_btn").on("click", function(e){
        mForm.submit();
        console.log("수정하기");
    });
    
    /* 취소 버튼 */
    $("#cancel_btn").on("click", function(e){
        form.attr("action", "/board/get");
        form.submit();
        console.log("취소버튼");
    });
    </script>
</head>
<body>

	<h1>조회 페이지</h1>
	<form id="modifyForm" action="/board/modify" method="post">
    
	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="bno"  value='<c:out value="${pageInfo.bno}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="title"  value='<c:out value="${pageInfo.title}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label>
		<textarea rows="3" name="content" ><c:out value="${pageInfo.content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>게시판 작성자</label>
		<input name="writer" value='<c:out value="${pageInfo.writer}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 등록일</label>
		<input name="regdater" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 수정일</label>
		<input name="updateDate"  value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>' >
	</div>		
	<div class="btn_wrap">
		<a class="btn" id="list_btn">목록 페이지</a> 
		<a class="btn" id="modify_btn">수정 하기</a>
		<a class="btn" id="cancel_btn">수정 취소</a>
	</div>
	</form>
	<%-- <form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
	</form> --%>
	
</body>
</html>