<?php

// 设置模块-等待回扣管理
class RebateSuccessAction extends AllOrderAction {

    public function index() {
        //列表过滤器，生成查询Map对象
        $model = M('Footprints');
        $map['status'] = array('eq',4);
        if (!empty($model)) {
            $this->my_list($model,$map);
        }
        $this->display();
    }
    
    public function search()
    {
    	$search_order_no = $_REQUEST['search_order_no'];
    	$search_id = $_REQUEST['search_id'];
    	if(!empty($search_order_no))
    	{
    		$map['order_no'] = array('like','%'.$search_order_no.'%');
    		$this->assign('search_order_no', $search_order_no);
    	}
    	if(!empty($search_id))
    	{
    		$map['user_id'] = array('like','%'.$search_id.'%');
    		$this->assign('search_id', $search_id);
    	}
    	$f = M('Footprints');
    	$map['status'] = array('eq',4);
        if (!empty($f)) {
            $this->my_list($f, $map);
        }
        $this->display();
    }
    
    public function update() {
    	$id = $_REQUEST['id'];
    	$shopping_time = $_REQUEST['shopping_time'];
    	$amount = $_REQUEST['amount'];
    	$type = $_REQUEST['type'];
    	$status = $_REQUEST['status'];
    	$rebate = $_REQUEST['rebate'];			//呈现用户返利金额
    	$store_rebate = $_REQUEST['store_rebate'];	//商家提供返利金额
    	$percent = $_REQUEST['percent'];			//呈现用户返利比例
    	$store_percent = $_REQUEST['store_percent'];	//商家提供返利比例
    	if(!empty($id))
    	{
    		if(!empty($shopping_time))
    		{
    			$data['shopping_time'] = strtotime($shopping_time);
    		}
    		if(!empty($amount))
    		{
    			$data['amount'] = $amount;
    		}
    		if(!empty($type))
    		{
    			$data['type'] = $type;
    		}
    		if(!empty($status))
    		{
    			$data['status'] = $status;
    		}
    		if(!empty($rebate))
    		{
    			$data['rebate'] = $rebate;
    		}
    		if(!empty($store_rebate))
    		{
    			$data['store_rebate'] = $store_rebate;
    		}
    		if(!empty($percent))
    		{
    			$data['percent'] = $percent;
    		}
    		if(!empty($store_percent))
    		{
    			$data['store_percent'] = $store_percent;
    		}
    		$data['id'] = $id;
    		$model = M('Footprints');
	        // 更新数据
	        $list = $model->save($data);
	        if (false !== $list) {
	            $this->assign('jumpUrl', U("RebateSuccess/"));
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
    
    //更新订单商品
    public function updateCommodityByOrder()
    {
    	$id = $_REQUEST['id'];
    	$order_id = $_REQUEST['order_id'];
    	$commodity_id = $_REQUEST['commodity_id'];
    	$count_num = $_REQUEST['count_num'];
    	$store_id = $_REQUEST['store_id'];
    	if(!empty($id)&&!empty($commodity_id)&&!empty($count_num))
    	{
    		$footprints_commodity = M('FootprintsCommodity');
    		$map['order_id'] = array('eq',$order_id);
    		$map['id'] = array('neq',$id);
    		$map['commodity_id'] = array('eq',$commodity_id);
    		$fInfo = $footprints_commodity->field('id')->where($map)->find();
    		if(empty($fInfo))
    		{
    			$data['order_id'] = $order_id;
	    		$data['commodity_id'] = $commodity_id;
	    		$data['count_num'] = $count_num;
	    		$data['id'] = $id;
	    		$re = $footprints_commodity->save($data);
	    		if ($re) {
	    			/**更新订单中的购物金额**/
	    			$footprints = M('Footprints');
	    			//声明购物金额
	    			$amount = 0;					//购物总金额
	    			$all_rebate_amount = 0;			//普通用户返利总金额
	    			$all_vip_rebate_amount = 0;		//vip用户返利总金额
	    			$all_store_rebate_amount = 0;	//商店返利总金额
	    			$all_user_rebate = 0;			//普通用户返利总比例
	    			$all_vip_rebate = 0;		//vip用户返利总比例
	    			$all_store_rebate = 0;		//商店返利总比例
	    			//查询该订单商品中的用户ID
	    			$footInfo = $footprints->field('user_id')->where('id='.$id)->find();
	    			//查看该订单中的用户是否是vip
	    			$user = M('User');
	    			$userInfo = $user->field('is_vip')->where('id='.$footInfo['user_id'])->find();
	    			//查询各个商品数量
	    			$map1['order_id'] = array('eq',$order_id);
	    			$f_c_list = $footprints_commodity->where($map1)->select();
	    			//查询订单中的商品
	    			$commodity = M('Commodity');
			    	$map2['store_id'] = array('eq',$store_id);
			    	$cList = $commodity->field('id,price,rebates,user_rebates,vip_rebates')->where($map2)->select();
			    	foreach($f_c_list as $k=>$v)
			    	{
			    		foreach($cList as $key=>$value)
			    		{
			    			if($v['commodity_id']==$value['id'])
			    			{
			    				$amount = $amount+$value['price']*$v['count_num'];
			    				//普通用户返利总金额
			    				$all_rebate_amount = $all_rebate_amount+$value['price']*$value['user_rebates']*$v['count_num'];
			    				//普通用户返利总比例
			    				$all_user_rebate = $all_rebate_amount/$amount;
			    				//vip用户返利总金额
			    				$all_vip_rebate_amount = $all_vip_rebate_amount+$value['price']*$value['vip_rebates']*$v['count_num'];
			    				//vip用户返利总比例
			    				$all_vip_rebate = $all_vip_rebate_amount/$amount;
			    				//商店返利总金额
			    				$all_store_rebate_amount = $all_store_rebate_amount+$value['price']*$value['rebates']*$v['count_num'];
			    				//商店返利总比例
			    				$all_store_rebate = $all_store_rebate_amount/$amount;
			    			}
			    		}
			    	}
			    	/**判断用户购物金额是否满足vip用户的购物金额限制**/
	    			$bool = $this->user_is_vip($footInfo['user_id'],$amount);
	    			//计算呈现用户返利比例
    				$is_vip = 1;
	    			if(!$bool)
	    			{
	    				$is_vip = $userInfo['is_vip'];
	    			}else{
	    				$is_vip = 2;
	    			}
    				if($is_vip==2)
    				{
    					//该用户是vip用户
    					$data['rebate'] = number_format($all_vip_rebate_amount,2);
    					$data['percent'] = number_format($all_vip_rebate,2);
    				}else{
    					$data['rebate'] = number_format($all_rebate_amount,2);
    					$data['percent'] = number_format($all_user_rebate,2);
    				}
    				$data['store_rebate'] = number_format($all_store_rebate_amount,2);
    				$data['store_percent'] = number_format($all_store_rebate,2);
			    	$data['id'] = $order_id;
			    	$data['amount'] = $amount;
			    	$footprints->save($data);
		            $this->assign('jumpUrl', U("RebateSuccess/commodityList/id/".$order_id));
		            $this->success('编辑成功!');
		        } else {
		            //错误提示
		            $this->error('您没有修改任何数据!');
		        }
    		}else{
    			$this->error('您之前已经添加过该商品，请勿重复添加!');
    		}
    	}else{
    		$this->error('请将表单填写完整!');
    	}
    }
    
    //插入订单商品
    public function insertCommodityByOrder()
    {
    	$id = $_REQUEST['id'];
    	$commodity_id = $_REQUEST['commodity_id'];
    	$count_num = $_REQUEST['count_num'];
    	$store_id = $_REQUEST['store_id'];
    	if(!empty($id)&&!empty($commodity_id)&&!empty($count_num))
    	{
    		$footprints_commodity = M('FootprintsCommodity');
    		$map['order_id'] = array('eq',$id);
    		$map['commodity_id'] = array('eq',$commodity_id);
    		$fInfo = $footprints_commodity->field('id')->where($map)->find();
    		if(empty($fInfo))
    		{
    			$footprints_commodity->order_id = $id;
	    		$footprints_commodity->commodity_id = $commodity_id;
	    		$footprints_commodity->count_num = $count_num;
	    		$re = $footprints_commodity->add();
	    		if ($re) {
	    			/**更新订单中的购物金额**/
	    			$footprints = M('Footprints');
	    			//声明购物金额
	    			$amount = 0;					//购物总金额
	    			$all_rebate_amount = 0;			//普通用户返利总金额
	    			$all_vip_rebate_amount = 0;		//vip用户返利总金额
	    			$all_store_rebate_amount = 0;	//商店返利总金额
	    			$all_user_rebate = 0;			//普通用户返利总比例
	    			$all_vip_rebate = 0;		//vip用户返利总比例
	    			$all_store_rebate = 0;		//商店返利总比例
	    			//查询该订单商品中的用户ID
	    			$footInfo = $footprints->field('user_id')->where('id='.$id)->find();
	    			//查看该订单中的用户是否是vip
	    			$user = M('User');
	    			$userInfo = $user->field('is_vip')->where('id='.$footInfo['user_id'])->find();
	    			//查询各个商品数量
	    			$map1['order_id'] = array('eq',$id);
	    			$f_c_list = $footprints_commodity->where($map1)->select();
	    			//查询订单中的商品
	    			$commodity = M('Commodity');
			    	$map2['store_id'] = array('eq',$store_id);
			    	$cList = $commodity->field('id,price,rebates,user_rebates,vip_rebates')->where($map2)->select();
			    	foreach($f_c_list as $k=>$v)
			    	{
			    		foreach($cList as $key=>$value)
			    		{
			    			if($v['commodity_id']==$value['id'])
			    			{
			    				//购物总金额
			    				$amount = $amount+$value['price']*$v['count_num'];
			    				//普通用户返利总金额
			    				$all_rebate_amount = $all_rebate_amount+$value['price']*$value['user_rebates']*$v['count_num'];
			    				//普通用户返利总比例
			    				$all_user_rebate = $all_rebate_amount/$amount;
			    				//vip用户返利总金额
			    				$all_vip_rebate_amount = $all_vip_rebate_amount+$value['price']*$value['vip_rebates']*$v['count_num'];
			    				//vip用户返利总比例
			    				$all_vip_rebate = $all_vip_rebate_amount/$amount;
			    				//商店返利总金额
			    				$all_store_rebate_amount = $all_store_rebate_amount+$value['price']*$value['rebates']*$v['count_num'];
			    				//商店返利总比例
			    				$all_store_rebate = $all_store_rebate_amount/$amount;
			    			}
			    		}
			    	}
			    	/**判断用户购物金额是否满足vip用户的购物金额限制**/
	    			$bool = $this->user_is_vip($footInfo['user_id'],$amount);
	    			//计算呈现用户返利比例
    				$is_vip = 1;
	    			if(!$bool)
	    			{
	    				$is_vip = $userInfo['is_vip'];
	    			}else{
	    				$is_vip = 2;
	    			}
    				if($is_vip==2)
    				{
    					//该用户是vip用户
    					$data['rebate'] = number_format($all_vip_rebate_amount,2);
    					$data['percent'] = number_format($all_vip_rebate,2);
    				}else{
    					$data['rebate'] = number_format($all_rebate_amount,2);
    					$data['percent'] = number_format($all_user_rebate,2);
    				}
    				$data['store_rebate'] = number_format($all_store_rebate_amount,2);
    				$data['store_percent'] = number_format($all_store_rebate,2);
			    	$data['id'] = $id;
			    	$data['amount'] = $amount;
			    	$footprints->save($data);
		            $this->assign('jumpUrl', U("RebateSuccess/commodityList/id/".$id));
		            $this->success('添加成功!');
		        } else {
		            //错误提示
		            $this->error('添加失败!');
		        }
    		}else{
    			$this->error('您之前已经添加过该商品，请勿重复添加!');
    		}
    	}else{
    		$this->error('请将表单填写完整!');
    	}
    }
}
?>