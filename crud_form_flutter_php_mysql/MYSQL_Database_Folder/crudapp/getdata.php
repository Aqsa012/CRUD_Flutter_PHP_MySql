<?php

include 'conn.php';

$sql=$conn->query("select * from crud");

$result=array();

while($fetchdata=$sql->fetch_assoc()){

	$result[]=$fetchdata;
}


echo json_encode($result);

?> 
