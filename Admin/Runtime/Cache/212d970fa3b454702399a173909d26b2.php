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
                <td align="left" class="Big"><img src="__PUBLIC__/images/notify_new.gif" align="absmiddle"><span class="big3"> 新增菜单信息</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span style="font-size:12px;"><a href="__URL__" style="font-size:12px;">返回菜单列表</a><img src="__PUBLIC__/images/f_ico.png" align="absmiddle"></span>
                </td>
            </tr>
        </table>
        <form name="save" class="registerform" method="post" action="__URL__/update" enctype="multipart/form-data">
            <table class="TableBlock" border="0" width="90%" align="center">
                <tr>
                    <td align="left" class="TableContent" width="15%"> 菜单名称：</td>	
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="name" name="name" value="<?php echo ($vo["name"]); ?>" datatype="*" nullmsg="请输入菜单名称！" errormsg="请输入菜单名称！" > <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 菜单属性：</td>
                    <td align="left" class="TableData">
                        <SELECT name="channeltype" datatype="*" nullmsg="请选择菜单属性！">
                            <option value="">请选择菜单属性</option>
                            <option <?php if(($vo["channeltype"])  ==  "1"): ?>selected<?php endif; ?> value="1">最终列表菜单</option>
                            <option <?php if(($vo["channeltype"])  ==  "2"): ?>selected<?php endif; ?> value="2">频道封面</option>
                            <option <?php if(($vo["channeltype"])  ==  "3"): ?>selected<?php endif; ?> value="3">外部连接</option>
                        </SELECT> <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 菜单显示位置：</td>
                    <td align="left" class="TableData">
                        <SELECT name="position" datatype="*" nullmsg="请选择显示位置！">
                            <option <?php if(($vo["position"])  ==  "0"): ?>selected<?php endif; ?> value="0">默认显示</option>
                            <option <?php if(($vo["position"])  ==  "1"): ?>selected<?php endif; ?> value="1">不显示</option>
                            <option <?php if(($vo["position"])  ==  "2"): ?>selected<?php endif; ?> value="2">底部导航显示</option>
                        </SELECT> <div style="display:inline;" class="Validform_checktip"></div> 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 排序：</td>	
                    <td align="left" class="TableData">
                        <input type="text" class="BigInput" id="sortrank" name="sortrank" value="<?php echo ($vo["sortrank"]); ?>" > 
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 状态：</td>	
                    <td align="left" class="TableData">
                        <SELECT name="status">
                            <option <?php if(($vo["status"])  ==  "1"): ?>selected<?php endif; ?> value="1">显示</option>
                            <option <?php if(($vo["status"])  ==  "0"): ?>selected<?php endif; ?> value="0">隐藏</option>
                        </SELECT>
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