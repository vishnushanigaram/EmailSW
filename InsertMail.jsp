<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String mfrom=request.getParameter("mfrom");
String mto=request.getParameter("mto");
String subject=request.getParameter("subj");
String mtext=request.getParameter("mtext");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware", "vishnu", "Vkt@1028");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into mails(mfrom,mto,subject,mtext,inbox,sentbox)values('"+mfrom+"','"+mto+"','"+subject+"','"+mtext+"','1','1')");
        response.sendRedirect("ComposeMail.jsp?msg='Mail Sent Successfully'");
        }
        catch(Exception e)
        {
        out.print(e.getMessage());
        e.printStackTrace();
        }
 %>
