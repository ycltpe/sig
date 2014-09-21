<?php
// 定丿ThinkPHP框架路径
define('THINK_PATH', './ThinkPHP/');
//定丿项目名称和路径
define('APP_NAME', 'Home');
define('APP_PATH', './Home/');
//define('APP_DEBUG', true);
// 加载框架入口文件
require(THINK_PATH."/ThinkPHP.php");
//实例化一个网站应用实例
App::run();
?>