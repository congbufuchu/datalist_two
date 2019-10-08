<?php

  include '../server/base.php';

  // 获取 cookie 中 login 的值
  // isset 方法

  $login = '';

  if (isset($_COOKIE['login'])) {
    $login = $_COOKIE['login'];
  }

  // 判断 login 信息
  if (!$login) {
    // 判断有没有用户名密码信息

    $username = '';
    $password = '';

    if (isset($_COOKIE['username'])) {
      $username = $_COOKIE['username'];
    }

    if (isset($_COOKIE['password'])) {
      $password = $_COOKIE['password'];
    }

    if ($username && $password) {

      $res = mysql_query("SELECT * FROM `ceshi1913` WHERE `username`='$username' AND `password`='$password'");

      if (!$res) {
        die('error for mysql: ' . mysql_error());
      }

      $row = mysql_fetch_assoc($res);

      if (!$row) {
        header('location: ../pages/login.html');
      } else {
        // 设置 cookie
        setcookie('login', 1);
        setcookie('username', $username, time() + 30);
        setcookie('password', $password, time() + 30);
      }
    } else {
      header('location: ../pages/login.html');
    }
  }

?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
</head>
<body>
  <h1>我是购物车页面</h1>
</body>
</html>
