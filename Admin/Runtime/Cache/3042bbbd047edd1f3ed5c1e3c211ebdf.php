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
				
				//获取下拉列表选中项的值
				function getSelectedValue(name){
					var obj=document.getElementById(name);
					return obj.value;      //如此简单，直接用其对象的value属性便可获取到
				}
				
				function changeByStore(store)
				{
					var obj=document.getElementById("commodity_id");
					var obj_3=document.getElementById("commodityList");
					obj.options.length=0;
					var tOption1 = document.createElement("Option");
				    tOption1.text = "所有";
					tOption1.value = "0";
				    obj.add(tOption1);
					for(i=0;i<obj_3.length;i++){
						var obj_3_value = obj_3[i].value;
						var obj_3_innerHTML = obj_3[i].innerHTML;
						var a = 0;
						if(obj_3_value!="")
						{
							a = obj_3_value.substr(0,obj_3_value.indexOf("-"));
						}
					    if(a==store)
						{
							var tOption = document.createElement("Option");
						    tOption.text = obj_3_innerHTML;
						    if(obj_3_value!="")
							{
								tOption.value = obj_3_value.substr(obj_3_value.indexOf("-")+1);
							}
						    document.all("commodity_id").add(tOption);
						}
					}
					if(obj.options.length==0)
					{
						var tOption = document.createElement("Option");
					    tOption.text = "所有";
					    if(obj_3_value!="")
						{
							tOption.value = "0";
						}
					    document.all("commodity_id").add(tOption);
					}
				}
			</script>
            <title>拿回扣</title>
    </head>
    <body>
        <table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="small">
            <tr>
                <td align="left" class="Big"><img src="__PUBLIC__/images/arrow.gif" align="absmiddle"><span class="big3"> 全局返利管理</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
        </table>
        <SELECT name="commodityList" id="commodityList" style="display:none;">
			<?php if(is_array($commodityList)): $i = 0; $__LIST__ = $commodityList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$volist): ++$i;$mod = ($i % 2 )?><option value="<?php echo ($volist["store_id"]); ?>-<?php echo ($volist["id"]); ?>"><?php echo ($volist["cn_name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
		</SELECT>
        <form name="save" class="registerform" method="post" action="__URL__/setting">
            <table class="TableBlock" border="0" width="90%" align="center">
            	<tr class="TableControl">
                    <td colspan="2" nowrap height="35">
                    	返利设置
                    </td>
                </tr>
            	 <tr>
                    <td align="left" class="TableContent" width="15%">商店：</td>
                    <td align="left" class="TableData">
                        <SELECT id="store_id" name="store_id" onchange="changeByStore(value)">
                        	<option value="0">所有</option>
				    		<?php if(is_array($storeList)): $i = 0; $__LIST__ = $storeList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$volist): ++$i;$mod = ($i % 2 )?><option value="<?php echo ($volist["id"]); ?>"><?php echo ($volist["cn_name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
				        </SELECT>
                    </td>
                </tr>
            	 <tr>
                    <td align="left" class="TableContent" width="15%">商品：</td>
                    <td align="left" class="TableData">
                    	<SELECT class="BigInput" name="commodity_id" id="commodity_id">
							<option value="0">所有</option>
						</SELECT>
                    </td>
                 </tr>
                 <tr>
                    <td align="left" class="TableContent" width="15%">返利比例：</td>
                    <td align="left" class="TableData">
                    	<SELECT class="BigInput" name="type" id="type">
							<option value="1">增加</option>
							<option value="2">减少</option>
						</SELECT>
					</td>
                </tr>
                 <tr>
                    <td align="left" class="TableContent" width="15%">数值：</td>
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="rebate_num" name="rebate_num" value="" datatype="/^\d+(\.\d{1,2})?$/" nullmsg="请输入数值！" errormsg="输入格式不正确！">% <div style="display:inline;" class="Validform_checktip"></div>  
                    </td> 
                </tr>
                <tr align="center" class="TableControl">
                    <td colspan="2" nowrap height="35">
                        <!-- onclick="sendForm();" -->
                        <input type="submit" name="Submit" value="保存信息" class="BigButton" >      </td>
                </tr>
            </table>
        </form>
        <form name="save" class="registerform" method="post" action="__URL__/update">
            <table class="TableBlock" border="0" width="90%" align="center">
            	<tr class="TableControl">
                    <td colspan="2" nowrap height="35">
                    	用户分级设置
                    </td>
                </tr>
                <tr>
                    <td colspan="2" nowrap height="35">
                    	当用户消费金额大于等于
                    	<input type="text" class="BigInput" name="money" value="<?php echo ($vo["money"]); ?>" datatype="/^\d+(\.\d{1,2})?$/" nullmsg="请输入金额！" errormsg="输入格式不正确！"/>
                    	<select name="type">
                    		<option <?php if(($vo["type"])  ==  "1"): ?>selected<?php endif; ?> value="1">英镑</option>
                    		<option <?php if(($vo["type"])  ==  "2"): ?>selected<?php endif; ?> value="2">人民币</option>
                    	</select>
                    	时，该用户为VIP用户，使用VIP返利比例计算返利。 <div style="display:inline;" class="Validform_checktip"></div>
                    </td>
                </tr>
                <tr align="center" class="TableControl">
                    <td colspan="2" nowrap height="35">
                        <!-- onclick="sendForm();" -->
                        <input type="hidden" class="medium bLeft" name="id" value="<?php echo ($vo["id"]); ?>">
                        <input type="submit" name="Submit" value="保存信息" class="BigButton" ></td>
                </tr>
            </table>
        </form>
    </body>
</html>