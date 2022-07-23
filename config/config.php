<?php
//turn on out put buffering

ob_start();

/* 
    AKSHIT
    19BCE0795
    9-11-2021
*/


$timezone = date_default_timezone_set("Asia/Kolkata");

$con = mysqli_connect("localhost","root","","socialmedia_db");


if(mysqli_connect_errno())
{
	echo "Fail to connect: " . mysqli_connect_errno();
}
session_start();
?>