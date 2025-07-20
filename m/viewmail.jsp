<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
int id = Integer.parseInt(request.getParameter("uid"));
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/emailsoftware";
String userid = "vishnu";
String password = "Vkt@1028";

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

try {
    Class.forName(driver);
    connection = DriverManager.getConnection(connectionUrl, userid, password);
    statement = connection.createStatement();
    // Ensure that the user input is properly sanitized
    String sql = "SELECT * FROM mails WHERE mid = " + id;
    resultSet = statement.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Email Details</title>
    <style>
    *{
text-decoration:none;
}</style>
</head>
<body>
        <%
        String from=null;
        String subject=null;
        String mid=null;
        String mto=null;
        while(resultSet.next()){
        from=resultSet.getString("mfrom");
        subject=resultSet.getString("subject");
        mid=resultSet.getString("mid");
        mto=resultSet.getString("mto");
        %>
        <table align="center" width="60%" height=500px border="1">
        <tr>
            <th>From :</th><td><%=from%></td>
        </tr>
        <tr>
            <th>Subject: </th><td><%=subject%></td>
        </tr>
        <tr>
            <th>Text :</th><td><%=resultSet.getString("mtext")%></td>
        </tr>
        <%
        }
        resultSet.close();
        statement.close();
        connection.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
    </table>
    	<center><button><a href="replysentbox.jsp">reply</a></button></center>
        <center><button><a href="SentBox.jsp">back</a></button></center>
</body>
</html>


