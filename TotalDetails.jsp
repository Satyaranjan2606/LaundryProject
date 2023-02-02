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

        <table style="width:95%;margin-top: -370px;" border="1"> 
            
			<tr bgcolor="#96ACA3">
                <td><center>Slno</center></td>
                <td><center>Date</center></td>
                <td><center>Topwear</center></td>
                <td><center>Bottomwear</center></td>
                <td><center>Woolen</center></td>
                <td><center>Name</center></td>
                <td><center>Address</center></td>
                <td><center>Services</center></td>
                <td><center>Status</center></td>
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

				 String sql ="SELECT * FROM requestdata";
				 

				 resultSet = statement.executeQuery(sql);

				 while(resultSet.next())
				 {
	

		%>

		<form action="Updatedata.jsp" method="post" name="form1">
			<tr>
			  <td><center><input type="text" name="id" style="border:none;" value="<%=resultSet.getString(1) %>" readonly size="3"></center></td>
			  <td><center><input type="text" name="date" style="border:none;" value="<%=resultSet.getString(2) %>" size="6" readonly></center></td>
			  <td><center><input type="text" name="top" style="border:none;" value="<%=resultSet.getString(3) %>" readonly size="3"></center></td>
			  <td><center><input type="text" name="bot" style="border:none;" value="<%=resultSet.getString(4) %>"readonly size="3"></center></td>
			  <td><center><input type="text" name="wool" style="border:none;" value="<%=resultSet.getString(5) %>" readonly size="3"></center></td>
			  <td><center><input type="text" name="Name" style="border:none;" value="<%=resultSet.getString(6) %>" size="20" readonly></center></td>
			  <td><center><input type="text" name="Address"   style="border:none;" value="<%=resultSet.getString(7) %>" size="30" readonly></center></td>
			  <td><center><input type="text" name="Service" style="border:none;" value="<%=resultSet.getString(8) %>" size="15" readonly></center></td>
			  <td><center><input type="text" name="Status" style="border:none;" value="<%=resultSet.getString(9) %>" size="7" readonly></center></td>
			  <td>
				<center><input type="submit" value="Approv" style="cursor:pointer;">
				<input type="button" value="Reject" style="cursor:pointer;" onclick="Deny();"></center>
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
<script>
	function Deny()
	{
	  document.forms['form1'].action='Updatereject.jsp';
	  document.forms['form1'].submit();
	}
</script>
</body>
</html>