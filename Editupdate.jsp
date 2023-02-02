<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String Email=request.getParameter("Email");
String number=request.getParameter("number");
try {
 
Class.forName("com.mysql.jdbc.Driver");
Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/lundryproject", "root","satya");
 PreparedStatement stmt=conn.prepareStatement("update registerdata set Name=?,Email=?,Number=? where RegisterID='"+id+"'");

stmt.setString(1, name);
stmt.setString(2,Email);
stmt.setString(3,number);

int x=stmt.executeUpdate();

if(x!=0)
{
%>
<script>
  alert("Data Updated success");
  window.location.href="Mnageuser.jsp";
  </script>
<%
}

else
{
 out.print("unsuccess");
}
conn.close();
}
		catch(Exception e)
		{
        System.out.print(e);
        e.printStackTrace();
        }
%>
