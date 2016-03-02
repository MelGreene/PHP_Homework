<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "transcript";

// Create connection
$link = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$link) {
    die("Connection failed: " . mysqli_connect_error());
}

$search= mysqli_real_escape_string($link,$_GET['q']);
$sql = "SELECT * FROM `Instructor` WHERE `Instructor_Name` LIKE ('%$search%')";
$result = mysqli_query($link, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
    	$opt = $row["Instructor_Name"];
     	echo "<option value='$opt'>";
    }
} else {
    echo "0 results";
}

mysqli_close($link);
?>