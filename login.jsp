<html>
<head><style>
.myData{
font-size:32px;
}
.myButton{
font-size:32px;
}
</style></head>
<body>
<%
String msg=request.getParameter("msg");
if(msg!=null)
out.println("<center><font size=30 color=blue>"+msg+"</font></center>");
%>
<center>
<form name="form1" action="validatelogin.jsp" method="get">
<table align=center width="60%">
<tr><td>EmailID:</td><td><input type=text id=uid name=uid class="myData"></td></tr>
<tr><td>Password:</td><td><input type=text id=uname name=uname class="myData"></td></tr>
<tr><td><input type="submit" class="myButton" value="Login"></td><td><input type="reset" class="myButton" value="Reset"></td></tr>
</table></form></body></html>
