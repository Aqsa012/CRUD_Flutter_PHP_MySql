<?php

include 'conn.php';
$id=$_POST['id'];
$name=$_POST['name'];
$email=$_POST['email'];
$mobile=$_POST['mobile'];
$skill=$_POST['skill'];
$bloodgroup=$_POST['bloodgroup'];
$address=$_POST['address'];

$conn->query("update crud
 set id='".$id."',name='".$name."',email='".$email."',mobile='".$mobile."',skill='".$skill."',bloodgroup='".$bloodgroup."',address='".$address."' 
where id='".$id."'");

?>
