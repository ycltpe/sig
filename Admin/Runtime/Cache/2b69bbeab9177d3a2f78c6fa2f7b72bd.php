<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html>
    <head>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/style.css">
        	<link rel="stylesheet" href="../Public/demo/css/style.css" type="text/css" media="all" />
            <script language="javascript" type="text/javascript" src="__PUBLIC__/js/Validform/jquery-1.9.1.min.js"></script>
            <script language="javascript" type="text/javascript" src="__PUBLIC__/js/Validform/Validform_v5.3.2.js"></script>
            <script src="__PUBLIC__/js/admincp.js?SES" type="text/javascript"></script>
            <script type="text/javascript">
				$(function(){
					//$(".registerform").Validform();  //就这一行代码！;
					//$.Tipmsg.r=" ";//更改默认提示信息;
					$(".registerform").Validform({
						tiptype:3,
						showAllError:false
					});
				})
			</script>
            <title>拿回扣</title>
    </head>
    <body>
        <table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="small">
            <tr>
                <td align="left" class="Big"><img src="__PUBLIC__/images/notify_new.gif" align="absmiddle"><span class="big3"> 编辑商品信息</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span style="font-size:12px;"><a href="__URL__" style="font-size:12px;">返回商品列表</a><img src="__PUBLIC__/images/f_ico.png" align="absmiddle"></span>
                </td>
            </tr>
        </table>
        <form name="save" class="registerform" method="post" action="__URL__/update" enctype="multipart/form-data">
            <table class="TableBlock" border="0" width="90%" align="center">
            	<tr>
                    <td align="left" class="TableContent" width="15%"> 商品LOGO：</td>
                    <td align="left" class="TableData">
                    	<img src="__ROOT__/<?php echo ($vo["logo"]); ?>" alt="" style="width: 50px;height: 50px;" />
                        <input type="file" class="inputxt" id="logo" name="logo" datatype="/^.*?\.(jpg|png|bmp)$/" ignore="ignore" nullmsg="请选择图片！" errormsg="图片格式不正确！"/>&nbsp;&nbsp;<span style="font-size: 12px;">图片大小：61×61，格式仅限jpg、png、bmp</span> 
                    </td>
                </tr>
            	<tr>
                    <td align="left" class="TableContent" width="15%"> 商品名称（中文）：</td>	
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="cn_name" name="cn_name" value="<?php echo ($vo["cn_name"]); ?>" datatype="*" nullmsg="请输入商品名称（中文）！" errormsg="请输入商品名称（中文）！" > <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 商品名称（英文）：</td>	
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="en_name" name="en_name" value="<?php echo ($vo["en_name"]); ?>" datatype="*" nullmsg="请输入商品名称（英文）！" errormsg="请输入商品名称（英文）！" > <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 品牌：</td>
                    <td align="left" class="TableData">
                        <SELECT name="brand_id" datatype="*" nullmsg="请选择品牌！">
				    		<?php if(is_array($brandList)): $i = 0; $__LIST__ = $brandList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$volist): ++$i;$mod = ($i % 2 )?><option <?php if(($vo["brand_id"])  ==  $volist["id"]): ?>selected<?php endif; ?> value="<?php echo ($volist["id"]); ?>"><?php echo ($volist["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
				        </SELECT> <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 种类：</td>
                    <td align="left" class="TableData">
                        <SELECT name="category_id" datatype="*" nullmsg="请选择种类！">
				    		<?php if(is_array($categoryList)): $i = 0; $__LIST__ = $categoryList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$volist): ++$i;$mod = ($i % 2 )?><option <?php if(($vo["brand_id"])  ==  $volist["id"]): ?>selected<?php endif; ?> value="<?php echo ($volist["id"]); ?>"><?php echo ($volist["cn_name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
				        </SELECT> <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 所属商店：</td>
                    <td align="left" class="TableData">
                        <SELECT name="store_id" datatype="*" nullmsg="请选择商店！">
				    		<?php if(is_array($storeList)): $i = 0; $__LIST__ = $storeList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$volist): ++$i;$mod = ($i % 2 )?><option <?php if(($vo["store_id"])  ==  $volist["id"]): ?>selected<?php endif; ?> value="<?php echo ($volist["id"]); ?>"><?php echo ($volist["cn_name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
				        </SELECT> <div style="display:inline;" class="Validform_checktip"></div>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 呈现返利比例：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="user_rebates" name="user_rebates" value="<?php echo ($vo["user_rebates"]); ?>" datatype="/^\d+(\.\d{1,2})?$/" nullmsg="请输入呈现返利比例！" errormsg="请输入数字，且最多有两位小数！" >% <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> VIP用户返利比例：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="vip_rebates" name="vip_rebates" value="<?php echo ($vo["vip_rebates"]); ?>" datatype="/^\d+(\.\d{1,2})?$/" nullmsg="请输入VIP用户返利比例！" errormsg="请输入数字，且最多有两位小数！" >% <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 商家返利比例：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="rebates" name="rebates" value="<?php echo ($vo["rebates"]); ?>" datatype="/^\d+(\.\d{1,2})?$/" nullmsg="请输入商家返利比例！" errormsg="请输入数字，且最多有两位小数！" >% <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 商品价格：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="price" name="price" value="<?php echo ($vo["price"]); ?>" datatype="/^\d+(\.\d{1,2})?$/" nullmsg="请输入商品价格！" errormsg="请输入数字，且最多有两位小数！" >英镑   <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr align="center" class="TableControl">
                    <td colspan="2" nowrap height="35">
                        <!-- onclick="sendForm();" -->
                        <input type="hidden" class="medium bLeft" name="id" value="<?php echo ($vo["id"]); ?>">
                        <input type="submit" name="Submit" value="保存信息" class="BigButton" >      </td>
                </tr>
            </table>
        </form>
    </body>
</html>