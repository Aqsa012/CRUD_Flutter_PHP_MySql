<?php

include 'conn.php';

$id=$_POST['id'];
$name=$_POST['name'];
$email=$_POST['email'];
$mobile=$_POST['mobile'];
$skill=$_POST['skill'];
$bloodgroup=$_POST['bloodgroup'];
$address=$_POST['address'];


$conn->query("INSERT into crud (id, name, email, mobile, skill, bloodgroup,address)
values('".$id."','".$name."','".$email."','".$mobile."','".$skill."','".$bloodgroup."','".$address."')");
?>
