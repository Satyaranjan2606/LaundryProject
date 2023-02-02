<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %>
<%
String id=request.getParameter("id");
String date=request.getParameter("date");
String top=request.getParameter("top");
String bot=request.getParameter("bot");
String wool=request.getParameter("wool");
String Name=request.getParameter("Name");
String Address=request.getParameter("Address");
String Service=request.getParameter("Service");

try {
 
Class.forName("com.mysql.jdbc.Driver");
Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/lundryproject", "root","satya");
 PreparedStatement stmt=conn.prepareStatement("update requestdata set Date=?,Topwear=?,Bottomwear=?,Woolenwear=?,Name=?,Address=?,Services=?,Status=? where Slno='"+id+"'");

stmt.setString(1, date);
stmt.setString(2,top);
stmt.setString(3,bot);
stmt.setString(4,wool);
stmt.setString(5,Name);
stmt.setString(6,Address);
stmt.setString(7,Service);
stmt.setString(8,"Rejected");

int x=stmt.executeUpdate();

if(x!=0)
{
%>
<script>
  alert("Request rejected");
  window.location.href="TotalDetails.jsp";
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
