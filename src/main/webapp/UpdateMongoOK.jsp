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
System.out.println(ename);

// ������Ʈ
BasicDBObjectBuilder docBuilder = BasicDBObjectBuilder.start();
DBObject doc = docBuilder.get(); // Document


docBuilder = BasicDBObjectBuilder.start();

BasicDBObject newDoc = new BasicDBObject();
newDoc.append("job", "change");
newDoc.append("dept", "change");

docBuilder.append("$set", newDoc);
doc = docBuilder.get(); // Document
DBObject updateQuery = BasicDBObjectBuilder.start().add("dept", ename).get();
col.update(updateQuery, doc); //  �Ѱ��� Doc ����
//result = col.updateMulti(updateQuery, doc); //�ټ����� Doc ����
out.print(ename+"�� ���� �Ϸ�Ǿ����ϴ�.");
 
%>

<%!
static void printResult(WriteResult result){
// update,remove �� Doc ��, insert �ÿ��� 0
System.out.println("������Ʈ ��:"+ result.getN());
//update�ø� true
System.out.println("������Ʈ ����:"+result.isUpdateOfExisting());
}
%>


<h1>db ����-������Ʈ</h1>
<br/><br/>
<a href = "main.jsp">��������</a><br/>
<a href = "ListMongo.jsp">��Ϻ���</a>
		
</body>
</html>