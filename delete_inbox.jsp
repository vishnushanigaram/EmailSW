<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String []mails=request.getParameterValues("delete");
if(mails!=null && mails.length>0){
    String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "emailsoftware";
String userid = "vishnu";
String password = "Vkt@1028";
try{
    Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con=null;
Statement st=null;
try{
    con=DriverManager.getConnection(connectionUrl+database,userid,password);
    st=con.createStatement();
    for(String mid:mails){
        String sql=" UPDATE mails SET inbox='0' WHERE mid='"+mid+"'";
        st.executeUpdate(sql);
    }
    con.close();
    response.sendRedirect("inbox.jsp");
}
catch(Exception e){
    out.println(e.getMessage());
}
}
else{
    out.println("no mails selected for deletion");
}
%>