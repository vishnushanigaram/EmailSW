<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int mid=Integer.parseInt(request.getParameter("mid"));
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware", "vishnu", "Vkt@1028");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("UPDATE mails SET inbox='0' where mid="+mid);
        if(i>0)
           response.sendRedirect("inbox.jsp");
           else
        out.println("<center><b>Error deleting User. Try Again!</b></center>");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>


