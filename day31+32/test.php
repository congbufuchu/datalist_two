<?php
include '../day31/06.php';

$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT * FROM 'ceshi1913' WHERE `username` = '$username' AND `password` = '$password'";

