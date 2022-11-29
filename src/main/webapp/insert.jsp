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
		<legend>회원가입</legend>
		<label for="id">아이디</label>
		<input type="text" name="id"/><br/>
		<label for="ename">이름</label>
		<input type="text" name="ename"/><br/>
		<label for="job">직업</label>
		<input type="text" name="job"/><br/>
		<label for="dept">부서</label>
		<input type="text" name="dept"/><br/>
		<input type="submit" value="가입">
		<input type="reset" value="취소"/>
		
		<br/>
		<a href = "main.jsp">메인으로</a><br/>
		<a href = "ListMongo.jsp">목록보기</a>
	</fieldset>

</form>

</body>
</html>