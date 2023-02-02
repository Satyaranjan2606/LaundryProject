<%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.ResultSet"%>
   <%@page import="java.sql.Statement"%>
     <%@page import="java.sql.Connection"%>
       <%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>LaundryHomePage</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style2.css">
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
					<a href="">
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
			<div>
				<table border="1" style="margin-top:-200px;border-collapse:collapse;" height="10" width="1250"> 
					<th>Dashboard/Overview</th>
				</table>
			</div>
		<%
         try{ 
	           Connection connection = null;
                 Statement statement = null;
                 ResultSet resultSet = null;

				 Class.forName("com.mysql.jdbc.Driver");
                 connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lundryproject", "root","satya");
		

				 statement=connection.createStatement();

				
				 String sql ="SELECT COUNT(Slno) FROM requestdata ";
				 

				 resultSet = statement.executeQuery(sql);

				 while(resultSet.next())
				 {
	                String Count=resultSet.getString(1);

		%>
			<div>
				<table border="1" style="margin-top:-150px;margin-left: -625px;border-collapse:collapse;background-color: red;" height="10" width="150"> 
					<th><i class="fa fa-bell" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;Totalrequest</th>
					   <tr>
						   <td><%out.print(Count);%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-info-circle" aria-hidden="true"></i><a href="TotalDetails.jsp" style="text-decoration:none;color:greenyellow">ViewDetails</a></td>
						</tr>
				</table>
			</div>
			<%
		        }
				connection.close();
			}
			catch(Exception e)
			{
			     System.out.print(e);
			}
			%>
		<%
         try{ 
	           Connection connection1 = null;
                 Statement statement1 = null;
                 ResultSet resultSet1 = null;

				 Class.forName("com.mysql.jdbc.Driver");
                 connection1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/lundryproject", "root","satya");
		

				 statement1=connection1.createStatement();

				
				 String sql1 ="SELECT COUNT(Slno) FROM requestdata where Status='Pending' ";
				 

				 resultSet1 = statement1.executeQuery(sql1);

				 while(resultSet1.next())
				 {
	                String Count1=resultSet1.getString(1);

		%>
			<div>
				<table border="1" style="margin-top:-150px;margin-left: -220px;border-collapse:collapse;background-color: yellow;" height="10" width="150"> 
					<th><i class="fa fa-bell" aria-hidden="true"></i>&nbsp;PendingRequest</th>
					<tr>
						<td><%out.print(Count1);%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-info-circle" aria-hidden="true"></i><a href="PendingrequestDetails.jsp" style="text-decoration:none;color:red;">ViewDetails</a></td>
					 </tr>
				</table>
			</div>
		<%
		    }
			connection1.close();
		}
			catch(Exception e)
			{
			     System.out.print(e);
			}
			%>
			<%
			try{ 
				  Connection connection3 = null;
					Statement statement3 = null;
					ResultSet resultSet3 = null;
   
					Class.forName("com.mysql.jdbc.Driver");
					connection3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/lundryproject", "root","satya");
		   
   
					statement3=connection3.createStatement();
   
				   
					String sql3 ="SELECT Count(Slno) FROM requestdata where Status='Rejected' ";
					
   
					resultSet3 = statement3.executeQuery(sql3);
   
					while(resultSet3.next())
					{
					   String Count3=resultSet3.getString(1);
   
		%>	
			<div>
				<table border="1" style="margin-top:-150px;margin-left: 290px;border-collapse:collapse;background-color: rgb(221, 135, 200);" height="10" width="160"> 
					<th><i class="fa fa-bell"></i>RejectedRequest</th>
					   <tr>
						  <td><%out.print(Count3);%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-info-circle" aria-hidden="true"></i><a href="RejectedRequest.jsp" style="text-decoration:none;color:white;">ViewDetails</a></td>
						</tr>
				</table>
			</div>
		<%
		    }
				connection3.close();
		  }
			catch(Exception e)
			{
			     System.out.print(e);
			}
		%>
		<%
			try{ 
				  Connection connection3 = null;
					Statement statement3 = null;
					ResultSet resultSet3 = null;
   
					Class.forName("com.mysql.jdbc.Driver");
					connection3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/lundryproject", "root","satya");
		   
   
					statement3=connection3.createStatement();
   
				   
					String sql3 ="SELECT Count(Slno) FROM requestdata where Status='Approved' ";
					
   
					resultSet3 = statement3.executeQuery(sql3);
   
					while(resultSet3.next())
					{
					   String Count3=resultSet3.getString(1);
   
		%>	
			<div>
				<table border="1" style="margin-top:-150px;margin-left: 1090px;border-collapse:collapse;background-color: green;" height="10" width="160"> 
					<th><i class="fa fa-bell"></i>ApprovedRequest</th>
					   <tr>
						  <td><%out.print(Count3);%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-info-circle" aria-hidden="true"></i><a href="ApprovedRequest.jsp" style="text-decoration:none;color:white;">ViewDetails</a></td>
						</tr>
				</table>
			</div>
		<%
		    }
				connection3.close();
		  }
			catch(Exception e)
			{
			     System.out.print(e);
			}
		%>
		
			<H2>Laundry Price(Per Unit)</H2>
		<%
			try{ 
				  Connection connection2 = null;
					Statement statement2 = null;
					ResultSet resultSet2 = null;
   
					Class.forName("com.mysql.jdbc.Driver");
					connection2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/lundryproject", "root","satya");
		   
   
					statement2=connection2.createStatement();
   
				   
					String sql2 ="SELECT * FROM pricedetails";
					
   
					resultSet2 = statement2.executeQuery(sql2);
   
					while(resultSet2.next())
					{
					  
   
		%>	
			<table border="1" style="width:95%;border-collapse:collapse;" height="200">
				<tr>
					<td>
						Top wear Laundry Price
					</td>
					<td>
						<i class="fa fa-inr" aria-hidden="true"></i><%=resultSet2.getString(1)%>
					</td>
				</tr>
				<tr>
					<td>
						Bottom Wear Laundry Price
					</td>
					<td>
						<i class="fa fa-inr" aria-hidden="true"></i><%=resultSet2.getString(2)%>
					</td>
				</tr>
				<tr>
					<td>
						Woolen Cloth Laundry Price
					</td>
					<td>
						<i class="fa fa-inr" aria-hidden="true"></i><%=resultSet2.getString(3)%>
					</td>
				</tr>
				<tr>
					<td>
					   Other Prices

					</td>
					<td>
				      <%=resultSet2.getString(4)%>&nbsp;&nbsp;&nbsp;&nbsp;<a style=" text-decoration: none;"href="ChangePerunitprice.jsp" style="margin-left: 100px;">Want to Changeprice?</a>
					</td>

				</tr>

				</table>
				<%
		    }
				connection2.close();
		}
			catch(Exception e)
			{
			     System.out.print(e);
			}
			%>
		</section>
	</div>

</body>
</html>