<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- css&js -->

<style>
.sa{
width: 50px;
height: 30px;
float: left;
}
.Q{
width: 60px;
height: 60px;
border-radius: 30px;
float : left;
}

</style>

<div class="row" style="margin-top: 7%;margin-bottom: 5%;">
<div style="font-size: 25px;font-weight: bold;text-align: center;margin-bottom: 3%">피크픽Tip!!</div>
<div class="col-md-offset-4 col-md-4" style="padding:1%;background-color: #1183db;border-bottom: solid 1px #87CEFA;border-top:solid 1px #87CEFA ">
        <div class="col-md-8" style="font-size: 15px;font-weight: bold;">
        <span style="font-size: 15px;margin-bottom: 1%">작성자: ${selectOne.TB_ID} </span><br/><br/>
           <span style="font-size: 15px" > 제목: ${selectOne.TB_TITLE } </span>
           
        </div>
        <div class="col-md-4" style="padding-top: 3%;">
                등록일<br/>
        ${selectOne.TB_POST_DATE }
        </div>

   </div>
<div class="col-md-offset-4 col-md-4" style="padding: 1%;font-size: 25px;margin-top: 2%;margin-bottom: 2%">
 내용: &nbsp; ${selectOne.TB_CONTENT }
</div>
<c:if test="${empty selectOne.TB_CONTENT }" var="isEmpty">
         <div class="col-md-offset-4 col-md-4" style=";font-size:20px;margin-top:1%;margin-bottom:1%; border-bottom: solid 1px #11db4a;border-top:solid 1px #80db11 ">등록된 답변이 없습니다</div>
</c:if>
<c:if test="${not isEmpty }">
<!-- <div class="col-md-offset-4 col-md-4" style="border-bottom: solid 1px #db11bd;border-top:solid 1px #db11bd;padding-top:1%;padding-bottom:1%;background-color: #11dbaf;"> -->
<%--      <img src="<c:url value='/resources/images/reply.png'/>" class="sa"><span style="font-size: 23px;">&nbsp; ${selectOne.TB_CONTENT }</span><span style="font-size: 15px;color:#778899;float:right ">답변 등록일: ${list.tb_post_date }</span> --%>
<!-- </div> -->
</c:if>
<c:if test="${list.ppa_email == sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username }" var="su">
 <div class="col-md-offset-4 col-md-4" style="margin-top:2%;float: center;margin-bottom: 7%; " >
 <c:if test="${empty list.tb_content }" var="tbempty">
   <button class="btn btn-info" style="font-weight: bold;"><a href="<c:url value='/help/tip.pic'/>">목록</a></button> <button class="btn btn-info" style="font-weight: bold;"><a href="<c:url value='/help/tip/update.pic?q_index=${list2 }'/> ">수정  </a></button>
   <button class="btn btn-info" style="font-weight: bold;"><a href="<c:url value='/help/tip/delete.pic?tb_index=${list2 }'/>">삭제</a></button>
</c:if>
  <c:if test="${not tbempty }">
  <button class="btn btn-info" style="font-weight: bold;"><a href="<c:url value='/help/tip.pic'/>">목록</span></a></button>
  </c:if>
 </div>

</c:if>
<c:if test="${not su }">
 <div class="col-md-offset-4 col-md-4" style="margin-top:2%;float: center;margin-bottom: 7%;" >
<button class="btn btn-info" style="color:white;font-weight: bold;"><a href="<c:url value='/help/tip.pic'/>">목록</a></button>
</div>
</c:if>

</div>


