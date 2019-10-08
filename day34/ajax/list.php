<?php

  header('content-type:text/html;charset=utf-8;');

  $conn = mysql_connect('localhost', 'root', 'root');
  mysql_select_db('ceshi1913');

  $res = mysql_query('SELECT * FROM `user`');

  if (!$res) {
    die('error for mysql: ' . mysql_error());
  }

  $arr = array();
  while ($row = mysql_fetch_assoc($res)) {
    array_push($arr, $row);
  }

  echo json_encode($arr);
?>
