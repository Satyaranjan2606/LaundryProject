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

            <%
            String id=request.getParameter("id");
         try{ 
            
	           Connection connection = null;
                 Statement statement = null;
                 ResultSet resultSet = null;

				 Class.forName("com.mysql.jdbc.Driver");
                 connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lundryproject", "root","satya");
		

				 statement=connection.createStatement();

				 String sql ="SELECT * FROM registerdata where RegisterID="+id;
				 

				 resultSet = statement.executeQuery(sql);

				 while(resultSet.next())
				 {
	

		%>
	<table style="width:50%;margin-top: -150px;" border="1"> 
		<form action="Editupdate.jsp" method="post" name="form1">
			<tr>
			  <td bgcolor="#96ACA3"><center>RegisterID</center></td>
			  <td><center><input type="text" name="id"  value="<%=resultSet.getString(1) %>" readonly size="50"></center></td>
			  </tr>
			  <tr>
			  <td bgcolor="#96ACA3"><center>Name</center></td>
			  <td><center><input type="text" name="name"  value="<%=resultSet.getString(2) %>" size="50"></center></td>
			  </tr>
			  <tr>
			  <td bgcolor="#96ACA3"><center>Email</center></td>
			  <td><center><input type="text" name="Email"  value="<%=resultSet.getString(3) %>" size="50"></center></td>
			  </tr>
			  <tr>
			  <td bgcolor="#96ACA3"><center>Number</center></td>
			  <td><center><input type="text" name="number" value="<%=resultSet.getString(5) %>" size="50"></center></td>
			  </tr>
			  <tr>
				<td></td>
			    <td>
				  <center><input type="submit" value="Update" style="cursor:pointer;"></center>
				</td>
			</tr>
        </form>


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