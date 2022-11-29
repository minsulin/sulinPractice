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

try{
DB db = mongo.getDB("db02");
// 연결된 데이터베이스에 포함된 Collection에 연결한다
DBCollection col = db.getCollection("member");

//파라미터 전송된 값 받아오기
request.setCharacterEncoding("euc-kr");
String id = request.getParameter("id");
String ename= request.getParameter("ename");
String job = request.getParameter("job");
String dept = request.getParameter("dept");

// 추가
BasicDBObjectBuilder docBuilder = BasicDBObjectBuilder.start();

docBuilder.append("_id", id);
docBuilder.append("ename", ename);
docBuilder.append("job", job);
docBuilder.append("dept", dept);

DBObject doc = docBuilder.get(); // Document
WriteResult result = col.insert(doc);
// System.out.println("추가 완료");
out.print(ename+"님 추가 완료되었습니다.");

}catch (Exception e) {
	e.printStackTrace();
}
%>

<br/><br/>
<a href = "main.jsp">메인으로</a><br/>
<a href = "ListMongo.jsp">목록보기</a>


</body>
</html>