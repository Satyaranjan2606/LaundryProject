<%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.ResultSet"%>
   <%@page import="java.sql.Statement"%>
     <%@page import="java.sql.Connection"%>
       <%@page import="java.io.*"%>
<%
             String currentPassword=request.getParameter("current");
                         String Newpass=request.getParameter("new");
                              String conpass=request.getParameter("confirm");
                String connurl = "jdbc:mysql://localhost:3306/lundryproject";
                        Connection con=null;
                               String pass="";
                                        int id=0;
                      try
                      {
                            Class.forName("com.mysql.jdbc.Driver");
                               con = DriverManager.getConnection(connurl, "root", "satya");
                                                Statement st=con.createStatement();
                                        ResultSet rs=st.executeQuery("select * from registerdata where Password='"+currentPassword+"'");
                          while(rs.next())
                          {
                                     id=rs.getInt(1);
                                       pass=rs.getString(4);
                          }
                       if(pass.equals(currentPassword))
                        {
                         Statement st1=con.createStatement();
                          int i=st1.executeUpdate("update registerdata set Password='"+conpass+"' where RegisterID='"+id+"'");
%>
<script language="javascript">
alert("Password Changed Successfully");
  window.location.href="Changepass.jsp";
</script>
  <%
                               st1.close();
                                 con.close();
                        }
                       else
                       {
                        %>
                        <script language="javascript">
                        alert("Current pass doesnot match");
                          window.location.href="Changepass.jsp";
                        </script>
                          <%
                       }
                    }
                       catch(Exception e)
                       {
                           out.println(e);
                       }
%>