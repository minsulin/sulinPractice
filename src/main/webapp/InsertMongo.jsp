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

try{
DB db = mongo.getDB("db02");
// ����� �����ͺ��̽��� ���Ե� Collection�� �����Ѵ�
DBCollection col = db.getCollection("member");

//�Ķ���� ���۵� �� �޾ƿ���
request.setCharacterEncoding("euc-kr");
String id = request.getParameter("id");
String ename= request.getParameter("ename");
String job = request.getParameter("job");
String dept = request.getParameter("dept");

// �߰�
BasicDBObjectBuilder docBuilder = BasicDBObjectBuilder.start();

docBuilder.append("_id", id);
docBuilder.append("ename", ename);
docBuilder.append("job", job);
docBuilder.append("dept", dept);

DBObject doc = docBuilder.get(); // Document
WriteResult result = col.insert(doc);
// System.out.println("�߰� �Ϸ�");
out.print(ename+"�� �߰� �Ϸ�Ǿ����ϴ�.");

}catch (Exception e) {
	e.printStackTrace();
}
%>

<br/><br/>
<a href = "main.jsp">��������</a><br/>
<a href = "ListMongo.jsp">��Ϻ���</a>


</body>
</html>