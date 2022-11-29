<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.WriteResult"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.BasicDBObjectBuilder"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="java.net.UnknownHostException"%>
<%@page import="com.mongodb.MongoClient"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%!
public void printResult(WriteResult result){
// update,remove 된 Doc 수, insert 시에는 0
System.out.println("업데이트 수:"+ result.getN());
//update시만 true
System.out.println("업데이트 여부:"+result.isUpdateOfExisting());
}
%>
%>

	<table width="700" align="center" border="1">
		<h1>ResultMongo</h1>
</body>
</html>