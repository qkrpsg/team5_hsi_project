<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css&js -->

<style>
body {
font-family:NANUMSQUAREROUNDB;
font-size: 15px;
}

.sa{
width: 50px;
height: 30px;
float: left;
}
.Q{
width:60px;
height:60px;
border-radius: 30px;
float: left;

}


</style>

<!-- 기본 폼 -->
<div class="row" style="margin-top: 7%;margin-bottom: 5%;">
	<div style="font-size: 25px;font-weight: bold;text-align: center;margin-bottom: 3% ">문의사항</div>
	
	<div class="col-md-offset-3 col-md-6" style="padding: 1%; border-top: solid 2px #7DA7D9; border-bottom: solid 1px #e6e6e6; ">
		<span style=" padding-left:2%;" > 제목 &nbsp ${list.q_title } </span>
	</div>

	<div class="col-md-offset-3 col-md-6" style="padding: 1%; border-bottom: solid 1px #e6e6e6;  ">
		<div class="col-md-8" style="border-right: solid 1px #e6e6e6;">
			<span >작성자 &nbsp ${list.ppa_nickname }</span>
		</div>
		<div class="col-md-4" > 
			<span >등록일 &nbsp ${list.q_post_date }</span>
		</div>
	</div>

	<div class="col-md-offset-3 col-md-6" style="padding: 2% ;border-bottom: solid 2px #7DA7D9; margin-bottom: 2%;">
 	 ${list.q_content }
	</div>


<c:if test="${empty list.aq_content }" var="isEmpty">
         <div class="col-md-offset-3 col-md-6" style="border-bottom: solid 2px #7DA7D9;border-top:solid 2px #7DA7D9 ;padding:1%" >등록된 답변이 없습니다</div>
</c:if>

<c:if test="${not isEmpty }">
	<div class="col-md-offset-3 col-md-6" style="border-bottom:  solid 2px #7DA7D9;;border-top: solid 2px #7DA7D9;;padding:1%;;background-color: #eeeeee;" >
		 <span class="glyphicon glyphicon-comment"> &nbsp; ${list.aq_content } </span><span style="color:#778899;float:right  ">답변 등록일: ${list.aq_post_date }</span>
	</div>
</c:if>

<c:if test="${list.ppa_email == sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username  }" var="su">
	 <div class="col-md-offset-3 col-md-6" style="margin-top:2%;margin-bottom: 7%; "  >
	  
	 <c:if test="${empty list.aq_content }" var="aqempty">
		  <button class="btn btn-primary" style="font-weight: bold;float: right;margin-right: 1%;">
		  <a href="<c:url value='/help/qna/List.pic'/>" style=" color: #fff">목록</span></a>
		  </button>	
		  <button class="btn btn-primary" style="font-weight: bold;float:right;margin-right: 1%;">
		  <a href="<c:url value='/help/qna/update.pic?q_index=${list2 }'/> " style=" color: #fff">수정   </a>
		  </button>
	  	<button class="btn btn-primary" style="font-weight: bold;float:right;margin-right: 1%;">
	  	<a href="<c:url value='/help/qna/delete.pic?q_index=${list2 }'/> " style=" color: #fff">삭제  </a>
	  	</button>
	</c:if>
 
	 <c:if test="${not aqempty }">
		 <button class="btn btn-primary" style="font-weight: bold;float: right;margin-right: 1%;">
		  <a href="<c:url value='/help/qna/List.pic'/>" style=" color: #fff">목록</span></a>
		  </button>	
	 	
	 </c:if>
	 </div>
</c:if>

<c:if test="${not su }">
<div class="col-md-offset-3 col-md-6" style="margin-top:2%;margin-bottom: 7%; "  >
	  <button class="btn btn-primary" style="font-weight: bold;float: right;margin-right: 1%;">
		<a href="<c:url value='/help/qna/List.pic'/> ">목록</a>
		</button>
	</div>
</c:if>


</div>
<!-- 기본 폼 끝  -->
<!-- 기본 폼 끝  -->