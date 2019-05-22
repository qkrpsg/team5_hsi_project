<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css&js -->

<style>
.sa{
width: 100px;
height: 40px;
float: left;
}
</style>


<div class="row" style="margin-top: 7%;margin-bottom: 5%">
<div class="col-md-offset-4 col-md-4" style="border:solid 1px #5F9EA0;padding:1%">
		<div class="col-md-8" style="font-size: 25px;font-weight: bold">
		<span style="font-size: 15px">작성자: ${list.ppa_nickname } </span><br/>
			제목: ${list.q_title }
		
		</div>
		<div class="col-md-4" style="padding-top: 3%;">
		등록일 <br/>
		${list.q_post_date }
		</div>
		
		
	</div>
<div class="col-md-offset-4 col-md-4" style="border: solid 1px yellow;padding: 1%;font-size: 15px">
    ${list.q_content }
</div>
<c:if test="${empty list.aq_content }" var="isEmpty">
         <div class="col-md-offset-4 col-md-4" style="border:solid 1px blue;font-size:15px ">등록된 답변이 없습니다</div>
</c:if>
<c:if test="${not isEmpty }">
<div class="col-md-offset-4 col-md-4" style="border:solid 1px blue;font-size:15px ">
	 <img src="<c:url value='/resources/images/question1.JPG'/>" class="sa"> ${list.aq_content } <span style="font-size: 10px;color:blue ">등록일: ${list.aq_post_date }</span>
	
	
</div>
</c:if>
