<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="display.css">
	<title>table</title>
	<style>

       table{
 position: absolute;
 z-index: 2;
 left: 50%;
 top: 50%;
 transform: translate(-50%,-50%);
 width: 60%; 
 border-collapse: collapse;
 border-spacing: 0;
 box-shadow: 0 2px 15px rgba(64,64,64,.7);
 border-radius: 12px 12px 0 0;
 overflow: hidden;

}
td , th{
 padding: 15px 20px;
 text-align: center;
 

}
th{
 background-color: #ba68c8;
 color: #fafafa;
 font-family: 'Open Sans',Sans-serif;
 font-weight: 200;
 text-transform: uppercase;

}
tr{
 width: 100%;
 background-color: #fafafa;
 font-family: 'Montserrat', sans-serif;
}
tr:nth-child(even){
 background-color: #eeeeee;
}
</style>
</head>
<body>

    <div class="menu-bar"><ul class="nav-area">
<li><a href="home.php">Home</a></li>
<li><a href="#">About us</a></li>
<li><a href="clinic_login.php">Log Out</a></li>
</ul>

      <h1>Diagnosis And Test Management System</h1>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

         <table>
             <tr>
                 <th>CLINIC NAME</th>
                  <th>Test Name</th>
                  <th>TEST DESCRIPTION</th>
                  <th>Amount</th>
             </tr>
            <?php
            $conn = mysqli_connect("localhost", "root", "","diagnosis");
            if($conn-> connect_error){
               die("connection failed:" .$conn-> connect_error);
            }

            $sql= "SELECT c_id, t_name,t_desc,amount from tests";
            $result = $conn-> query($sql);

            if($result-> num_rows >0){
              while($row = $result-> fetch_assoc()){
                echo "<tr><td>". $row["c_id"] . "</td><td>" . $row["t_name"] . "</td><td>" . $row["t_desc"] ."</td><td>" . $row["amount"] ."</td><tr>";
              }

              echo "</table>";

            }
            else{
               echo "0 result";
            }
            $conn->close();
            ?>
         </table>
</body>
</html>