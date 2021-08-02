<?php
	include "connect.php";
?>

<!DOCTYPE html>
<html>
<head>
	<title>Student's Record</title>
</head>
<body>
	<form action="" method="post">
		<table align="center">
			<th colspan="2">Search Student</th>
			<tr>
				<td>
					Roll No
				</td>
				<td>
					<input type="text" name="txtRNo" required>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="Search">
				</td>
			</tr>
		</table>
	</form>
	<?php
		if (isset($_GET['message'])) {
			$resr = "<div align=center><h2>".$_GET['message']."</h2></div>";
			echo $resr;
		}
		if (isset($_POST["txtRNo"])) {
		
			$roll = $_POST["txtRNo"];
			$qry = "SELECT * FROM student WHERE roll_no = '".$roll."'";
			$qry1 = "SELECT * from courses where course_code = any (select course_code from enrolled_courses where roll_no = '".$roll."')";
			$qry3 = "SELECT * from courses where course_code != all (select course_code from enrolled_courses where roll_no = '".$roll."')";
			$res = $con->query($qry);
			$res2 = $con->query($qry1);
			$res3 = $con->query($qry3);
			$result = "";

			if ($res->num_rows>0) {
				$result .= "<table align='center' boder = 1px>";
				$result .= "<th>Roll No</th><th>Name</th><th>Father's Name</th><th>Gender</th><th>Contact No</th><th>Address</th>";
				while ($row = $res->fetch_assoc()) 
				{
					//one row
					$result .= "<tr>
									<td>
										".$row['roll_no']."
									</td>
									<td>
										".$row['st_name']."
									</td>
									<td>
										".$row['f_name']."
									</td>
									<td>
										".$row['gender']."
									</td>
									<td>
										".$row['contact']."
									</td>
									<td>
										".$row['address']."
									</td>
								</tr>";
				}
				$result .= "</table>";
			}
			else{
				$result .= " Not register ";
			}
			if ($res2->num_rows>0) {
				$result .= "<hr><div align = center> Register Courses<hr><div>";
				$result .= "<table align='center' border = 1px>";
				$result .= "<th>Course No</th><th>Name</th><th>credits's Name</th>";
				while ($row = $res2->fetch_assoc()) 
				{
					//one row
					$result .= "<tr>
									<td>
										".$row['course_code']."
									</td>
									<td>
										".$row['course_name']."
									</td>
									<td>
										".$row['credit_hours']."
									</td>
									

								</tr>";
				}
				$result .= "</table>";
			}
			if ($res3->num_rows>0) {
				$result .= "<hr><div align = center> Available Courses<div>";

				$result .= "<hr><table align='center' border = 1px>";
				$result .= "<th>Course No</th><th>Name</th><th>credits's Name</th><th>Button</th>";
				while ($row = $res3->fetch_assoc()) 
				{
					//one row
					$result .= "<tr>
									<td>
										".$row['course_code']."
									</td>
									<td>
										".$row['course_name']."
									</td>
									<td>
										".$row['credit_hours']."
									</td>
									<td>
										<a href=reg.php?id=$roll&code=".$row['course_code']."> <input type=submit value=Enroll></a>
									</td>

								</tr>";
				}
				$result .= "</table>";
			}
			echo $result;
			//echo $result1;

		}

	?>
</body>
</html>