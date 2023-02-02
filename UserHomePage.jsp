<%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.ResultSet"%>
   <%@page import="java.sql.Statement"%>
     <%@page import="java.sql.Connection"%>
       <%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>UserHomePage</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style6.css">
	<style>
	   #slider 
	   {
		 position: relative;
		 width: 1000px;
		 height: 265px;
		 overflow: hidden;
		 box-shadow: 0 0 30px rgba(0, 0, 0, 0.3);
	   }
	   #slider ul 
	   {
		 position: relative;
		 list-style: none;
		 height: 100%;
		 width: 10000%;
		 padding: 0;
		 margin: 0;
		 transition: all 750ms ease;
		 left: 0;
	   }
	   #slider ul li 
	   {
		 position: relative;
		 height: 100%;
	   
		 float: left;
	   }
	   #slider ul li img
	   {
		 width: 1000px;
		 height: 265px;
	   }
	   #slider #prev, #slider #next
	    {
		 width: 50px;
		 line-height: 50px;
		 text-align: center;
		 color: white;
		 text-decoration: none;
		 position: absolute;
		 top: 50%;
		 border-radius: 50%;
		 font-size: 2rem;
		 text-shadow: 0 0 20px rgba(0, 0, 0, 0.6);
		 transform: translateY(-50%);
		 transition: all 150ms ease;
	   }
	   #slider #prev 
	   {
		 left: 10px;
	   }
	   #slider #next 
	   {
		 right: 10px;
	   }
	   
	   #slider #prev:hover, #slider #next:hover
	    {
		 background-color: rgba(0, 0, 0, 0.5);
		 text-shadow: 0;
	   }
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
				<table border="1" style="margin-top:-60px;border-collapse:collapse;" height="10" width="1250"> 
					<th>Dashboard/Overview</th>
				</table>
			</div>
			<div id="slider">
				<ul id="slideWrap"> 
					<li><img src="image/Img1.jpg" alt=""></li>
					<li><img src="image/Img2.jpg" alt=""></li>
					<li><img src="image/Img3.jpg" alt=""></li>
				</ul>
				  <a id="prev" href="#">&#8810;</a>
			      <a id="next" href="#">&#8811;</a>
		    </div>
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
				  <%=resultSet2.getString(4)%>
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
	<script>
            var slider = document.getElementById("slider");
               var sliderWidth = slider.offsetWidth;
                    var slideList = document.getElementById("slideWrap");
                        var count = 1;
                          var items = slideList.querySelectorAll("li").length;
                                 var prev = document.getElementById("prev");
                                   var next = document.getElementById("next");

                   window.addEventListener('resize', function() {
                          sliderWidth = slider.offsetWidth;
                                  });var prevSlide = function() {
                                              if(count > 1) {
                                                count = count - 2;
                             slideList.style.left = "-" + count * sliderWidth + "px";
                                              count++;
                                                                }

                               else if(count = 1) {
                                        count = items - 1;
                                  slideList.style.left = "-" + count * sliderWidth + "px";
                                    count++;
                                            }
                                   };var nextSlide = function() {
                           if(count < items) {
                       slideList.style.left = "-" + count * sliderWidth + "px";
                                        count++;
                                         }
                                  else if(count = items) {
                                    slideList.style.left = "0px";
                                        count = 1;
                                       }
                                   };var nextSlide = function() {
                          if(count < items) {
                      slideList.style.left = "-" + count * sliderWidth + "px";
                                  count++;
                                          }
                                else if(count = items) {
                                    slideList.style.left = "0px";
                                            count = 1;
                                                   }
                               };next.addEventListener("click", function() {
                                                nextSlide();
                                                             });

                                prev.addEventListener("click", function() {
                                                         prevSlide();
                                             });setInterval(function() {
                                                          nextSlide()
                                          } , 5000);window.onload = function() {
                                               responsiveSlider();  
                                            }
       </script>
</body>
</html>