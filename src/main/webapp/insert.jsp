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

<form method="get" action="InsertMongo.jsp">

	<fieldset id="regbox">
		<legend>ȸ������</legend>
		<label for="id">���̵�</label>
		<input type="text" name="id"/><br/>
		<label for="ename">�̸�</label>
		<input type="text" name="ename"/><br/>
		<label for="job">����</label>
		<input type="text" name="job"/><br/>
		<label for="dept">�μ�</label>
		<input type="text" name="dept"/><br/>
		<input type="submit" value="����">
		<input type="reset" value="���"/>
		
		<br/>
		<a href = "main.jsp">��������</a><br/>
		<a href = "ListMongo.jsp">��Ϻ���</a>
	</fieldset>

</form>

</body>
</html>