<%@page import="java.sql.*,java.util.*,java.text.*"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %> 
    <%
     String user=request.getParameter("Gmail");

             String pass=request.getParameter("Pswd");
     try
      {
         Class.forName("com.mysql.jdbc.Driver");

            Connection connection = null;
                   PreparedStatement stmt=null;
ResultSet resultSet = null;  
String Usertype= null; 
String Name= null;
                              connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lundryproject", "root","satya");
                   
				   String sql ="select * from registerdata where Email=? and Password=?";
                                               stmt = connection.prepareStatement(sql);

                                               stmt.setString(1,user);
                                               stmt.setString(2,pass);
   resultSet=stmt.executeQuery();

 if(resultSet.next())
{
  Name=resultSet.getString("Name");  
	  Usertype = resultSet.getString("UserType"); 
}
else
{
  %>
  <script>
  alert("Password or User invalid please Relogin");
  document.location="Login.html";
  </script>
<%
}
session.setAttribute("Name",Name);
if(Usertype.equals("USER"))
{
  response.sendRedirect("UserHomePage.jsp");
}
else
{
    response.sendRedirect("LaundryHomePage.jsp");
}

}		
     catch(Exception e)
     {
       System.out.print(e);
               e.printStackTrace();
	  
     }                                   
%>
