<!DOCTYPE html>
<html>
<head>
	<title>LaundryRequestPage</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style3.css">
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
			<div>
				<table border="1" style="margin-top: -300px;border-collapse:collapse;" height="10" width="1250"> 
					<th>RequestForService</th>
				</table>
			</div>
		<div>
			<table style="background-color:rgb(240, 220, 240);margin-top: -200px;border-radius: 15px;">
				<form  method="post" action="RequestData.jsp" name="myform">
				  <tr>
						<td><input type="date" name="date" style="width:950px;border-radius:10px;height:30px;"></td>
				  </tr>
				  <tr>
				  <tr>
					<td><input type="number" name="topwear" placeholder="No of Topwear" style="width:950px;border-radius:10px;height:30px;"></td>
				  </tr>
				  <tr>
				   <td><input type="number" name="bottomwear" placeholder="No of Bottomwear" style="width:950px;border-radius:10px;height:30px;"></td>
				  </tr>
				  <tr>
					 <td><input type="number" name="woolen" placeholder="No of woolen cloth" style="width:950px;border-radius:10px;height:30px;"></td>
				  </tr>
				  <tr>
					<td><input type="text" name="address" placeholder="Enter your address" style="width:950px;border-radius:10px;height:30px;"></td>
				  </tr>
				  <tr>
					<td> <select name="service"  style="width:950px;border-radius:10px;height:30px;" id="val">    
						   <option >Please select service type</option>
						   <option >Dry cleaning</option>
						   <option >Ironing</option>
					     </select>
				    </td>
				  </tr>
				  <tr>
					 <td><input type="submit" Value="submit" style="background-color:rgb(13, 127, 85);color:white;border-radius:5px;width:70px;cursor:pointer;" onclick="return validate()"></td>
				  </tr> 
				</form>
			</table>
		</div>
	</section>
<script>
    function validate()
	{
		var a=document.myform.date.value;
		var b=document.myform.topwear.value;
		var c=document.myform.bottomwear.value;
		var d=document.myform.woolen.value;
		var e=document.myform.name.value;
		var f=document.myform.address.value;
		var g=document.getElementById("val");

		if(a==""||b==""||c==""||d==""||e==""||f=="")
		{
			alert("Any of the field Can't be blank");
			return false;
		}
		if(g.selectedIndex==0)
		{
			alert("Please select an option");
			return false;
		}
	}	 
</script>
</body>
</html>