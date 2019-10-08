<?php

  header('content-type:text/html;charset=utf-8;');

  $username = $_POST['username'];
  $password = $_POST['password'];

  # 不去查询数据库

  if ($username === 'admin' && $password === '123456') {
    echo '登录成功';
  } else {
    echo '用户名或密码错误';
  }

?>
