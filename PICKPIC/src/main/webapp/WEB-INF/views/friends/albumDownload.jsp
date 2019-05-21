<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Donwload.jsp -->
<%
	
	String filename = request.getParameter("filename");
	String saveDirectory = application.getRealPath("/Upload");		
	
	//System.out.println(saveDirectory+File.separator+filename);
	File file = new File(saveDirectory+File.separator+filename);	
	long length = file.length();
	
	response.setContentType("application/octet-stream");
	
	response.setContentLengthLong(length);
	
	boolean isIe = request.getHeader("user-agent").toUpperCase().indexOf("MSIE") !=-1 ||
	               request.getHeader("user-agent").indexOf("11.0") !=-1;
	if(isIe) //인터넷 익스플로러
		filename = URLEncoder.encode(filename,"UTF-8");
	else{//기타 웹브라우저
 		filename = new String(filename.getBytes("UTF-8"),"8859_1");
	}
	response.setHeader("Content-Disposition","attachment;filename="+filename);

	BufferedInputStream bis =
		new BufferedInputStream(new FileInputStream(file));
	
	out.clear();
	out = pageContext.pushBody();
	

	BufferedOutputStream bos =
		new BufferedOutputStream(response.getOutputStream());
	
	int data;
	while((data=bis.read()) !=-1){
		bos.write(data);
		bos.flush();		
	}
	
	bis.close();
	bos.close();
%>
