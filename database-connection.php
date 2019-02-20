<?php
$servername = "us114.siteground.us";
$username = "garciad3_hellava";
$password = "Password12345";
$dbname = "garciad3_hellavapes";

// Create connection
$mysqli = new mysqli($servername, $username, $password, $dbname);

// Check connection
  
if ($mysqli == false) { 
    die("ERROR: Could not connect. " 
                          .$mysqli->connect_error); 
} 
  
$sql = "SELECT * FROM categories"; 
if ($res = $mysqli->query($sql)) { 
    if ($res->num_rows > 0) { 
        echo "<table>"; 
        echo "<tr>"; 
        echo "<th>Category ID</th>"; 
        echo "<th>Category Name</th>"; 
        echo "</tr>"; 
        while ($row = $res->fetch_array())  
        { 
            echo "<tr>"; 
            echo "<td>".$row['category_id']."</td>"; 
            echo "<td>".$row['category_name']."</td>";  
            echo "</tr>"; 
        } 
        echo "</table>"; 
        $res->free(); 
    } 
    else { 
        echo "No matching records are found."; 
    } 
} 
else { 
    echo "ERROR: Could not able to execute $sql. " 
                                             .$mysqli->error; 
} 
$mysqli->close(); 
?> 