<?php

// 设置模块-客户支付申请
class CustomersPayForAction extends CommonAction {

	protected function my_list($model, $map, $sortBy = '', $asc = false, $group = '') {
        //排序字段 默认为主键名
        if (isset($_REQUEST ['_order'])) {
            $order = $_REQUEST ['_order'];
        } else {
            $order = !empty($sortBy) ? $sortBy : $model->getPk();
        }
        //排序方式默认按照倒序排列
        //接受 sost参数 0 表示倒序 非0都 表示正序
        if (isset($_REQUEST ['_sort'])) {
            $sort = $_REQUEST ['_sort'] ? 'asc' : 'desc';
        } else {
            $sort = $asc ? 'asc' : 'desc';
        }
        //取得满足条件的记录数
        if(empty($group))
        {
        	$count = $model->where($map)->count('id');
        }else {
			$count = $model->where($map)->count('distinct '.$group);
		}
        if ($count > 0) {
            import("@.ORG.Page");
            //创建分页对象
            if (!empty($_REQUEST ['listRows'])) {
                $listRows = $_REQUEST ['listRows'];
            } else {
                $listRows = '10';
            }
            $p = new Page($count, $listRows);
            //分页查询数据
			$voList = $model->where($map)->order(  $order . " " . $sort)->group($group)->limit($p->firstRow . ',' . $p->listRows)->findAll();
			//定义购物总金额
			$all_amount = 0;
			//定义用户返利总金额
			$all_user_rebate = 0;
			//定义商家提供返利总金额
			$all_store_rebate = 0;
			//定义利润
			$all_profit = 0;
			if(!empty($voList))
			{
		        //查看用户信息
		        $u = M('User');
		        $uList = $u->field('id,name,sex,email,phone')->select();
		        //银行卡绑定信息
		        $c = M('UserBankCard');
		        $cList = $c->field('id,bank_id,card_no')->select();
		        foreach($voList as $k=>$v)
		        {
			        foreach($uList as $key=>$val)
			        {
			        	if($v['user_id']==$val['id'])
			        	{
			        		$voList[$k]['user_name'] = $val['name'];
			        		$voList[$k]['user_sex'] = $val['sex'];
			        		$voList[$k]['user_email'] = $val['email'];
			        		$voList[$k]['user_phone'] = $val['phone'];
			        	}
			        }
			        foreach($cList as $key=>$val)
			        {
			        	if($v['card_id']==$val['id'])
			        	{
			        		$voList[$k]['bank_id'] = $val['bank_id'];
			        		$voList[$k]['bank_no'] = $val['card_no'];
			        	}
			        }
		        }
		        //计算购物总金额
		        $moneyList = $model->field('id,money,currency')->where($map)->order(  $order . " " . $sort)->group($group)->select();
		        //查询汇率
		        $exchange_rate_show = M('ExchangeRateShow');
		        $rate_info = $exchange_rate_show->field('id,rate')->order('id desc')->limit('0,1')->find();
				if(!empty($moneyList))
				{
					foreach($moneyList as $k=>$v)
			        {
			        	if(!empty($v['money']))
					    {
					    	if(!empty($v['currency'])&&$v['currency']==1)
				        	{
						        $all_amount += ($v['money']/$rate_info['rate']);
				        	}else if(!empty($v['money'])&&$v['currency']==2)
					        {
					        	$all_amount += $v['money'];
					        }
					    }
			        }
			        //计算人民币
			        $all_amount_rmb = $all_amount*$rate_info['rate'];
			        $all_amount = round($all_amount,2);
			        $all_amount_rmb = round($all_amount_rmb,2);
				}
				
			}
            //分页跳转的时候保证查询条件
            foreach ($map as $key => $val) {
                if (!is_array($val)) {
                    $p->parameter .= "$key=" . urlencode($val) . "&";
                }
            }
            //分页显示
            $page = $p->show();
            //列表排序显示
            $sortImg = $sort; //排序图标
            $sortAlt = $sort == 'desc' ? '升序排列' : '倒序排列'; //排序提示
            $sort = $sort == 'desc' ? 1 : 0; //排序方式
            //模板赋值显示
            $this->assign('all_amount', $all_amount);
            $this->assign('all_amount_rmb', $all_amount_rmb);
            $this->assign('list', $voList);
            $this->assign('sort', $sort);
            $this->assign('order', $order);
            $this->assign('sortImg', $sortImg);
            $this->assign('sortType', $sortAlt);
            $this->assign("page", $page);
        }
        $this->assign("count", $count);
        Cookie::set('_currentUrl_', __SELF__);
        return;
    }

    public function index() {
        //列表过滤器，生成查询Map对象
        $model = M('UserBill');
        $map['status'] = array('eq',1);//等待交易
        if (!empty($model)) {
            $this->my_list($model,$map);
        }
        $this->display();
    }
    
    public function search()
    {
    	$search_user_id = $_REQUEST['search_user_id'];
    	$search_id = $_REQUEST['search_id'];
    	$search_pay_type = $_REQUEST['search_pay_type'];
    	$search_currency = $_REQUEST['search_currency'];
    	$search_comparison = $_REQUEST['search_comparison'];
    	$search_money = $_REQUEST['search_money'];
    	if(!empty($search_user_id))
    	{
    		$map['user_id'] = array('like','%'.$search_user_id.'%');
    		$this->assign('search_user_id', $search_user_id);
    	}
    	if(!empty($search_id))
    	{
    		$map['id'] = array('like','%'.$search_id.'%');
    		$this->assign('search_id', $search_id);
    	}
    	if(!empty($search_pay_type))
    	{
    		//银行卡信息
	        $c = M('UserBankCard');
	        $cList = $c->field('id,bank_id')->select();
        	if(!empty($cList))
        	{
        		$card_ids = "";
        		foreach($cList as $k=>$v)
	        	{
	        		if($search_pay_type==1)
			        {
			        	//支付宝
			        	if($v['bank_id']==0)
			        	{
			        		if($card_ids == "")
				        	{
				        		$card_ids = $v['id'];
				        	}else{
				        		$card_ids = $card_ids.','.$v['id'];
				        	}
			        	}
			        }else if($search_pay_type==2){
			        	//银行卡
			        	if($v['bank_id']!=0)
			        	{
			        		if($card_ids == "")
				        	{
				        		$card_ids = $v['id'];
				        	}else{
				        		$card_ids = $card_ids.','.$v['id'];
				        	}
			        	}
			        }
	        	}
	        	$map['card_id'] = array('in',$card_ids);
        	}
    		$this->assign('search_pay_type', $search_pay_type);
    	}
    	if(!empty($search_currency))
    	{
    		$map['currency'] = array('eq',$search_currency);
    		$this->assign('search_currency', $search_currency);
    	}
    	if(!empty($search_comparison)&&!empty($search_money))
    	{
    		if($search_comparison==1)
    		{
    			$map['money'] = array('GT',$search_money);
    		}else if($search_comparison==2)
    		{
    			$map['money'] = array('eq',$search_money);
    		}else if($search_comparison==3)
    		{
    			$map['money'] = array('LT',$search_money);
    		}
    		$this->assign('search_comparison', $search_comparison);
    		$this->assign('search_money', $search_money);
    	}
    	$ub = M('UserBill');
    	$map['status'] = array('eq',1);//等待交易
        if (!empty($ub)) {
            $this->my_list($ub, $map);
        }
        $this->display();
    }
    
    //点击确认
    public function confirm()
    {
    	$id = $_REQUEST['id'];
    	if($id)
    	{
    		$user_bill = M('UserBill');
	    	$map['id'] = array('eq',$id);
	    	$billInfo = $user_bill->where($map)->find();
	    	if(!empty($billInfo))
	    	{
	    		$user = M('User');
	    		$userInfo = $user->field('id,device_id,device_type,cahsback')->where('id='.$billInfo['user_id'])->find();
	    		if($billInfo['currency']==1)
	    		{
	    			//取人民币
	    			//获取汇率
	    			$exchange_rate_show = M('ExchangeRateShow');
	    			$rateInfo = $exchange_rate_show->order('id desc')->limit('0,1')->find();
	    			$money = $billInfo['money']/$rateInfo['rate'];
	    		}else{
	    			//取英镑
	    			$money = $billInfo['money'];
	    		}
	    		if($userInfo['cahsback']>=$money)
    			{
    				$user->startTrans();// 启动事务
    				//扣除用户余额
    				$r = $user->setDec('cahsback','id='.$billInfo['user_id'],$money);
    				if($r)
    				{
    					//更新交易记录状态
	    				$data['status'] = 2;
	    				$data['update_time'] = time();
	    				$data['id'] = $id;
	    				$re = $user_bill->save($data);
	    				if($re)
	    				{
	    					$user->commit();// 提交事务
	    					//推送消息
							$title = "交易提醒";
							$type = 6;
							$description = "交易成功！";
							$user_id = $userInfo['device_id'];
							$device_type = $userInfo['device_type'];
							parent::push($user_id,$device_type,$title,$description,$type,'customer');
	    					$this->assign('jumpUrl', U("CustomersPayFor/"));
		    				$this->success('确认成功!');
	    				}else{
	    					$user->rollback(); // 事务回滚
	    					//推送消息
							$title = "交易提醒";
							$type = 7;
							$description = "交易失败！";
							$user_id = $userInfo['device_id'];
							$device_type = $userInfo['device_type'];
							parent::push($user_id,$device_type,$title,$description,$type,'customer');
	    					$this->error('更新交易记录失败!');
	    				}
    				}else{
    					$this->error('用户返利扣除失败!');
    				}
    			}else{
    				$this->assign('jumpUrl', U("CustomersPayFor/"));
    				$this->error('确认失败,用户剩余返利不足!');
    			}
	    	}else{
	    		$this->error('确认失败!');
	    	}
    	}else{
    		$this->error('非法操作!');
    	}
    }
    
    //点击反对
    public function opposition()
    {
    	$id = $_REQUEST['id'];
    	$str = $_REQUEST['str'];
    	$user_id = $_REQUEST['user_id'];
    	if(!empty($str)&&!empty($id))
    	{
    		$user_bill = M('UserBill');
    		$data['id'] = $id;
    		$data['opposition_reason'] = $str;
    		$re = $user_bill->save($data);
    		if($re)
    		{
    			//数据更新成功后，推送消息
    			$user = M('User');
    			$userInfo = $user->field('id,device_type,device_id')->where('id='.$user_id)->find();
        		//推送消息
				$title = "交易提醒";
				$type=1;
				$description = "交易被拒绝，原因：".$str;
				$user_id = $userInfo['device_id'];
				$device_type = $userInfo['device_type'];
				parent::push($user_id,$device_type,$title,$description,$type,'customer');
    		}
    		$this->assign('jumpUrl', U("CustomersPayFor/"));
	    	$this->success('反对成功!');
    	}else{
    		$this->error('非法操作!');
    	}
    }
    
    public function add()
    {
        $this->display();
    }
    
    function edit() {
        $model = M('Footprints');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        
        $u = M('User');
        $map['id'] = array('eq',$vo['user_id']);
        $uInfo = $u->field('id,name,sex,age')->where($map)->find();
        $this->assign('u', $uInfo);
        
        $s = M('Store');
        $map1['id'] = array('eq',$vo['store_id']);
        $sInfo = $s->field('id,cn_name,cn_address')->where($map1)->find();
        $this->assign('s', $sInfo);
        $this->display();
    }
    
    function show() {
        $model = M('Footprints');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        
        $u = M('User');
        $map['id'] = array('eq',$vo['user_id']);
        $uInfo = $u->field('id,name,sex,age')->where($map)->find();
        $this->assign('u', $uInfo);
        
        $s = M('Store');
        $map1['id'] = array('eq',$vo['store_id']);
        $sInfo = $s->field('id,cn_name,cn_address')->where($map1)->find();
        $this->assign('s', $sInfo);
        $this->display();
    }

    // 插入数据
    public function insert() {
    	$this->error('该功能暂未实现!');
    }

    public function update() {
    	$id = $_REQUEST['id'];
    	$part_id = $_REQUEST['part_id'];
    	$name = $_REQUEST['name'];
    	$password = $_REQUEST['password'];
    	if(!empty($id))
    	{
    		if(!empty($password))
    		{
    			$data['password'] = md5($password);
    		}
    		if(!empty($name))
    		{
    			$data['name'] = $name;
    		}
    		$data['part_id'] = $part_id;
    		$data['id'] = $id;
    		$model = M('Footprints');
	        // 更新数据
	        $list = $model->save($data);
	        if (false !== $list) {
	            $this->assign('jumpUrl', U("CustomersPayFor/"));
	            $this->success('编辑成功!');
	        } else {
	            //错误提示
	            $this->error('编辑失败!');
	        }
    	}else{
    		//错误提示
	       	$this->error('编辑失败!');
    	}
    }
    
    protected function com_list($model, $map, $sortBy = '', $asc = false, $group = '') {
        //排序字段 默认为主键名
        if (isset($_REQUEST ['_order'])) {
            $order = $_REQUEST ['_order'];
        } else {
            $order = !empty($sortBy) ? $sortBy : $model->getPk();
        }
        //排序方式默认按照倒序排列
        //接受 sost参数 0 表示倒序 非0都 表示正序
        if (isset($_REQUEST ['_sort'])) {
            $sort = $_REQUEST ['_sort'] ? 'asc' : 'desc';
        } else {
            $sort = $asc ? 'asc' : 'desc';
        }
        //取得满足条件的记录数
        if(empty($group))
        {
        	$count = $model->where($map)->count('id');
        }else {
			$count = $model->where($map)->count('distinct '.$group);
		}
        if ($count > 0) {
            import("@.ORG.Page");
            //创建分页对象
            if (!empty($_REQUEST ['listRows'])) {
                $listRows = $_REQUEST ['listRows'];
            } else {
                $listRows = '10';
            }
            $p = new Page($count, $listRows);
            //分页查询数据
			$voList = $model->where($map)->order(  $order . " " . $sort)->group($group)->limit($p->firstRow . ',' . $p->listRows)->findAll();
			if(!empty($voList))
			{
				$s = M('Store');
				$b = M('Brand');
				$c = M('Category');
				$city = M('City');
		        $sList = $s->field('id,cn_name,city_id')->select();
		        $bList = $b->field('id,name')->select();
		        $cList = $c->field('id,cn_name')->select();
		        $cityList = $city->field('id,name')->select();
		        foreach($voList as $k=>$v)
		        {
		        	foreach($sList as $key=>$val)
			        {
			        	if($v['store_id']==$val['id'])
			        	{
			        		$voList[$k]['store_name'] = $val['cn_name'];
			        		$voList[$k]['city_id'] = $val['city_id'];
			        	}
			        }
			        foreach($bList as $key=>$val)
			        {
			        	if($v['brand_id']==$val['id'])
			        	{
			        		$voList[$k]['brand_name'] = $val['name'];
			        	}
			        }
			        foreach($cList as $key=>$val)
			        {
			        	if($v['category_id']==$val['id'])
			        	{
			        		$voList[$k]['category_name'] = $val['cn_name'];
			        	}
			        }
			        foreach($cityList as $key=>$val)
			        {
			        	if($voList[$k]['city_id']==$val['id'])
			        	{
			        		$voList[$k]['city_name'] = $val['name'];
			        	}
			        }
		        }
			}
            //分页跳转的时候保证查询条件
            foreach ($map as $key => $val) {
                if (!is_array($val)) {
                    $p->parameter .= "$key=" . urlencode($val) . "&";
                }
            }
            //分页显示
            $page = $p->show();
            //列表排序显示
            $sortImg = $sort; //排序图标
            $sortAlt = $sort == 'desc' ? '升序排列' : '倒序排列'; //排序提示
            $sort = $sort == 'desc' ? 1 : 0; //排序方式
            //模板赋值显示
            $this->assign('list', $voList);
            $this->assign('sort', $sort);
            $this->assign('order', $order);
            $this->assign('sortImg', $sortImg);
            $this->assign('sortType', $sortAlt);
            $this->assign("page", $page);
        }
        $this->assign("count", $count);
        Cookie::set('_currentUrl_', __SELF__);
        return;
    }
    
    //订单商品列表
    public function commodityList()
    {
    	$order_id = $_REQUEST['id'];
    	$fcommodity = M('FootprintsCommodity');
    	$map['order_id'] = array('eq',$order_id);
    	$commodityList = $fcommodity->field('commodity_id')->where($map)->select();
    	$commodityIds = "";
    	foreach($commodityList as $k=>$v)
    	{
    		if($commodityIds=="")
    		{
    			$commodityIds = $v['commodity_id'];
    		}else{
    			$commodityIds = $commodityIds.','.$v['commodity_id'];
    		}
    	}
    	$commodity = M('Commodity');
    	$map1['id'] = array('in',$commodityIds);
    	if (!empty($commodity)) {
            $this->com_list($commodity,$map1);
        }
        
        $footprints = M('Footprints');
        $map2['id'] = array('eq',$order_id);
        $footprintsInfo = $footprints->field('order_no')->where($map2)->find();
        $this->assign('order_no',$footprintsInfo['order_no']);
    	$this->display();
    }
    
    //订单商品清单列表
    public function commodityListBySmall()
    {
    	$order_id = $_REQUEST['id'];
    	$fcommodity = M('FootprintsCommodity');
    	$map['order_id'] = array('eq',$order_id);
    	$commodityList = $fcommodity->field('commodity_id')->where($map)->select();
    	$commodityIds = "";
    	foreach($commodityList as $k=>$v)
    	{
    		if($commodityIds=="")
    		{
    			$commodityIds = $v['commodity_id'];
    		}else{
    			$commodityIds = $commodityIds.','.$v['commodity_id'];
    		}
    	}
    	$commodity = M('Commodity');
    	$map1['id'] = array('in',$commodityIds);
    	if (!empty($commodity)) {
            $this->com_list($commodity,$map1);
        }
        
        $footprints = M('Footprints');
        $map2['id'] = array('eq',$order_id);
        $footprintsInfo = $footprints->field('order_no')->where($map2)->find();
        $this->assign('order_no',$footprintsInfo['order_no']);
    	$this->display();
    }
}
?>