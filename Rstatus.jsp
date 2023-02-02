<%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.ResultSet"%>
   <%@page import="java.sql.Statement"%>
     <%@page import="java.sql.Connection"%>
       <%@page import="java.io.*"%>
	   <%@page import="java.lang.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>RequestStatusPage</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style4.css">
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
					<a href="UserHomePage.jsp">
						<i class="fa fa-desktop" aria-hidden="true"></i>
						<span>Dashboard</span>
					</a>
				</li>
				<li>
					<a href="Lrequest.jsp">
						<i class="fa fa-paper-plane" aria-hidden="true"></i>
						<span>LundryRequest</span>
					</a>
				</li>
				<li>
					<a href="Rstatus.jsp">
						<i class="fa fa-paper-plane" aria-hidden="true"></i>
						<span>RequestStatus</span>
					</a>
				</li>
				<li>
					<a href="Changepass.jsp">
						<i class="fa fa-key" aria-hidden="true"></i>
						<span>Changepassword</span>
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
		<%
         try{ 
	           Connection connection = null;
                 Statement statement = null;
                 ResultSet resultSet = null;

				 Class.forName("com.mysql.jdbc.Driver");
                 connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lundryproject", "root","satya");
		

				 statement=connection.createStatement();

				 String name=session.getAttribute("Name").toString();
				 
				 String sql ="SELECT * FROM requestdata cross JOIN pricedetails where Name='"+name+"'";

				 resultSet = statement.executeQuery(sql);

				 while(resultSet.next())
				 {
		%>
	<table border="1" style="width:95%;border-collapse:collapse;margin-bottom:-60px;margin-top: -90px;" height="100">
		<tr bgcolor="#96ACA3">
			<td><b><center>RegisterID</center></b></td>
			<td><b><center>Date</center></b></td>
			<td><b><center>Topwear</center></b></td>
			<td><b><center>Bottomwear</center></b></td>
			<td><b><center>Woolenwear</center></b></td>
			<td><b><center>Name</center></b></td>
			<td><b><center>Address</center></b></td>
			<td><b><center>ServiceType</center></b></td>
			<td><b><center>Status</center></b></td>
			</tr>
		<tr bgcolor="#FAFAFA">
			<td><%=resultSet.getString(1) %></td>
			<td><%=resultSet.getString(2) %></td>
			<td><%=resultSet.getString(3) %></td>
			<td><%=resultSet.getString(4) %></td>
			<td><%=resultSet.getString(5) %></td>
			<td><%=resultSet.getString(6) %></td>
			<td><%=resultSet.getString(7) %></td>
			<td><%=resultSet.getString(8) %></td>
			<td><%=resultSet.getString(9) %></td>

		</tr>
	</table>

	<table border="1" style="width:50%;border-collapse:collapse;margin-bottom:-90px;" height="100">	
		<H2 style="margin-top: 150px;">Invoice of above Details</H2>	
		  <th bgcolor="#96ACA3">Type Of Cloth</th>
		  <th bgcolor="#96ACA3">NoOfCloths</th>
		  <th bgcolor="#96ACA3">TotalPrice</th>
		<tr>
			<td><b><center>Topwear</center></b></td>
			<td><%=resultSet.getString(3) %></td>
			 <td><%String Top=resultSet.getString(3);
				    String val=resultSet.getString(10);
				int x,y,z;
				int a=Integer.parseInt(Top);
				int p=Integer.parseInt(val);
				out.print(x=a*p);%></td>	
		</tr>
		<tr>
			<td><b><center>Bottomwear</center></b></td>
			<td><%=resultSet.getString(4) %></td>
			<td><%String Bot=resultSet.getString(3);
				    String val1=resultSet.getString(11);
				int b=Integer.parseInt(Bot);
				int q=Integer.parseInt(val1);
				out.print(y=b*q);%></td>
		</tr>
		<tr>
			<td><b><center>Woolenwear</center></b></td>
			<td><%=resultSet.getString(5) %></td>
			<td><%String Wool=resultSet.getString(3);
				  String val2=resultSet.getString(12);
				int c=Integer.parseInt(Wool);
				int r=Integer.parseInt(val2);
				out.print(z=c*r);%></td>
		</tr>
		<tr>
			<td><button style="Color:teal;cursor:pointer;border-radius:2px" onclick="myFunction()">Print this page</button></td>
			<td><b><center>SumTotal</center></b></td>
			<td><%int d=x+y+z;
				out.print(d);%>
			</td>

		</tr>
		
	</table>
	
		<% 
			}
			connection.close();
		}
			 catch (Exception e)
			  {
			    e.printStackTrace();
			  }
		%>
		</section>
	</div>
	<script>
		function validate()
		{
			var a=document.myform.name.value;
			if(a=="")
			{
              alert("Please Enter your Name");
			  document.myform.name.focus();
			  return false;
			}
		}
		</script>
		<script>
			function myFunction() {
				window.print();
			}
			</script>
	
</body>
</html>