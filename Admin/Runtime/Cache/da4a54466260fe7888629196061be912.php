<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="off">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="Shortcut Icon" href="__ROOT__/favicon.ico" >
		<link rel="Bookmark" href="__ROOT__/favicon.ico" >
<script src="__PUBLIC__/js/jquery.js"></script>

<title>『拿回扣管理系统平台』</title>
<link href="__PUBLIC__/css/reset.css" rel="stylesheet" type="text/css" />
<link href="__PUBLIC__/css/zh-cn-system.css" rel="stylesheet"
	type="text/css" />
<script language="javascript" type="text/javascript"
	src="__PUBLIC__/js/jquery.min.js"></script>
<script language="javascript" type="text/javascript"
	src="__PUBLIC__/js/styleswitch.js"></script>
<link rel="stylesheet" type="text/css"
	href="__PUBLIC__/css/style/zh-cn-styles1.css" title="styles1"
	media="screen" />
<link rel="alternate stylesheet" type="text/css"
	href="__PUBLIC__/css/style/zh-cn-styles2.css" title="styles2"
	media="screen" />
<link rel="alternate stylesheet" type="text/css"
	href="__PUBLIC__/css/style/zh-cn-styles3.css" title="styles3"
	media="screen" />
<link rel="alternate stylesheet" type="text/css"
	href="__PUBLIC__/css/style/zh-cn-styles4.css" title="styles4"
	media="screen" />
<script type="text/javascript">
	var pc_hash = 'QGXBYD'
		function IsSure(){
		var mes=confirm("您确定要**吗？");
		if(mes==true){ do sth; }
		else{ do otherthings; }
		}
</script>
<style type="text/css">
.objbody {
	overflow: hidden;
}
</style>
<head>
<body scroll="no" class="objbody">
<div class="header">
	<div class="logo lf"><a href="" target="_blank"><span class="invisible"></span></a></div>
    <div class="rt-col"><div class="tab_style white cut_line text-r">
    	&nbsp;&nbsp;&nbsp;&nbsp;<!-- <img src="__PUBLIC__/images/u_zx1.gif"> 聊天</a><span>|</span><a href="#">官方网站</a><span> --><!--|</span><a href="javascript:;" onClick="show_config()">授权</a><span>|</span><a href="javascript:;" onClick="show_feedback()">问题反馈</a> <a href="http://bbs.515158.com/" target="_blank">问题反馈</a><span>|</span><a href="http://bbs.515158.com/" target="_blank">帮助？</a>-->
 <ul id="Skin">
                <li class="s4 styleswitch" rel="styles4"></li>
		
		<li class="s3 styleswitch" rel="styles3"></li>
       
	</ul>
        </div>
    </div>
    <div class="col-auto">
    	<div class="log white cut_line">您好！<span style="color:#FFF">|&nbsp;&nbsp;<?php echo ($_SESSION['loginUserName']); ?></span>&nbsp;&nbsp;<a href="javascript:_UpPwd('__APP__/Public/password')"><img src="../Public/images/checked_out.png" width="16" height="16" border="0" alt="" align="absmiddle"> [修改密码]</a>&nbsp;&nbsp;<a  onclick="return confirm('你确定退出吗？')" href="__APP__/Public/logout" >[退出]</a>&nbsp;&nbsp;&nbsp;&nbsp;
    	</div>
        <ul class="nav white" id="top_menu" >
			<?php if(is_array($nodeGroupList)): $i = 0; $__LIST__ = $nodeGroupList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$tag): ++$i;$mod = ($i % 2 )?><?php if($tag["id"] == 3): ?><li id="_M<?php echo ($tag["id"]); ?>" class="top_menu on"><span><a href="javascript:_M(<?php echo ($tag["id"]); ?>,'__APP__/<?php echo ($tag["url"]); ?>')" hidefocus="true" style="outline:none;"><?php echo ($tag["title"]); ?></a></span></li>
	           	<?php else: ?>
					<li id="_M<?php echo ($tag["id"]); ?>" class="top_menu "><span><a href="javascript:_M(<?php echo ($tag["id"]); ?>,'__APP__/<?php echo ($tag["url"]); ?>')" hidefocus="true" style="outline:none;"><?php echo ($tag["title"]); ?></a></span></li><?php endif; ?><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
    </div>
</div>

<div id="content">
	<div class="col-left left_menu">
    	<div id="Scroll"><div id="leftMain"></div></div>
        <a href="javascript:;" id="openClose" style="outline-style: none; outline-color: invert; outline-width: medium;" hideFocus="hidefocus" class="open" title="展开与关闭"><span class="hidden"></span></a>
    </div>
	<div class="col-1 lf cat-menu" id="display_center_id" style="display:none" height="100%">
	<div class="content">
        	<iframe name="center_frame" id="center_frame" src="" frameborder="false" scrolling="auto" style="border:none" width="100%" height="auto" allowtransparency="true"></iframe>
            </div>
			
        </div>
    <div class="col-auto mr8">
    <div class="crumbs">
    <div class="shortcut cu-span">
	
	</div>
    当前位置：<span id="current_pos">设置 > 后台用户管理</span></div>
    	<div class="col-1">
        	<div class="content" style="position:relative; overflow:hidden">
                <iframe name="right" id="rightMain" frameborder="false" src="__APP__/AdminUser/index" scrolling="auto" style="border:none; margin-bottom:20px" width="100%" height="auto" allowtransparency="true"></iframe>
				
                <div class="fav-nav">
					<div id="panellist">
					</div>
                    <div class="fav-help">
					<div id="status_text">
			
			</div>
					</div>
				</div>
        	</div>
        </div>
    </div>
</div>
<!--<ul class="tab-web-panel hidden" style="position:absolute; z-index:999; background:#fff">
	
<li style="margin:0"><a href="" target="_blank"></a></li>

</ul> -->
<div class="scroll"><a href="javascript:;" class="per" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(1);"></a><a href="javascript:;" class="next" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(2);"></a></div>

<script type="text/javascript"> 
if(!Array.prototype.map)
Array.prototype.map = function(fn,scope) {
  var result = [],ri = 0;
  for (var i = 0,n = this.length; i < n; i++){
	if(i in this){
	  result[ri++]  = fn.call(scope ,this[i],i,this);
	}
  }
return result;
};
 
var getWindowSize = function(){
return ["Height","Width"].map(function(name){
  return window["inner"+name] ||
	document.compatMode === "CSS1Compat" && document.documentElement[ "client" + name ] || document.body[ "client" + name ]
});
}
window.onload = function (){
	if(!+"\v1" && !document.querySelector) { // for IE6 IE7
	  document.body.onresize = resize;
	} else { 
	  window.onresize = resize;
	}
	function resize() {
		wSize();
		return false;
	}
}
function wSize(){
	//这是一字符串
	var str=getWindowSize();
	var strs= new Array(); //定义一数组
	strs=str.toString().split(","); //字符分割
	var heights = strs[0]-150,Body = $('body');$('#rightMain').height(heights);   
	//iframe.height = strs[0]-46;
	if(strs[1]<980){
		$('.header').css('width',980+'px');
		$('#content').css('width',980+'px');
		Body.attr('scroll','');
		Body.removeClass('objbody');
	}else{
		$('.header').css('width','auto');
		$('#content').css('width','auto');
		Body.attr('scroll','no');
		Body.addClass('objbody');
	}
	
	var openClose = $("#rightMain").height()+39;
	$('#center_frame').height(openClose+9);
	$("#openClose").height(openClose+30);	
	$("#Scroll").height(openClose-20);
	windowW();
}
wSize();
function windowW(){
	if($('#Scroll').height()<$("#leftMain").height()){
		$(".scroll").show();
	}else{
		$(".scroll").hide();
	}
}
windowW();
//站点下拉菜单
$(function(){
	var offset = $(".tab_web").offset();
	$(".tab_web").mouseover(function(){
			$(".tab-web-panel").css({ "left": +offset.left+4, "top": +offset.top+$('.tab_web').height()+2});
			$(".tab-web-panel").show();
		});
	$(".tab_web span").mouseout(function(){hidden_site_list_1()});
	$(".tab-web-panel").mouseover(function(){clearh();$('.tab_web a').addClass('on')}).mouseout(function(){hidden_site_list_1();$('.tab_web a').removeClass('on')});
	//默认载入左侧菜单
	$("#leftMain").load("__APP__/Public/menu");
})

//隐藏站点下拉。
var s = 0;
var h;
function hidden_site_list() {
	s++;
	if(s>=3) {
		$('.tab-web-panel').hide();
		clearInterval(h);
		s = 0;
	}
}
function clearh(){
	if(h)clearInterval(h);
}
function hidden_site_list_1() {
	h = setInterval("hidden_site_list()", 1);
}
 
//左侧开关
$("#openClose").click(function(){
	if($(this).data('clicknum')==1) {
		$("html").removeClass("on");
		$(".left_menu").removeClass("left_menu_on");
		$(this).removeClass("close");
		$(this).data('clicknum', 0);
		$(".scroll").show();
	} else {
		$(".left_menu").addClass("left_menu_on");
		$(this).addClass("close");
		$("html").addClass("on");
		$(this).data('clicknum', 1);
		$(".scroll").hide();
	}
	return false;
});

function _UpPwd(targetUrl) {
	$("#rightMain").attr('src', targetUrl);
}
 
function _M(menuid,targetUrl) {
	$("#menuid").val(menuid);
	$("#bigid").val(menuid);
	$("#paneladd").html('<a class="panel-add" href="javascript:add_panel();"><em>添加</em></a>');
	
		$("#leftMain").load("__APP__/Public/menu?menuid="+menuid, {limit: 25}, function(){
		   windowW();
		 });
	$("#rightMain").attr('src', targetUrl);
	$('.top_menu').removeClass("on");
	$('#_M'+menuid).addClass("on");
	$.get("__URL__/groupPosition?table=menu&name=menuname&menuid="+menuid, function(data){
		$("#current_pos").html(data);
	});
	//当点击顶部菜单后，隐藏中间的框架
	$('#display_center_id').css('display','none');
	//显示左侧菜单，当点击顶部时，展开左侧
	$(".left_menu").removeClass("left_menu_on");
	$("#openClose").removeClass("close");
	$("html").removeClass("on");
	$("#openClose").data('clicknum', 0);
	$("#current_pos").data('clicknum', 1);
}
function _Mp(menuid) {
	$.get("__APP__/Index/nodePosition?table=menu&name=menuname&menuid="+menuid, function(data){
		$("#current_pos").html(data);
	});
	
}
function menuScroll(num){
	var Scroll = document.getElementById('Scroll');
	if(num==1){
		Scroll.scrollTop = Scroll.scrollTop - 60;
	}else{
		Scroll.scrollTop = Scroll.scrollTop + 60;
	}
}

function show_config()
{
   mytop=(screen.availHeight-430)/2;
   myleft=(screen.availWidth-600)/2;
   window.open("inc/config.php","","height=450,width=600,status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top="+mytop+",left="+myleft+",resizable=yes");
}
function show_feedback()
{
   mytop=(screen.availHeight-430)/2;
   myleft=(screen.availWidth-600)/2;
   window.open("inc/Message.php","","height=450,width=600,status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top="+mytop+",left="+myleft+",resizable=yes");
}
function show_userback()
{
   mytop=(screen.availHeight-370)/2;
   myleft=(screen.availWidth-312)/1;
   window.open("inc/online.php","","height=490,width=300,status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top="+mytop+",left="+myleft+",resizable=yes");
}
online_mon();
//-- 在线人员 --
function online_mon()
{
   jQuery.ajax({
      type: 'GET',
      url: 'inc/user_count.php?date='+new Date(),
      success: function(data){
	  //$('user_count').innerHTML = data;
	  $("#user_count").html(data);
      }
   });
   window.setTimeout(online_mon,120*5*1000);
}
//消息提示,设定标题提示
var newSmsSoundHtml = "<object id='sms_sound' classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='__PUBLIC__/default/swf/swflash.cab' width='0' height='0'><param name='movie' value='__PUBLIC__/default/swf/9.swf'><param name=quality value=high><embed id='sms_sound' src='__PUBLIC__/default/swf/9.swf' width='0' height='0' quality='autohigh' wmode='opaque' type='application/x-shockwave-flash' plugspace='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash'></embed></object>";

sms_count();
function sms_count(type)
{
   jQuery.ajax({
      type: 'GET',
      url: 'inc/sms_count.php?date='+new Date(),
      success: function(data){
	  	if(data=='1'){
	  		//jQuery('#shortcut').click();
	  		$('#sms_count').html('<img src="__PUBLIC__/images/xin.gif">');
	  		$('#sms_sound').html(newSmsSoundHtml);
			//$("#sms_num").html(data);
			//alert(data);
	  	}else{
	 		 $('#sms_count').html('  ');
	  	}
      }
   });

   window.setTimeout(sms_count,10*5*1000);
}
sms_num();
function sms_num(type)
{
   jQuery.ajax({
      type: 'GET',
      url: 'inc/sms_count_num.php?date='+new Date(),
      success: function(data){
	  	$("#sms_num").html(data);
      }
   });

   window.setTimeout(sms_num,10*5*1000);
}
//-- 免费版本广告 --
function StatusTextScroll()
{
   var obj = jQuery('#status_text');
   var scrollTo = obj.scrollTop() + obj.height();
   if(scrollTo >= obj.attr('scrollHeight'))
      scrollTo = 0;
   obj.animate({scrollTop: scrollTo}, 300);
}

window.setInterval(StatusTextScroll,2000);

</script>
<script>        
            function sethighlight(n) {
                var lis = document.getElementsByTagName('span');
                for(var i = 0; i < lis.length; i++) {
                    lis[i].className = '';
                }
                lis[n].className = 'current';
            }
            sethighlight(0);
        </script>
<div id="sms_sound"></div>
</body>
</html>