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
<h1>db ����-��ȸ</h1>
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


// ��ȸ
DBObject query = BasicDBObjectBuilder.start().get();
DBCursor cursor = col.find(query);
// Ŀ���� ���� ���α׷��� �����ͺ��̽��� �ݺ��� �� �ֵ��� �ϴ� ��Ŀ����

// Document�κ��� �ʵ带 �����ϴ� ��
// DBObject resultDoc = cursor.next();
// String ename = (String)resultDoc.get("ename");
// System.out.println(ename);


%>
	<table width="700" align="center" border="1">
		<tr bgcolor=#D9E5FF>
			<th>���̵�</th>
			<th>�̸�</th>
			<th>����</th>
			<th>�μ�</th>
			<th>����</th>
			<th>����</th>
		</tr>
		
		<%
		
		while(cursor.hasNext()){  // ����Ŀ�� �ε����� ���� ������ true ������ false 
			DBObject resultDoc = cursor.next();
			System.out.println(resultDoc);
			Integer id = (Integer)resultDoc.get("_id");
			String ename = (String)resultDoc.get("ename");
			String job = (String)resultDoc.get("job");
			String dept = (String)resultDoc.get("dept");
		    // System.out.println(cursor.next());//Document ����, next() ���� Ŀ���� ���� ��ȯ�ϰ� Ŀ���� �������� �ű�� 
		    //System.out.println(ename);
		%>
		<tr >
			<td><%=id%></td>
			<td><%=ename %></td>
			<td><%=job %></td>
			<td><%=dept %></td>
			<td><a href="DeleteMongo.jsp?ename=<%=ename%>" >����</a></td>
			<td><a href="UpdateMongoOK.jsp?ename=<%=ename%>" >����</a></td>
		</tr>
		<%}
		%>	
		
		</table>
		<a href = "main.jsp">��������</a><br/>
</body>
</html>