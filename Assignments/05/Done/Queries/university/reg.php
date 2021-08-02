<?php 
	
	include "connect.php";

	$roll= $_GET['id'];
	$code= $_GET['code'];
	// echo $roll;
	// echo $cource_code;

	// if isset($_GET['id']){

		$qry4 = "INSERT INTO enrolled_courses(roll_no,course_code) values ('".$roll."','".$code."')";
		if($con->query($qry4)){
			 $message = "Student Register Succesfuly";
		}
		else {
			$message = "Student Register Unsuccesful";
		}
		header("Location:st_records.php?message=$message");
	// }
 ?>


