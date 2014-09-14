<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>信息操作页面</title>
        <link type="text/css" media="screen" charset="utf-8" rel="stylesheet" href="__PUBLIC__/css/style.account-1.1.css" />
        <link charset="utf-8" rel="stylesheet" href="__PUBLIC__/css/personal.record-1.0.css" media="all" />
        <style type="text/css"> 
            .tip-faq{
                clear:both;
                margin-top:0px;
            }
            #J-table-consume{
                margin-bottom:40px;
            }
            .ui-form-tips .m-cue{
                background-position: -27px -506px;
                *background-position: -27px -505px;
            }
            #J-set-date a{
                font-family:宋体;
            }
        </style>
        <script type="text/javascript" charset="utf-8" src="__PUBLIC__/js/arale.js"></script>
        <script charset="utf-8" src="__PUBLIC__/js/recordIndex.js?t=20110523"></script>
        <script language="javascript" type="text/javascript" src="__PUBLIC__/js/jquery.min.js"></script>
        <script language="javascript" type="text/javascript" src="__PUBLIC__/js/jquery.js"></script>
        <script language="javascript" type="text/javascript" src="__PUBLIC__/content/js/common.js"></script>
        <script language="javascript" type="text/javascript" src="__PUBLIC__/js/DatePicker/WdatePicker.js"></script>
        <script type="text/javascript">
            E.onDOMReady(function() {

                record = new AP.widget.Record({
                    dom: {
                        queryForm: "queryForm",
                        searchForm: "topSearchForm",
                        keyword: "J-keyword",
                        keywordType: "J-keyword-type"
                    }
                });

                //切换高级筛选状态
                E.on('J-filter-link', 'click', record.switchFilter);
            });
            function show_help()
            {
                mytop = (screen.availHeight - 430) / 2;
                myleft = (screen.availWidth - 800) / 2;
                window.open("admin.php?ac=view&fileurl=help&helpid=<?=$ac?>", "", "height=470,width=800,status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top=" + mytop + ",left=" + myleft + ",resizable=yes");
            }
            
            function push_start()
            {
            	//获取性别筛选器
            	var search = topSearchForm.search_part_id.value;
            	update.action = "__URL__/push_start/search_id/"+search;
            	update.submit();
            }
        </script>
    </head>
    <!--[if lt IE 7]><body class="ie6"><![endif]--><!--[if IE 7]><body class="ie7"><![endif]--><!--[if IE 8]><body class="ie8"><![endif]--><!--[if !IE]><!--><body><!--<![endif]-->
    <body>
        <div id="container" class="ui-container">

            <div id="content" class="ui-content fn-clear" coor="default" coor-rate="0.02">
                <div class="ui-grid-21" coor="content">
                    <div class="ui-grid-21 ui-grid-right record-tit" coor="title">
                        <h2 class="ui-tit-page">今日推送列表</h2>
                        <div class="record-tit-amount">
                            <p>总共有 <span class="number"><?php echo ($count); ?></span>条数据
                            </p>
                        </div>
                    </div>

                    <!-- 过滤表单 -->
                    <form method="get" action="__URL__/search" name="topSearchForm" class="ui-grid-21 ui-grid-right ui-form">
                    <div class="ui-grid-21 ui-grid-right record-search">
			<div id="J-advanced-filter-option" class="">
				<div class="record-search-time fn-clear">
					<div class="ui-form-item ui-form-item-time">
                        <label class="ui-form-label" for="J-start">性别：</label>
						<div class="ui-form-content">
							<select name="search_part_id" id="search_part_id" style="width:100px;height: 28px;font-size: 13px;">
							  <option value ="0" selected="selected">不限</option>
							  <option value ="1">男</option>
							  <option value ="2">女</option>
							</select>
						</div>
                        
                        <div class="submit-time-container ">
							<div class="submit-time ui-button ui-button-sorange">
								<input type="button" class="ui-button-text"id="J-submit-time" name="push" value="推 送" onclick="push_start();" />
							</div>
							<a href="__URL__/push_history" style="margin-left:620px">推送历史</a>
							<input type="button" value="新增推送" style="margin-left:20px" class="BigButtonBHover" onClick="javascript:window.location = '__URL__/add'">
						</div>
                    </div>
                 </div>             
			  </div>
			</div>
                   <!-- .record-search -->
</form>
<!--                    <div class="ui-grid-21 ui-grid-right fn-clear" coor="total">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="91%">
                                </td>
                                <td width="9%" align="right" style="padding-right:10px;">	<input type="button" value="新增用户" class="BigButtonBHover" onClick="javascript:window.location = '__URL__/add'"></td>
                            </tr>
                        </table>



                    </div>-->
                </div>

                <form name="update" id="update" method="post" action="__URL__/delete">
                    <input type="hidden" name="do" value="update" />
                    <div class="ui-grid-21 ui-grid-right fn-clear" id="J-table-consume" coor="consumelist" style="margin-top:-15px">
                        <div class="ui-tab">
                            <div class="ui-tab-trigger"> 
                                <ul class="fn-clear"> 
                                    <li class="ui-tab-trigger-item  ui-tab-trigger-item-current">
                                        <a href="__URL__/index" class="ui-tab-trigger-text">今日推送信息</a></li>

                                </ul>
                            </div>
                            <div class="ui-tab-container" id="myScene">
                                <div class="ui-tab-container-item ui-tab-container-item-current">

                                    <table id="tradeRecordsIndex" class="ui-table">

                                        <thead>
                                            <tr>
                                                <th class="checkbox">
                                                    <input type="checkbox" class="checkbox" value="1" name="chkall" onClick="check_all(this)" /></th>
                                                <th width="50">编号</th>
                                                <th width="240">商店</th>
                                                <th width="240">商品名称</th>
                                                <th width="130">商品价格</th>
                                                <th class="30">返利比例</th>
                                                <th class="30">推送类型</th>
                                                <th class="40">操作</th>
                                            </tr>
                                        </thead>						
                                        <tbody>

                                        <?php if(is_array($list)): foreach($list as $key=>$vs): ?><tr >
                                                <td class="checkbox">
                                                    <input type="checkbox" name="id[]" value="<?php echo ($vs["id"]); ?>" class="checkbox" /></td>
                                                </td>
                                                <td ><?php echo ($vs["id"]); ?></td>
                                                <td ><?php if(empty($vs["store_name"])): ?>--<?php else: ?><?php echo ($vs["store_name"]); ?><?php endif; ?></td>
                                                <td ><?php if(empty($vs["commodity_name"])): ?>--<?php else: ?><?php echo ($vs["commodity_name"]); ?><?php endif; ?></td>
                                                <td ><?php if(empty($vs["commodity_price"])): ?>--<?php else: ?>￡<?php echo ($vs["commodity_price"]); ?><?php endif; ?></td>
                                                <td ><?php if(empty($vs["commodity_rebates"])): ?>--<?php else: ?><?php echo ($vs["commodity_rebates"]); ?>%<?php endif; ?></td>
                                                <td >
                                                	<?php if($vs["type"] == 1): ?>活动
													<?php elseif($vs["type"] == 2): ?> 商店
													<?php else: ?> 商品<?php endif; ?>
                                                </td>
                                                <td ><a href="__URL__/show/id/<?php echo ($vs["id"]); ?>">查看</a> | <a href="__URL__/edit/id/<?php echo ($vs["id"]); ?>">编辑</a></td>
                                            </tr><?php endforeach; endif; ?>			

                                        </tbody>
                                    </table>

                                </div>

                                <div class="fn-clear">
                                    <!-- 图释 -->
                                    <div class="iconTip fn-left" style="padding-left:15px;">
                                        <input type="checkbox" class="checkbox" value="1" name="chkall" onClick="check_all(this)" /> 全选

                                        &nbsp;
                                        <a class="js-add-contact"><span></span></a>
                                        <a href="javascript:document:update.submit();">删除数据</a>
                                    </div>

                                    <div class="page page-nobg fn-right">
                                        <span class="page-link"><?php echo ($page); ?></span>
                                    </div>
                                    <!-- /分页 -->
                                </div>
                            </div>
                        </div>


                    </div>

                </form>		
            </div>



        </div>





        <script type="text/javascript">
            $('select#companyid').change(function() {

                $.get('__URL__/GetCustomer', {companyid: $(this).val()}, function($data) {
                    $('.orderid').html($data);
                }
                );
            }
            );
        </script>
    </body>
</html>