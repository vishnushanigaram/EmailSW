<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<center><h1>My SentBox</h1></center><br><br><br><br>
<table border="1" align="center" width="60%">
<tr>
<th>To</th>
<th>Subject</th>
<th>delete</th>
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
String sql ="select * from mails where mfrom='"+user_id+"'";
resultSet = statement.executeQuery(sql);
String linkUrl=null;
String mid=null;
String linkid;
while(resultSet.next()){
mid=resultSet.getString("mid");
linkUrl="delete.jsp?mid="+mid;
linkid="viewmail.jsp?uid="+mid;
%>
<tr>
<td><%=resultSet.getString("mto") %></td>
<td><a href=<%=linkid%>><%=resultSet.getString("subject") %></td>
<td><a href=<%=linkUrl%>>delete</td>

</tr><%
}
%>
</table>
<%
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>
