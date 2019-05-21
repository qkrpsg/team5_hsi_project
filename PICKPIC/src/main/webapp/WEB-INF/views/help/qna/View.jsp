<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css&js -->
<link href="<c:url value='/css/Pkp.css' />" rel="stylesheet">
<link href="<c:url value='/css/Help.css' />" rel="stylesheet">


<body style="background-color: #E6E6FA">
<div class="row" style="margin-top: 7%;margin-bottom: 5%">
<div class="col-md-offset-4 col-md-4" style="border:solid 1px #5F9EA0;background-color: white;padding:1%">
		<h1>
			공지사항 
		</h1>
		
	</div>
<div class="col-md-offset-4 col-md-4" style="border:solid 1px #5F9EA0;background-color: white;padding:1% ">
<div class="col-md-7" style="font-size: 15px;font-weight: bold">

</div>
<div class="col-md-5">
${list.Q_TITLE}
</div>
</div>
<div class="col-md-offset-4 col-md-4" style="border:solid 1px #5F9EA0;padding:1%;background-color: white;">
${list.Q_INDEX}
</div>


	    
	
	
</div>

</body>	