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
<h1>db 연결-조회</h1>
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


// 조회
DBObject query = BasicDBObjectBuilder.start().get();
DBCursor cursor = col.find(query);
// 커서는 응용 프로그램이 데이터베이스를 반복할 수 있도록 하는 메커니즘

// Document로부터 필드를 추출하는 예
// DBObject resultDoc = cursor.next();
// String ename = (String)resultDoc.get("ename");
// System.out.println(ename);


%>
	<table width="700" align="center" border="1">
		<tr bgcolor=#D9E5FF>
			<th>아이디</th>
			<th>이름</th>
			<th>직업</th>
			<th>부서</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
		
		<%
		
		while(cursor.hasNext()){  // 다음커서 인덱스에 값이 있으면 true 없으면 false 
			DBObject resultDoc = cursor.next();
			System.out.println(resultDoc);
			Integer id = (Integer)resultDoc.get("_id");
			String ename = (String)resultDoc.get("ename");
			String job = (String)resultDoc.get("job");
			String dept = (String)resultDoc.get("dept");
		    // System.out.println(cursor.next());//Document 리턴, next() 현제 커서의 값을 반환하고 커서를 다음으로 옮긴다 
		    //System.out.println(ename);
		%>
		<tr >
			<td><%=id%></td>
			<td><%=ename %></td>
			<td><%=job %></td>
			<td><%=dept %></td>
			<td><a href="DeleteMongo.jsp?ename=<%=ename%>" >삭제</a></td>
			<td><a href="UpdateMongoOK.jsp?ename=<%=ename%>" >수정</a></td>
		</tr>
		<%}
		%>	
		
		</table>
		<a href = "main.jsp">메인으로</a><br/>
</body>
</html>