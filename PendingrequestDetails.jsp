<%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.ResultSet"%>
   <%@page import="java.sql.Statement"%>
     <%@page import="java.sql.Connection"%>
       <%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>PendingRequestPage</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style5.css">
</head>
<body>
	<input type="checkbox" id="checkbox">
	<header class="header">
		<h2 class="u-name">Laundry <b>Management</b>
			<label for="checkbox">
				<i id="navbtn" class="fa fa-bars" aria-hidden="true"></i>
			</label>
		</h2>
		<i class="fa fa-user" aria-hidden="true">
			<%try
			{
				String Data=session.getAttribute("Name").toString();
                out.print(Data);
			}
			catch(Exception e)
			{
				System.out.print(e);
			}
			%>
		</i>
	</header>



	<div class="body">
		<nav class="side-bar">
			<div class="user-p">
			</div>
			<ul>
				<li>
					<a href="LaundryHomePage.jsp">
						<i class="fa fa-desktop" aria-hidden="true"></i>
						<span>Dashboard</span>
					</a>
				</li>
				<li>
					<a href="Mnageuser.jsp">
						<i class="fa fa-key" aria-hidden="true"></i>
						<span>ManageUser</span>
					</a>
				</li>
				
				<li>
					<a href="Index.html">
						<i class="fa fa-power-off" aria-hidden="true"></i>
						<span>Logout</span>
					</a>
				</li>
			</ul>
		</nav>
			
		<section class="section-1">
			 
        <table style="width:95%;margin-top: -470px;" border="1"> 
            
            <tr bgcolor="#96ACA3">
                <td><center>Slno</center></td>
                <td><center>Date</center></td>
				<td><center>Topwear</center></td>
				<td><center>Bottomwear</center></td>
				<td><center>Woolenwear</center></td>
                <td><center>Name</center></td>
				<td><center>Address</center></td>
				<td><center>Service type</center></td>
				<td><center>Status</center></td>
              </tr>
            <%
         try{ 
	           Connection connection = null;
                 Statement statement = null;
                 ResultSet resultSet = null;

				 Class.forName("com.mysql.jdbc.Driver");
                 connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lundryproject", "root","satya");
		

				 statement=connection.createStatement();

				 String sql ="SELECT * FROM requestdata where Status='Pending'";
				 

				 resultSet = statement.executeQuery(sql);

				 while(resultSet.next())
				 {
	

		%>

                <tr>
                  <td><center><%=resultSet.getString(1) %></center></td>
                  <td><center><%=resultSet.getString(2) %></center></td>
				  <td><center><%=resultSet.getString(3) %></center></td>
				  <td><center><%=resultSet.getString(4) %></center></td>
				  <td><center><%=resultSet.getString(5) %></center></td>
				  <td><center><%=resultSet.getString(6) %></center></td>
                  <td><center><%=resultSet.getString(7) %></center></td>
				  <td><center><%=resultSet.getString(8) %></center></td>
				  <td><center><%=resultSet.getString(9) %></center></td>
                </tr>

                <% 
            }
         connection.close();
         
         }
          catch (Exception e)
           {
             e.printStackTrace();
           }
     %>
              </table>
		</section>
	</div>

</body>
</html>