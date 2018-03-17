<?php
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    header('Access-Control-Allow-Methods: GET, POST, PUT,DELETE');
    // 连接数据库名称
    $mysql_conf = array(
        'host'    => '127.0.0.1', 
        'db'      => 'news', 
        'db_user' => 'root', 
        'db_pwd'  => '', 
        );
    $mysqli = @new mysqli($mysql_conf['host'], $mysql_conf['db_user'], $mysql_conf['db_pwd']);
    //诊断连接错误
    if ($mysqli->connect_errno) {
        die("could not connect to the database:\n" . $mysqli->connect_error);
    }
    $mysqli->query("set names 'utf8';");
    //连接数据库
    $select_db = $mysqli->select_db($mysql_conf['db']);
    if (!$select_db) {
        die("could not connect to the db:\n" .  $mysqli->error);
    }
    // 前端传过来的用户名、密码
    $username = $_POST['username'];
    $pwd = $_POST['pwd'];
    // 查出这个用户名
    $sql = "select * from t_user where username="."'$username'";
    $result = $mysqli->query($sql);
    $rs = $result->fetch_object();
    if ($rs!=null) {
      if ($pwd != $rs->password) {
        $arr = array('status' => 2, 'msg' => '密码错误');
        echo json_encode($arr);
      }
      else {
        $arr = array('status' => 1, 'msg' => '登录成功','user_id' =>$rs->user_id);
        echo json_encode($arr);
      }
    }
    else{
      $arr = array('status' => 0, 'msg' => '此用户还没注册');
      echo json_encode($arr);
    }
?>










