<%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.ResultSet"%>
   <%@page import="java.sql.Statement"%>
     <%@page import="java.sql.Connection"%>
       <%@page import="java.io.*"%>
<%
             String Mobile=request.getParameter("Mobile");
                         String Newpass=request.getParameter("Newpass");
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
                                        ResultSet rs=st.executeQuery("select * from registerdata where Number='"+Mobile+"'");
                          while(rs.next())
                          {
                                     id=rs.getInt(1);
                                       pass=rs.getString(5);
                          }
                       if(pass.equals(Mobile))
                        {
                         Statement st1=con.createStatement();
                          int i=st1.executeUpdate("update registerdata set Password='"+conpass+"' where RegisterID='"+id+"'");
%>
<script language="javascript">
alert("Password Changed Successfully");
  window.location.href="Index.html";
</script>
  <%
                               st1.close();
                                 con.close();
                        }
                       else
                       {
                        %>
                        <script language="javascript">
                        alert("Mobile number doesn't exit in our database");
                          window.location.href="forgot.html";

                        </script>
                          <%
                       }
                    }
                       catch(Exception e)
                       {
                           out.println(e);
                       }
%>