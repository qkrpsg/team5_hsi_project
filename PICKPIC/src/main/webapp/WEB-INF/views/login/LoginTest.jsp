
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--  -->

<div>그냥 id   ${id}</div>
<div>세션 영역 ${sid}</div>
<div>세션 영역 ${sessionScope.i}</div>
<div>리퀘스트 영역 ${requestScope.id}</div>

