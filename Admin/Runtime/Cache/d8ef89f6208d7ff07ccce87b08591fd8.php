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
                <td align="left" class="Big"><img src="__PUBLIC__/images/notify_new.gif" align="absmiddle"><span class="big3"> 编辑商店信息</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span style="font-size:12px;"><a href="__URL__" style="font-size:12px;">返回商店列表</a><img src="__PUBLIC__/images/f_ico.png" align="absmiddle"></span>
                </td>
            </tr>
        </table>
        <form name="save" class="registerform" method="post" action="__URL__/update" enctype="multipart/form-data">
            <table class="TableBlock" border="0" width="90%" align="center">
            	<tr>
                    <td align="left" class="TableContent" width="15%"> 商店ID：</td>	
                    <td align="left" class="TableData">
                        <?php echo ($vo["id"]); ?>
                    </td>
                </tr>
            	<tr>
                    <td align="left" class="TableContent" width="15%"> 商店名称：</td>	
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="cn_name" name="cn_name" value="<?php echo ($vo["cn_name"]); ?>" datatype="*" nullmsg="请输入商店名称！" errormsg="请输入商店名称！" > <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 商店英文名称：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="en_name" name="en_name" value="<?php echo ($vo["en_name"]); ?>" datatype="*" nullmsg="请输入商店英文名称！" errormsg="请输入商店英文名称！" > <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 商店地址：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="cn_address" name="cn_address" value="<?php echo ($vo["cn_address"]); ?>" datatype="*" nullmsg="请输入商店地址！" errormsg="请输入商店地址！" > <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 简短说明：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="cn_description" name="cn_description" value="<?php echo ($vo["cn_description"]); ?>" datatype="*" nullmsg="请输入简短说明！" errormsg="请输入简短说明！" > <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 连锁商店详情：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="cn_detail" name="cn_detail" value="<?php echo ($vo["cn_detail"]); ?>" datatype="*" nullmsg="请输入连锁商店详情！" errormsg="请输入连锁商店详情！" > <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 经营范围：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="cn_scope_of_business" name="cn_scope_of_business" value="<?php echo ($vo["cn_scope_of_business"]); ?>" datatype="*" nullmsg="请输入经营范围！" errormsg="请输入经营范围！" > <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 联系方式：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="phone" name="phone" value="<?php echo ($vo["phone"]); ?>" datatype="*" nullmsg="请输入联系方式！" errormsg="请输入联系方式！" > <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 邮编：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="postcode" name="postcode" value="<?php echo ($vo["postcode"]); ?>" datatype="*" nullmsg="请输入邮编！" errormsg="邮编格式不正确！" > <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 地址：</td>
                    <td align="left" class="TableData">
                        <SELECT name="city_id" datatype="*" nullmsg="请选择地址！">
				    		<?php if(is_array($cityList)): $i = 0; $__LIST__ = $cityList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$volist): ++$i;$mod = ($i % 2 )?><option <?php if(($vo["city_id"])  ==  $volist["id"]): ?>selected<?php endif; ?> value="<?php echo ($volist["id"]); ?>"><?php echo ($volist["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
				        </SELECT> <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 商店经度：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="lng" name="lng" value="<?php echo ($vo["lng"]); ?>" datatype="*" nullmsg="请输入商店经度！" errormsg="请输入商店经度！" > <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 商店纬度：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="lat" name="lat" value="<?php echo ($vo["lat"]); ?>" datatype="*" nullmsg="请输入商店纬度！" errormsg="请输入商店纬度！" > <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> E-mail：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="email" name="email" value="<?php echo ($userInfo["username"]); ?>" disabled="disabled"/>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 商店LOGO：</td>
                    <td align="left" class="TableData">
                    	<img src="__ROOT__/<?php echo ($vo["logo"]); ?>" alt="" style="width: 50px;height: 50px;" />
                        <input type="file" class="inputxt" id="logo" name="logo" ignore="ignore" datatype="/^.*?\.(jpg|png|bmp)$/" nullmsg="请选择图片！" errormsg="图片格式不正确！"/>&nbsp;&nbsp;<span style="font-size: 12px;">图片大小：61×61，格式仅限jpg、png、bmp</span> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 商店图片：</td>
                    <td align="left" class="TableData">
                    	<img src="__ROOT__/<?php echo ($vo["pic"]); ?>" alt="" style="width: 50px;height: 50px;" />
                        <input type="file" class="inputxt" id="pic" name="pic" ignore="ignore" datatype="/^.*?\.(jpg|png|bmp)$/" nullmsg="请选择图片！" errormsg="图片格式不正确！"/>&nbsp;&nbsp;<span style="font-size: 12px;">图片大小：61×61，格式仅限jpg、png、bmp</span> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 小块图片：</td>
                    <td align="left" class="TableData">
                    	<img src="__ROOT__/<?php echo ($vo["pic_piece"]); ?>" alt="" style="width: 50px;height: 50px;" />
                        <input type="file" class="inputxt" id="pic_piece" name="pic_piece" ignore="ignore" datatype="/^.*?\.(jpg|png|bmp)$/" nullmsg="请选择图片！" errormsg="图片格式不正确！"/>&nbsp;&nbsp;<span style="font-size: 12px;">图片大小：61×61，格式仅限jpg、png、bmp</span> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 搜索关键词：</td>
                    <td align="left" class="TableData">
                        <TEXTAREA class="BigInput" name="keywords" rows="7" cols="40" datatype="*" nullmsg="请输入搜索关键词！" errormsg="请输入搜索关键词！" ><?php echo ($vo["keywords"]); ?></textarea>&nbsp;&nbsp;<span style="font-size: 12px;">每个关键词以逗号隔开。</span> <div style="display:inline;" class="Validform_checktip"></div>
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