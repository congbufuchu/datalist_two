<?php
    $code = 100;
    $passcode = 200;

    echo $code;
    echo "<br/>";
    echo $passcode;
    echo "<br/>";
    var_dump("$code"+"$passcode");
    echo "<br/>";
    echo "$code"+"$passcode";
    echo "<br/>";
    if($code>200){
        echo "$code"+"$passcode";
    }else{
        echo "$code"-"$passcode";
    }