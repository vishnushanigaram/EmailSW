
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE>
<html>
<head>
<style>
*{
text-decoration:none;
}
.a{
border:1px solid black;
font-size:32px;
border-radius:10px;
}
</style>
</head>
<body>
<center><h1>Inbox Reached</h1></center>
<table align=center width=80%>
<tr>
<td><h1><a href=inbox.jsp>Inbox</a></h1></td>
<td><h1><a href=SentBox.jsp>SentBox</a></h1></td>
<td><h1><a href=ComposeMail.jsp>Compose Mail</a></h1></td>
<td><h1><a href=Logout.jsp>Logout</a></h1></td>
</tr>
</table>
<center><h1>My SentBox</h1></center><br><br><br><br>
<form name="form" action="delete_inbox.jsp">
<table border="1" align="center" width="60%">
<tr>
<th>from</th>
<th>Subject</th>
<th><input type=submit value="delete"></th>
</tr>
<%
String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "emailsoftware";
String userid = "vishnu";
String password = "Vkt@1028";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String user_id=session.getAttribute("emailid").toString();
String user_pwd=request.getParameter("pwd");
int flag=0;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from mails where mto='"+user_id+"' and inbox=1";
resultSet = statement.executeQuery(sql);
String mid=null;
String link=null;
while(resultSet.next()){
mid=resultSet.getString("mid");
link="inbox_viewmail.jsp?uid="+mid;
%>
<tr>
<td><%=resultSet.getString("mfrom") %></td>
<td><a href=<%=link%>><%=resultSet.getString("subject") %></a></td>
<td align=center><input type=checkbox name="delete" value="<%=mid%>"></td>

</tr><%
}
%>
</table>
<center><a href="inbox.jsp" class="a">back</a></center>
</form>
</body>
</html>
<%
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>
