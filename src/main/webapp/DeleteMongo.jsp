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

//MongoDB ������ �����Ѵ�
MongoClient mongo = null;
try {
	mongo = new MongoClient("localhost", 27017);
} catch (Exception e) {
	e.printStackTrace();
}

// db����
DB db = mongo.getDB("db02");
// ����� �����ͺ��̽��� ���Ե� Collection�� �����Ѵ�
DBCollection col = db.getCollection("member");

// �� �޾ƿ���
String ename=request.getParameter("ename");

// ����
BasicDBObjectBuilder docBuilder = BasicDBObjectBuilder.start();

DBObject doc = docBuilder.get(); // Document


// ename���� ����
DBObject removeQuery = BasicDBObjectBuilder.start().add("ename", ename).get();
col.remove(removeQuery);
// System.out.println("���� �Ϸ�");
out.print(ename+"�� ���� �Ϸ�Ǿ����ϴ�.");
mongo.close();
%>

<h1>db ����-����</h1>
<br/><br/>
<a href = "main.jsp">��������</a><br/>
<a href = "ListMongo.jsp">��Ϻ���</a>

</body>
</html>