<?php

// 设置模块-支付记录
class PaymentRecordsAction extends CommonAction {

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
		        //银行卡信息
		        $c = M('UserBankCard');
		        $cList = $c->field('id,bank_id')->select();
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
        $map['status'] = array('eq',2);
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
    	$map['status'] = array('eq',2);//交易成功
        if (!empty($ub)) {
            $this->my_list($ub, $map);
        }
        $this->display();
    }
    
    public function show()
    {
        $model = M('UserBill');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        $this->display();
    }
    
    public function uploadVoucher()
    {
    	$id = $_REQUEST['id'];
    	$this->assign('id', $id);
        $this->display();
    }
    
    public function uploading() {
    	$id = $_REQUEST['id'];
    	$voucher = $_FILES['voucher'];
    	$save_type = 'jpg,png,jpeg,BMP,bmp';
    	if(!empty($id)&&!empty($voucher['name']))
    	{
    		$logoInfo = $this->upload_pic($voucher,$save_type,'Uploads/voucher/');
			$data['voucher'] = $logoInfo[0]['savepath'].$logoInfo[0]['savename'];
    		$data['id'] = $id;
    		$model = M('UserBill');
	        // 更新数据
	        $list = $model->save($data);
	        if (false !== $list) {
	            $this->assign('jumpUrl', U("PaymentRecords/"));
	            $this->success('上传成功!');
	        } else {
	            //错误提示
	            $this->error('上传失败!');
	        }
    	}else{
    		//错误提示
	       	$this->error('上传失败!');
    	}
    }
}
?>