<?php 


	include "connect.php";
 

echo "hello";

$code = $_POST["c_code"];
$cName = $_POST["c_name"];

$qry  = "INSERT INTO courses (course_code,course_name)values('".$code."','".$cName."')";

if ($con->query($qry)) {
		$msg = "New course Enter";
	}
	else
	{
		$msg = "Error!";
	}
	echo $msg;
 ?>