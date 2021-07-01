<?php
include 'conn.php';

$id=$_POST['id'];


$conn->query("delete from crud where id='".$id."'");



?>
