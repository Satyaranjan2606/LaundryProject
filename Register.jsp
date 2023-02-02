<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %>
<%
String Name=request.getParameter("Name");
String Email=request.getParameter("Email");
String Phonenumber=request.getParameter("Phonenumber");
String Password=request.getParameter("Password");
try
{  

  Class.forName("com.mysql.jdbc.Driver");
  Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/lundryproject", "root","satya");

         PreparedStatement stmt=conn.prepareStatement("insert into registerdata (Name,Email,Password,Number,UserType)values(?,?,?,?,?)");

      stmt.setString(1,Name);
      stmt.setString(2,Email);
      stmt.setString(3,Password);
      stmt.setString(4,Phonenumber);
      stmt.setString(5,"USER");

      int x=stmt.executeUpdate();
if(x!=0)
{
%>
<script language="javascript">
  alert("Registered Successfully");
  window.location.href="Signup.html";
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
