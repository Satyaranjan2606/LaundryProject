<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %>
<%
String top=request.getParameter("topwear");
String bot=request.getParameter("bottomwear");
String wol=request.getParameter("woolen");
try
{  
Class.forName("com.mysql.jdbc.Driver");
Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/lundryproject", "root","satya");
 PreparedStatement stmt=conn.prepareStatement("update pricedetails set TopWear=?,BottomWear=?,Woolen=?,Others=?");
stmt.setString(1,top);
stmt.setString(2,bot);
stmt.setString(3,wol);
stmt.setString(4,"According To The Owner");
int x=stmt.executeUpdate();

if(x!=0)
{
%>
<script language="javascript">
  alert("Price Updated");
  window.location.href="ChangePerunitprice.jsp";
</script>
<%
}
else
{
  System.out.print("Unsuccess");
}
}
catch(Exception e)
		{
        System.out.print(e);
        e.printStackTrace();
        }
%>
