<?php

  include './base.php';

  $username = $_POST['username'];
  $password = $_POST['password'];

  $res = mysql_query("SELECT * FROM `ceshi1913` WHERE `username`='$username' AND `password`='$password'");

  if (!$res) {
    die('error for mysql: ' . mysql_error());
  }

  $row = mysql_fetch_assoc($res);

  if (!$row) {
    echo '用户名获取密码错误！';
  } else {
    // 设置 cookie
    setcookie('login', '1');
    setcookie('username', $username, time() + 30);
    setcookie('password', $password, time() + 30);

    header('location: ./cart.php');
  }

?>
