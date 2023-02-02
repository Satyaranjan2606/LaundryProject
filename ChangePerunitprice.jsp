<%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.ResultSet"%>
   <%@page import="java.sql.Statement"%>
     <%@page import="java.sql.Connection"%>
       <%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>ChangePricePerUnit</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style13.css">
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
		
			<table style="background-color:rgb(240, 220, 240);margin-top: -200px;border-radius: 15px;">
				<form  method="post" action="Updateunitprice.jsp" name="myform">
				  <tr>
						<td><input type="number" name="topwear" placeholder="PerUnit price for Topwear" style="width:950px;border-radius:10px;height:30px;"></td>
				  </tr>
				  <tr>
					<td><input type="number" name="bottomwear" placeholder="PerUnit price for Bottomwear" style="width:950px;border-radius:10px;height:30px;"></td>
				  </tr>
				  <tr>
				   <td><input type="number" name="woolen" placeholder="PerUnit price for Woolenwear" style="width:950px;border-radius:10px;height:30px;"></td>
				  </tr>
                  <tr>
                    <td><input type="submit" Value="submit" style="background-color:rgb(13, 127, 85);color:white;border-radius:5px;width:70px;cursor:pointer;" onclick="return validate()"></td>
                 </tr> 
                  </form>

            </table>              
          </section>
	</div>
<script>
    function validate()
	{
		var a=document.myform.topwear.value;
		var b=document.myform.bottomwear.value;
		var c=document.myform.woolen.value;

		if(a==""||b==""||c=="")
		{
			alert("Any of the field Can't be blank");
			return false;
		}
	}
    </script>
</body>
</html>