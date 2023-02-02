<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
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
</body>
</html>