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

<%

//MongoDB 서버에 접속한다
MongoClient mongo = null;
try {
	mongo = new MongoClient("localhost", 27017);
} catch (Exception e) {
	e.printStackTrace();
}

// db연결
DB db = mongo.getDB("db02");
// 연결된 데이터베이스에 포함된 Collection에 연결한다
DBCollection col = db.getCollection("member");

// 값 받아오기
String ename=request.getParameter("ename");

// 삭제
BasicDBObjectBuilder docBuilder = BasicDBObjectBuilder.start();

DBObject doc = docBuilder.get(); // Document


// ename으로 삭제
DBObject removeQuery = BasicDBObjectBuilder.start().add("ename", ename).get();
col.remove(removeQuery);
// System.out.println("삭제 완료");
out.print(ename+"님 삭제 완료되었습니다.");
mongo.close();
%>

<h1>db 연결-삭제</h1>
<br/><br/>
<a href = "main.jsp">메인으로</a><br/>
<a href = "ListMongo.jsp">목록보기</a>

</body>
</html>