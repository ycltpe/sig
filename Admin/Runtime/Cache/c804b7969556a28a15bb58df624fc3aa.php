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
                <td align="left" class="Big"><img src="__PUBLIC__/images/notify_new.gif" align="absmiddle"><span class="big3"> 新增Banner</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span style="font-size:12px;"><a href="__URL__" style="font-size:12px;">返回Banner列表</a><img src="__PUBLIC__/images/f_ico.png" align="absmiddle"></span>
                </td>
            </tr>
        </table>
        <form name="save" class="registerform" method="post" action="__URL__/update" enctype="multipart/form-data">
            <table class="TableBlock" border="0" width="90%" align="center">
                <tr>
                    <td align="left" class="TableContent" width="15%">标题：</td>
                    <td align="left" class="TableData">
                        <input style="width: 200px;" type="text" class="BigInput" id="title" name="title" datatype="*" value="<?php echo ($vo["title"]); ?>" nullmsg="请输入Banner名称！" errormsg="请输入Banner名称！"/> <div style="display:inline;" class="Validform_checktip"></div>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%">小标题：</td>
                    <td align="left" class="TableData">
                        <input style="width: 200px;" type="text" class="BigInput" id="lit_title" name="lit_title" datatype="*" value="<?php echo ($vo["lit_title"]); ?>" nullmsg="请输入小标题！" errormsg="请输入小标题！"/> <div style="display:inline;" class="Validform_checktip"></div>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%">Banner图片：</td>
                    <td align="left" class="TableData">
                        <?php if(!empty($vo["image"])): ?><img src="__ROOT__/<?php echo ($vo["image"]); ?>" style="width:120px; height: auto;"/><?php endif; ?>
                        <input type="file" id="pic" name="pic" datatype="/^.*?\.(jpg|png|bmp)$/" ignore="ignore" nullmsg="请选择图片！" errormsg="图片格式不正确！"/>&nbsp;&nbsp;<span style="font-size: 12px;">格式仅限jpg、png、bmp</span>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="TableContent" width="15%"> 状态：</td>
                    <td align="left" class="TableData">
                        <SELECT name="status">
                                <option  value="1">显示</option>
                                <option  value="0">隐藏</option>
                        </SELECT> 
                    </td>
                </tr>
                <tr align="center" class="TableControl">
                    <td colspan="2" nowrap height="35">
                        <!-- onclick="sendForm();" -->
                        <input type="hidden" id="id" name="id" value="<?php echo ($vo["id"]); ?>"/>
                        <input type="submit" name="Submit" value="保存信息" class="BigButton" ></td>
                </tr>
            </table>
        </form>
    </body>
</html>