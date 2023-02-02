<%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.ResultSet"%>
   <%@page import="java.sql.Statement"%>
     <%@page import="java.sql.Connection"%>
       <%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>TotalDetailsPage</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style10.css">
    <style>
        </style>
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
					<a href="#">
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

			<div>
				<table border="1" style="margin-top:-400px;border-collapse:collapse;" height="10" width="1250" > 
					<th>Total number of rgsitered user</th>
				</table>
			</div>  

        <table style="width:95%;margin-top: -350px;" border="1"> 
            
			<tr bgcolor="#96ACA3">
                <td><center>RegisterID</center></td>
                <td><center>Name</center></td>
                <td><center>Email</center></td>
                <td><center>Number</center></td>
                <td><center>Action</center></td>
              </tr>
            <%
         try{ 
	           Connection connection = null;
                 Statement statement = null;
                 ResultSet resultSet = null;

				 Class.forName("com.mysql.jdbc.Driver");
                 connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lundryproject", "root","satya");
		

				 statement=connection.createStatement();

				 String sql ="SELECT * FROM registerdata";
				 

				 resultSet = statement.executeQuery(sql);

				 while(resultSet.next())
				 {
	

		%>
			<tr>
			  <td><center><input type="text" style="border:none;" value="<%=resultSet.getString(1) %>" readonly size="2"></center></td>
			  <td><center><input type="text" style="border:none;" value="<%=resultSet.getString(2) %>" readonly size="20"></center></td>
			  <td><center><input type="text" style="border:none;" value="<%=resultSet.getString(3) %>"readonly size="20"></center></td>
			  <td><center><input type="text" style="border:none;" value="<%=resultSet.getString(5) %>" readonly size="10"></center></td>
			  <td>
				<center><button><a href='Edituser.jsp?id=<%=resultSet.getString(1)%>'style="text-decoration:none;">Edit</a></button>
				<button><a href='Delete.jsp?id=<%=resultSet.getString(1)%>' style="text-decoration:none;">Delete</a></center></td>
				</td>
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