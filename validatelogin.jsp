<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String user_id= request.getParameter("uid");
String pwd = request.getParameter("uname");
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
int flag=0;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users where emailid='"+user_id+"' and pwd='"+pwd+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
flag=1;
}
if(flag==1){
session.setAttribute("emailid",user_id);
response.sendRedirect("inbox.jsp");
}
else
{
response.sendRedirect("login.jsp?msg='Invalid user name <br> try again'");
}
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>
