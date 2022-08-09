<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 라이브러리 코드 -->
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%
String msg = request.getParameter("msg");
%> --%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var result = '<c:out value="${msg}"/>';

		
    checkAlert(result);
    
    function checkAlert(result){
        
        if(result === ''){
            return;
        }
        
        if(result === "등록완료"){
            alert("등록이 완료되었습니다.");
        }
        
        
        if(result === "수정완료"){
            alert("수정이 완료되었습니다.");
        }
    }    
		
		
	});
	
	let moveForm = $("#moveForm");
	 
    $(".move").on("click", function(e){
        e.preventDefault();
        
        moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
        moveForm.attr("action", "/get");
        moveForm.submit();
    });
</script>

</head>
<body>
	<h1>목록페이지입니다.</h1>
	<!-- <a href="/board/enroll">게시판 등록</a> -->
	
	<div class="table_wrap">
	<a href="/board/enroll" class="top_btn">게시판 등록</a>
	<form id="moveForm" method="get">  
	<table>
		<thead>
			<tr>
				<th class="bno_width">번호</th>
				<th class="title_width">제목</th>
				<th class="writer_width">작성자</th>
				<th class="regdate_width">작성일</th>
				<th class="updatedate_width">수정일</th>
			</tr>
		</thead>
			
			
		 <c:forEach items="${list}" var="list">
            <tr>
                <td><c:out value="${list.bno}"/></td>
                 <td><a class="move" href='/board/get?bno=<c:out value="${list.bno}"/>'>
                        <c:out value="${list.title}"/>
                    </a></td>
                <%-- <td><c:out value="${list.title}"/></td> --%>
                <td><c:out value="${list.writer}"/></td>
                <!-- 변경 코드 -->
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}"/></td>
            </tr>
        </c:forEach>
	</table>
	  
    </form>
</div>


</body>
</html>