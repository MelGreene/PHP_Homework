<?php
/* Attempt MySQL server connection.
connecting */
$link = mysqli_connect("localhost", "root", "root", "Transcript");
 
// Check connection-make sure it works
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
// Escape user inputs for security
$Instructor_Name = mysqli_real_escape_string($link, $_POST['instructorname']);
$Location = mysqli_real_escape_string($link, $_POST['location']);
$PhoneNumber = mysqli_real_escape_string($link, $_POST['phonenumber']);
 
// attempt insert query execution
//insert data into table
$sql = "INSERT INTO instructor (Instructor_Name, Location, PhoneNumber) VALUES ('$Instructor_Name', '$Location', '$PhoneNumber')";
if(mysqli_query($link, $sql)){
    echo "Records added successfully.";
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}
 
// close connection
mysqli_close($link);
?>