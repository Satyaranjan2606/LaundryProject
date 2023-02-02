<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %>
<%
String date=request.getParameter("date");
String topwear=request.getParameter("topwear");
String bottomwear=request.getParameter("bottomwear");
String woolen=request.getParameter("woolen");
String name=session.getAttribute("Name").toString();
String address=request.getParameter("address");  
String service=request.getParameter("service");    
try {
  SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
  Date dt=d.parse(date);          

  java.sql.Date sqlDate = new java.sql.Date(dt.getTime());


Class.forName("com.mysql.jdbc.Driver");
Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/lundryproject", "root","satya");
PreparedStatement stmt=conn.prepareStatement("insert into requestdata (Date,Topwear,Bottomwear,Woolenwear,Name,Address,Services,Status)values(?,?,?,?,?,?,?,?)");

stmt.setString(1,date);
stmt.setString(2,topwear);
stmt.setString(3,bottomwear);
stmt.setString(4,woolen);
stmt.setString(5,name);
stmt.setString(6,address);
stmt.setString(7,service);
stmt.setString(8,"Pending");

int x=stmt.executeUpdate();

if(x!=0)
{
%>
<script language="javascript">
  alert("Request inserted successfully");
  window.location.href="Lrequest.jsp";
  </script>
<%
}

else
{
 out.print("unsuccess");
}
}
		catch(Exception e)
		{
        System.out.print(e);
        e.printStackTrace();
        }
%>
