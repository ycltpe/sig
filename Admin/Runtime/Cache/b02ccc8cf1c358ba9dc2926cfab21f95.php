<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="shortcut icon" href="favicon.ico" />
<title>首页</title>
<link href="css/style.css" rel="stylesheet" />
<style>
body{ background:#2460a0;}
</style>
</head>

<body onLoad="document.login.email.focus()" >
<form method="post" name="login" id="form1" >
<div id="content" style="padding-top:120px;">
	<div id="content_left" >
		<div class="content_l"></div>
		<dl>
			<dt><img src="../Public/images/ewm.png" /></dt>
			<dd>二维码下载</dd>
		</dl>
	</div>
    <div id="content_right">
		<div id="result" class="result none" style="margin-left:30px;"></div>
    	<div class="username" ><input type="text" name="username" value="" /></div>
        <div class="password"><input type="password" name="password" onKeyDown="keydown(event)" value="" /></div>
		<input type="hidden" name="ajax" value="1">
        <div class="btn"><input type="button" onClick="ThinkAjax.sendForm('form1','__URL__/checkLogin/',loginHandle,'result')" value="" /></div>
    </div>
</div>
</form>
<script src="../Public/js/jquery-1.8.min.js"></script>
<script src="../Public/js/script.js"></script>
<link rel="stylesheet" type="text/css" href="../Public/css/style.css" />
<script type="text/javascript" src="../Public/Js/Base.js"></script>
<script type="text/javascript" src="../Public/Js/prototype.js"></script>
<script type="text/javascript" src="../Public/Js/mootools.js"></script>
<script type="text/javascript" src="../Public/Js/Ajax/ThinkAjax.js"></script>
<script type="text/javascript" src="__PUBLIC__/Js/Form/CheckForm.js"></script>
<script type="text/javascript" src="../Public/Js/common.js"></script>
 <script language="JavaScript">
<!--
var PUBLIC	 =	 '../Public';
ThinkAjax.image = [	 '../Public/images/loading2.gif', '../Public/images/ok.gif','../Public/images/update.gif' ]
ThinkAjax.updateTip	=	'登录中～';
function loginHandle(data,status){
if (status==1)
{
$('result').innerHTML	=	'<span style="color:blue"><img SRC="../Public/images/ok.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="" align="absmiddle" > 登录成功！3 秒后跳转～</span>';
$('form1').reset();
window.location = '__APP__';
}
}
function keydown(e){
	var e = e || event;
	if (e.keyCode==13)
	{
	ThinkAjax.sendForm('form1','__URL__/checkLogin/',loginHandle,'result');
	}
}
function fleshVerify(type){ 
//重载验证码
var timenow = new Date().getTime();
if (type)
{
$('verifyImg').src= '__URL__/verify/adv/1/'+timenow;
}else{
$('verifyImg').src= '__URL__/verify/'+timenow;
}

}
//-->
</script>
</body>
</html>