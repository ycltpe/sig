<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>

<script type="text/javascript"> 
$(".switchs").each(function(i){
	var ul = $(this).parent().next();
	$(this).click(
	function(){
		if(ul.is(':visible')){
			ul.hide();
			$(this).removeClass('on');
				}else{
			ul.show();
			$(this).addClass('on');
		}
	})
});

</script>
<body>
<?php if(is_array($tagname)): foreach($tagname as $key=>$vo): ?><?php if($vo["id"] == 90): ?><h2 class="f14"><span class='cu' title='点击操作'>---</span>客户端</h2>
     	<h3 class="f14"><span class='cu' title='点击操作'></span><a href="__APP__/<?php echo ($vo["url"]); ?>" target="right" hidefocus='true' style='outline: none;' onclick="javascript: _Mp(<?php echo ($vo["id"]); ?>)"><?php echo ($vo["title"]); ?></a></h3>
    <?php elseif($vo["id"] == 105): ?>
    	<h2 class="f14"><span class='cu' title='点击操作'>---</span>商家端</h2>
     	<h3 class="f14"><span class='cu' title='点击操作'></span><a href="__APP__/<?php echo ($vo["url"]); ?>" target="right" hidefocus='true' style='outline: none;' onclick="javascript: _Mp(<?php echo ($vo["id"]); ?>)"><?php echo ($vo["title"]); ?></a></h3>
    <?php elseif($vo["id"] == 113): ?>
    	<h2 class="f14"><span class='cu' title='点击操作'>---</span>分类设置</h2>
     	<h3 class="f14"><span class='cu' title='点击操作'></span><a href="__APP__/<?php echo ($vo["url"]); ?>" target="right" hidefocus='true' style='outline: none;' onclick="javascript: _Mp(<?php echo ($vo["id"]); ?>)"><?php echo ($vo["title"]); ?></a></h3>
    <?php elseif($vo["id"] == 119): ?>
    	<h2 class="f14"><span class='cu' title='点击操作'>---</span>客户端</h2>
     	<h3 class="f14"><span class='cu' title='点击操作'></span><a href="__APP__/<?php echo ($vo["url"]); ?>" target="right" hidefocus='true' style='outline: none;' onclick="javascript: _Mp(<?php echo ($vo["id"]); ?>)"><?php echo ($vo["title"]); ?></a></h3>
    <?php elseif($vo["id"] == 124): ?>
    	<h2 class="f14"><span class='cu' title='点击操作'>---</span>商家端</h2>
     	<h3 class="f14"><span class='cu' title='点击操作'></span><a href="__APP__/<?php echo ($vo["url"]); ?>" target="right" hidefocus='true' style='outline: none;' onclick="javascript: _Mp(<?php echo ($vo["id"]); ?>)"><?php echo ($vo["title"]); ?></a></h3>
    <?php elseif($vo["id"] == 128): ?>
    	<h2 class="f14"><span class='cu' title='点击操作'>---</span>客户端</h2>
     	<h3 class="f14"><span class='cu' title='点击操作'></span><a href="__APP__/<?php echo ($vo["url"]); ?>" target="right" hidefocus='true' style='outline: none;' onclick="javascript: _Mp(<?php echo ($vo["id"]); ?>)"><?php echo ($vo["title"]); ?></a></h3>
    <?php elseif($vo["id"] == 132): ?>
    	<h2 class="f14"><span class='cu' title='点击操作'>---</span>商家端</h2>
     	<h3 class="f14"><span class='cu' title='点击操作'></span><a href="__APP__/<?php echo ($vo["url"]); ?>" target="right" hidefocus='true' style='outline: none;' onclick="javascript: _Mp(<?php echo ($vo["id"]); ?>)"><?php echo ($vo["title"]); ?></a></h3>
    <?php elseif($vo["id"] == 135): ?>
    	<h2 class="f14"><span class='cu' title='点击操作'>---</span>客户端</h2>
     	<h3 class="f14"><span class='cu' title='点击操作'></span><a href="__APP__/<?php echo ($vo["url"]); ?>" target="right" hidefocus='true' style='outline: none;' onclick="javascript: _Mp(<?php echo ($vo["id"]); ?>)"><?php echo ($vo["title"]); ?></a></h3>
    <?php elseif($vo["id"] == 137): ?>
    	<h2 class="f14"><span class='cu' title='点击操作'>---</span>商家端</h2>
     	<h3 class="f14"><span class='cu' title='点击操作'></span><a href="__APP__/<?php echo ($vo["url"]); ?>" target="right" hidefocus='true' style='outline: none;' onclick="javascript: _Mp(<?php echo ($vo["id"]); ?>)"><?php echo ($vo["title"]); ?></a></h3>
   	<?php else: ?>
		<h3 class="f14"><span class='cu' title='点击操作'></span><a href="__APP__/<?php echo ($vo["url"]); ?>" target="right" hidefocus='true' style='outline: none;' onclick="javascript: _Mp(<?php echo ($vo["id"]); ?>)"><?php echo ($vo["title"]); ?></a></h3><?php endif; ?><?php endforeach; endif; ?>
<script type="text/javascript"> 
function _Mp(menuid,targetUrl) {
	$.get("__APP__/Index/nodePosition?table=menu&name=menuname&menuid="+menuid, function(data){
		$("#current_pos").html(data);
	});
	
}
</script>
</body>

</html>