<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.niit.hiibernate.web.UserDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="userBean" class="com.niit.hiibernate.web.User">
</jsp:useBean> 
<jsp:setProperty property="*" name="userBean"/>

<%
  int i=UserDao.register(userBean);
  if(i>0)
  out.println("you are successfully registered");
%>
</body>
</html>