<!DOCTYPE html>
<html>
<head>
	<title>ChangepasswordPage</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style7.css">
	
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
				<table border="1" style="margin-top:-350px;border-collapse:collapse;" height="10" width="1250"> 
					<th>Change you Password</th>
					</table>
					</div>
		<form  method="post" action="Updatepass.jsp" name="myform">
			<table style="background-color:rgb(240, 220, 240);margin-top: -200px;border-radius: 15px;">
				  <tr>
					<td><input type="password" name="current" placeholder="CurrentPassword" style="width:950px;border-radius:10px;height:30px;"></td>
				  </tr>
				  <tr>
					<td><input type="password" name="new" placeholder="NewPassword"  style="width:950px;border-radius:10px;height:30px;"></td>
				  </tr>
				  <tr>
				   <td><input type="password" name="confirm" placeholder="ConfirmPassword" style="width:950px;border-radius:10px;height:30px;"></td>
				  </tr>
				  <tr>
					<td><input type="submit" Value="submit" style="background-color:rgb(13, 127, 85);color:white;border-radius:5px;width:70px;cursor:pointer;" onclick="return validate()"></td>
				 </tr> 
			</table>
		</form>

		</section>
	</div>
	<script>
		function validate()
		{
			var a=document.myform.current.value;
            var b=document.myform.new.value;
			var c=document.myform.confirm.value;

            if(a=="")
			{
               alert("Please enter your current password");
			   document.myform.current.focus();
			   return false;
			}
			if(b=="")
			{
				alert("Please enter your new password");
			   document.myform.new.focus();
			   return false;
			}
			if(c=="")
			{
				alert("Please enter your confirm password");
			   document.myform.confirm.focus();
			   return false;
			}
			if(b!=c)
			{
				alert("Password miss match");
				document.myform.new.focus();
				return false;
			}
		}
		</script>
</body>
</html>