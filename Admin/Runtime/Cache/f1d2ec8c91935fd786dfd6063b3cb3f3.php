<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html>
    <head>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
        <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/style.css">
        	<link rel="stylesheet" href="../Public/demo/css/style.css" type="text/css" media="all" />
            <script language="javascript" type="text/javascript" src="__PUBLIC__/js/Validform/jquery-1.9.1.min.js"></script>
            <script language="javascript" type="text/javascript" src="../Public/Js/datepicker/WdatePicker.js"></script>
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
				
				function openPic(picUrl)
				{
					window.open(picUrl, "收据","height=650, width=450, top=0, left=0,toolbar=no, menubar=no,resizable=no,location=no,status=no");
				}
				
				function openInfo(infoUrl)
				{
					window.open(infoUrl, "购物信息","height=450, width=750, top=0, left=0,toolbar=no, menubar=no,resizable=no,location=no,status=no");
				}
				
				function changePercent(percent)
				{
					//找到购物金额
					var amount = document.getElementById('amount').value;
					//找到商家返利金额
					var store_rebate = document.getElementById('store_rebate').value;
					//定义顾客返利金额
					var rebate = amount*percent/100;
					//定义利润
					var profit = (store_rebate-rebate).toFixed(2);
					//查找呈现用户返利金额控件
					var rebate_txt = document.getElementById('rebate');
					rebate_txt.value=rebate;
					//查找利润控件
					var profit_txt = document.getElementById('profit');
					profit_txt.value=profit;
				}
				
				function changeStorePercent(percent)
				{
					//找到购物金额
					var amount = document.getElementById('amount').value;
					//找到顾客返利金额
					var rebate = document.getElementById('rebate').value;
					//定义商家返利金额
					var store_rebate = amount*percent/100;
					//定义利润
					var profit = (store_rebate-rebate).toFixed(2);
					//查找商家提供返利金额控件
					var store_rebate_txt = document.getElementById('store_rebate');
					store_rebate_txt.value=store_rebate;
					//查找利润控件
					var profit_txt = document.getElementById('profit');
					profit_txt.value=profit;
				}
			</script>
            <title>拿回扣</title>
    </head>
    <body>
        <table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="small">
            <tr>
                <td align="left" class="Big"><img src="__PUBLIC__/images/notify_new.gif" align="absmiddle"><span class="big3"> 编辑订单</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span style="font-size:12px;"><a href="__URL__" style="font-size:12px;">返回订单列表</a><img src="__PUBLIC__/images/f_ico.png" align="absmiddle"></span>
                </td>
            </tr>
        </table>
        <form name="save" class="registerform" method="post" action="__URL__/update">
            <table class="TableBlock" border="0" width="90%" align="center">
            	 <tr>
                    <td align="left" class="TableContent" width="15%"> 订单号：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="order_no" name="order_no" value="<?php echo ($vo["order_no"]); ?>" disabled="disabled"/>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> ID：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="user_id" name="user_id" value="<?php echo ($vo["user_id"]); ?>" disabled="disabled"/>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 姓名：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="u_name" name="u_name" value="<?php echo ($u["name"]); ?>" disabled="disabled"/>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 性别：</td>
                    <td align="left" class="TableData">
                        <SELECT class="BigInput" name="u_sex" id="u_sex" disabled="disabled">
							<option <?php if(($u_sex)  ==  "1"): ?>selected<?php endif; ?> value="1">男</option>
							<option <?php if(($u_sex)  ==  "2"): ?>selected<?php endif; ?> value="2">女</option>
						</SELECT>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 年龄：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="u_age" name="u_age" value="<?php echo ($u["age"]); ?>" disabled="disabled"/>
                    </td>	
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 购物时间：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" style="cursor:pointer;" id="shopping_time" name="shopping_time" value="<?php echo (toDate($vo["shopping_time"],'Y-m-d H:i:s')); ?>" onClick="WdatePicker({dateFmt:'yyyy-MM-dd H:mm:ss'})" datatype="*" nullmsg="请选择购物时间！" errormsg="请选择购物时间！" /> <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
            	 <tr>
                    <td align="left" class="TableContent" width="15%"> 地址：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="store_address" name="store_address" value="<?php echo ($s["cn_address"]); ?>" disabled="disabled"/> 
                    </td>
                 </tr>
                 <tr>
                    <td align="left" class="TableContent" width="15%"> 购物商品：</td>
                    <td align="left" class="TableData">
                        <a href="javascript:openInfo('__URL__/commodityListBySmall/id/<?php echo ($vo["id"]); ?>');">购物商品信息</a>
                    </td>
                 </tr>
                 <tr>
                    <td align="left" class="TableContent" width="15%"> 购物金额：</td>
                    <td align="left" class="TableData">
                        	￡<input type="text" class="BigInput" id="amount" name="amount" value="<?php echo ($vo["amount"]); ?>" datatype="/^\d+(\.\d{1,2})?$/" nullmsg="请输入购物金额！" errormsg="输入格式不正确！" /> <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                 </tr>
                 <tr>
                    <td align="left" class="TableContent" width="15%">商家状态：</td>
                    <td align="left" class="TableData">
                        <SELECT class="BigInput" name="type" id="type" datatype="*" nullmsg="请选择商家状态！" errormsg="请选择商家状态！">
							<option <?php if(($vo["type"])  ==  "1"): ?>selected<?php endif; ?> value="1">未确认</option>
							<option <?php if(($vo["type"])  ==  "2"): ?>selected<?php endif; ?> value="2">已确认</option>
							<option <?php if(($vo["type"])  ==  "3"): ?>selected<?php endif; ?> value="3">争议</option>
							<option <?php if(($vo["type"])  ==  "4"): ?>selected<?php endif; ?> value="4">已结款</option>
						</SELECT>  <div style="display:inline;" class="Validform_checktip"></div> 
					</td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%">用户状态：</td>
                    <td align="left" class="TableData">
                        <SELECT class="BigInput" name="status" id="status" datatype="*" nullmsg="请选择用户状态！" errormsg="请选择用户状态！">
							<option <?php if(($vo["status"])  ==  "1"): ?>selected<?php endif; ?> value="1">上传收据</option>
							<option <?php if(($vo["status"])  ==  "2"): ?>selected<?php endif; ?> value="2">等待确认</option>
							<option <?php if(($vo["status"])  ==  "3"): ?>selected<?php endif; ?> value="3">等待回扣</option>
							<option <?php if(($vo["status"])  ==  "4"): ?>selected<?php endif; ?> value="4">回扣成功</option>
						</SELECT>  <div style="display:inline;" class="Validform_checktip"></div> 
					</td>
                </tr>
                 <tr>
                    <td align="left" class="TableContent" width="15%"> 呈现用户返利比例：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="percent" name="percent" value="<?php echo ($vo["percent"]); ?>" onblur="changePercent(this.value);" datatype="/^\d+(\.\d{1,2})?$/" nullmsg="请输入商家提供返利比例！" errormsg="输入格式不正确！" />% <div style="display:inline;" class="Validform_checktip"></div>
                    </td>
                 </tr>
                 <tr>
                    <td align="left" class="TableContent" width="15%"> 商家提供返利比例：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="store_percent" name="store_percent" value="<?php echo ($vo["store_percent"]); ?>" onblur="changeStorePercent(this.value);" datatype="/^\d+(\.\d{1,2})?$/" nullmsg="请输入商家提供返利比例！" errormsg="输入格式不正确！" />% <div style="display:inline;" class="Validform_checktip"></div>
                    </td>
                 </tr>
                 <tr>
                    <td align="left" class="TableContent" width="15%"> 呈现用户返利金额：</td>
                    <td align="left" class="TableData">
                        	￡<input type="text" class="BigInput" id="rebate" name="rebate" value="<?php echo ($vo["rebate"]); ?>" disabled="disabled"/>	注：该值根据每个商品的价格和每个返利比例自动计算并求和。 
                    </td>
                 </tr>
                 <tr>
                    <td align="left" class="TableContent" width="15%"> 商家提供返利金额：</td>
                    <td align="left" class="TableData">
                        	￡<input type="text" class="BigInput" id="store_rebate" name="store_rebate" value="<?php echo ($vo["store_rebate"]); ?>" disabled="disabled"/>	注：该值根据购物金额和商家提供返利比例自动计算。
                    </td>
                 </tr>
                 <tr>
                    <td align="left" class="TableContent" width="15%"> 利润：</td>
                    <td align="left" class="TableData">
                        	￡<input type="text" class="BigInput" id="profit" name="profit" value="<?php echo ($profit); ?>" disabled="disabled"/>	注：该值根据呈现用户返利金额和商家提供返利金额自动计算。
                    </td>
                 </tr>
                 <tr>
                    <td align="left" class="TableContent" width="15%"> 收据：</td>
                    <td align="left" class="TableData">
                        <a href="javascript:openPic('__ROOT__/<?php echo ($vo["receipt_pic"]); ?>');" style="border: 0px;"><img src="__ROOT__/<?php echo ($vo["receipt_pic_small"]); ?>" style="width: 50px;height: 50px;"/></a> 
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