<?php

// 设置模块-全部订单管理
class AllOrderAction extends CommonAction {

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
				//查看商店名称和地址
				$s = M('Store');
		        $sList = $s->field('id,cn_name,cn_address')->select();
		        //查看用户名称及vip权限
		        $u = M('User');
		        $uList = $u->field('id,name,sex,age')->select();
		        foreach($voList as $k=>$v)
		        {
		        	foreach($sList as $key=>$val)
			        {
			        	if($v['store_id']==$val['id'])
			        	{
			        		$voList[$k]['store_address'] = $val['cn_address'];
			        	}
			        }
			        foreach($uList as $key=>$val)
			        {
			        	if($v['user_id']==$val['id'])
			        	{
			        		$voList[$k]['user_name'] = $val['name'];
			        		$voList[$k]['user_sex'] = $val['sex'];
			        		$voList[$k]['user_age'] = $val['age'];
			        	}
			        }
			        if($v['type'] == 1)
			        {
			        	$voList[$k]['type'] = '未确认';
			        }else if($v['type'] == 2)
			        {
			        	$voList[$k]['type'] = '已确认';
			        }else if($v['type'] == 3)
			        {
			        	$voList[$k]['type'] = '争议';
			        }else if($v['type'] == 4)
			        {
			        	$voList[$k]['type'] = '已结款';
			        }
			        if($v['status'] == 1)
			        {
			        	$voList[$k]['status'] = '上传收据';
			        }else if($v['status'] == 2)
			        {
			        	$voList[$k]['status'] = '等待确认';
			        }else if($v['status'] == 3)
			        {
			        	$voList[$k]['status'] = '等待回扣';
			        }else if($v['status'] == 4)
			        {
			        	$voList[$k]['status'] = '回扣成功';
			        }
		        }
		        //计算购物总金额
		        $moneyList = $model->field('id,amount,rebate,store_rebate')->where($map)->order(  $order . " " . $sort)->group($group)->select();
				if(!empty($moneyList))
				{
					foreach($moneyList as $k=>$v)
			        {
			        	if(!empty($v['amount']))
				        {
				        	$all_amount += $v['amount'];
				        }
				        if(!empty($v['rebate']))
				        {
				        	$all_user_rebate += $v['rebate'];
				        }
				        if(!empty($v['store_rebate']))
				        {
				        	$all_store_rebate += $v['store_rebate'];
				        }
			        }
			        $all_profit = $all_store_rebate-$all_user_rebate;
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
            $this->assign('all_user_rebate', $all_user_rebate);
            $this->assign('all_store_rebate', $all_store_rebate);
            $this->assign('all_profit', $all_profit);
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
        $model = M('Footprints');
        $map = array();
        if (!empty($model)) {
            $this->my_list($model,$map,'update_time');
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
        if (!empty($f)) {
            $this->my_list($f, $map,'update_time');
        }
        $this->display();
    }
    
    public function add()
    {
        $this->display();
    }
    
    function edit() {
        $model = M('Footprints');
        $id = $_REQUEST[$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        
        $profit = number_format($vo['store_rebate']-$vo['rebate'],2);
        $this->assign('profit', $profit);
        
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
        
        $profit = number_format($vo['store_rebate']-$vo['rebate'],2);
        $this->assign('profit', $profit);
        
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
    	$shopping_time = $_REQUEST['shopping_time'];
    	$amount = $_REQUEST['amount'];
    	$type = $_REQUEST['type'];
    	$status = $_REQUEST['status'];
    	$user_id = $_REQUEST['user_id'];	//订单用户ID
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
	        	if($amount>0)
	        	{
	        		//编辑时，订单购物金额大于0时，给商家端推消息
	        		$user = M('User');
	    			$userInfo = $user->field('id,device_type,device_id')->where('id='.$user_id)->find();
	        		//推送消息
					$title = "订单提醒";
					$type=8;
					$description = "您有一个订单等待确认！";
					$user_id = $userInfo['device_id'];
					$device_type = $userInfo['device_type'];
					parent::push($user_id,$device_type,$title,$description,$type,'store');
	        	}
	            $this->assign('jumpUrl', U("AllOrder/"));
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
				$commodity = M('Commodity');
				$commodityList = $commodity->field('id,store_id,brand_id,category_id,cn_name,price')->select();
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
		        	foreach($commodityList as $key=>$val)
			        {
			        	if($v['commodity_id']==$val['id'])
			        	{
			        		$v['commodity_store_id'] = $val['store_id'];
			        		$v['commodity_brand_id'] = $val['brand_id'];
			        		$v['commodity_category_id'] = $val['category_id'];
			        		$voList[$k]['store_id'] = $val['store_id'];
			        		$voList[$k]['commodity_name'] = $val['cn_name'];
			        		$voList[$k]['commodity_price'] = $val['price'];
			        	}
			        }
		        	foreach($sList as $key=>$val)
			        {
			        	if($v['commodity_store_id']==$val['id'])
			        	{
			        		$voList[$k]['store_name'] = $val['cn_name'];
			        		$voList[$k]['city_id'] = $val['city_id'];
			        	}
			        }
			        foreach($bList as $key=>$val)
			        {
			        	if($v['commodity_brand_id']==$val['id'])
			        	{
			        		$voList[$k]['brand_name'] = $val['name'];
			        	}
			        }
			        foreach($cList as $key=>$val)
			        {
			        	if($v['commodity_category_id']==$val['id'])
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
    
    //添加订单商品
    public function addCommodityByOrder()
    {
    	$id = $_REQUEST['id'];
    	$store_id = $_REQUEST['store_id'];
    	$f = M('Footprints');
    	$map['id'] = array('eq',$id);
    	$fInfo = $f->field('id,order_no,store_id')->where($map)->find();
    	$this->assign("vo", $fInfo);
    	
    	$commodity = M('Commodity');
    	$map1['store_id'] = array('eq',$fInfo['store_id']);
    	$cList = $commodity->field('id,cn_name,en_name')->where($map1)->select();
    	$this->assign("cList", $cList);
    	$this->assign("store_id", $store_id);
    	$this->display();
    }
    
    //编辑订单商品
    public function editCommodityByOrder()
    {
    	$store_id = $_REQUEST['store_id'];
    	$model = M('FootprintsCommodity');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        
        $f = M('Footprints');
    	$map['id'] = array('eq',$vo['order_id']);
    	$fInfo = $f->field('id,order_no,store_id')->where($map)->find();
    	$this->assign('fInfo', $fInfo);
    	
    	$commodity = M('Commodity');
    	$map1['store_id'] = array('eq',$fInfo['store_id']);
    	$cList = $commodity->field('id,cn_name,en_name')->where($map1)->select();
    	$this->assign("cList", $cList);
    	$this->assign("store_id", $store_id);
    	$this->display();
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
			    				$all_rebate_amount = $all_rebate_amount+$value['price']/100*$value['user_rebates']*$v['count_num'];
			    				//普通用户返利总比例
			    				$all_user_rebate = $all_rebate_amount/$amount*100;
			    				//vip用户返利总金额
			    				$all_vip_rebate_amount = $all_vip_rebate_amount+$value['price']/100*$value['vip_rebates']*$v['count_num'];
			    				//vip用户返利总比例
			    				$all_vip_rebate = $all_vip_rebate_amount/$amount*100;
			    				//商店返利总金额
			    				$all_store_rebate_amount = $all_store_rebate_amount+$value['price']/100*$value['rebates']*$v['count_num'];
			    				//商店返利总比例
			    				$all_store_rebate = $all_store_rebate_amount/$amount*100;
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
    				$log = new Log();
    				$log->write('用户ID：'.$footInfo['user_id'].",是否是vip：".$is_vip);
    				$log->write('vip返利比例：'.$all_vip_rebate);
    				$log->write('普通返利比例：'.$all_user_rebate);
    				if($is_vip==2)
    				{
    					//该用户是vip用户
    					$data['rebate'] = $all_vip_rebate_amount;
    					$data['percent'] = $all_vip_rebate;
    				}else{
    					$data['rebate'] = $all_rebate_amount;
    					$data['percent'] = $all_user_rebate;
    				}
    				$data['store_rebate'] = $all_store_rebate_amount;
    				$data['store_percent'] = $all_store_rebate;
			    	$data['id'] = $order_id;
			    	$data['amount'] = $amount;
			    	$footprints->save($data);
		            $this->assign('jumpUrl', U("AllOrder/commodityList/id/".$order_id));
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
			    				$amount = $amount+$value['price']*$v['count_num'];
			    				//普通用户返利总金额
			    				$all_rebate_amount = $all_rebate_amount+$value['price']/100*$value['user_rebates']*$v['count_num'];
			    				//普通用户返利总比例
			    				$all_user_rebate = $all_rebate_amount/$amount*100;
			    				//vip用户返利总金额
			    				$all_vip_rebate_amount = $all_vip_rebate_amount+$value['price']/100*$value['vip_rebates']*$v['count_num'];
			    				//vip用户返利总比例
			    				$all_vip_rebate = $all_vip_rebate_amount/$amount*100;
			    				//商店返利总金额
			    				$all_store_rebate_amount = $all_store_rebate_amount+$value['price']/100*$value['rebates']*$v['count_num'];
			    				//商店返利总比例
			    				$all_store_rebate = $all_store_rebate_amount/$amount*100;
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
    					$data['rebate'] = $all_vip_rebate_amount;
    					$data['percent'] = $all_vip_rebate;
    				}else{
    					$data['rebate'] = $all_rebate_amount;
    					$data['percent'] = $all_user_rebate;
    				}
    				$data['store_rebate'] = $all_store_rebate_amount;
    				$data['store_percent'] = $all_store_rebate;
			    	$data['id'] = $id;
			    	$data['amount'] = $amount;
			    	$footprints->save($data);
		            $this->assign('jumpUrl', U("AllOrder/commodityList/id/".$id));
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
    
    //订单商品列表
    public function commodityList()
    {
    	$order_id = $_REQUEST['id'];
    	$f = M('Footprints');
    	$fInfo = $f->field('store_id')->where('id='.$order_id)->find();
    	$fcommodity = M('FootprintsCommodity');
    	$map['order_id'] = array('eq',$order_id);
		if (!empty($fcommodity)) {
            $this->com_list($fcommodity,$map);
        }
        
        $footprints = M('Footprints');
        $map2['id'] = array('eq',$order_id);
        $footprintsInfo = $footprints->field('order_no')->where($map2)->find();
        $this->assign('order_no',$footprintsInfo['order_no']);
        $this->assign('order_id',$order_id);
        $this->assign('store_id',$fInfo['store_id']);
    	$this->display();
    }
    
    //订单商品清单列表
    public function commodityListBySmall()
    {
    	$order_id = $_REQUEST['id'];
    	$fcommodity = M('FootprintsCommodity');
    	$map['order_id'] = array('eq',$order_id);
//    	$commodityList = $fcommodity->field('commodity_id')->where($map)->select();
//    	$commodityIds = "";
//    	foreach($commodityList as $k=>$v)
//    	{
//    		if($commodityIds=="")
//    		{
//    			$commodityIds = $v['commodity_id'];
//    		}else{
//    			$commodityIds = $commodityIds.','.$v['commodity_id'];
//    		}
//    	}
//    	$commodity = M('Commodity');
//    	$map1['id'] = array('in',$commodityIds);
//    	if (!empty($commodity)) {
//            $this->com_list($commodity,$map1);
//        }
		if (!empty($fcommodity)) {
            $this->com_list($fcommodity,$map);
        }
        
        $footprints = M('Footprints');
        $map2['id'] = array('eq',$order_id);
        $footprintsInfo = $footprints->field('order_no')->where($map2)->find();
        $this->assign('order_no',$footprintsInfo['order_no']);
    	$this->display();
    }
    
    //点击确认回扣
    public function confirm()
    {
    	$id = $_REQUEST['id'];
		$footprints = M('Footprints');
		$footInfo = $footprints->field('id,user_id,rebate')->where('id='.$id)->find();
		if(!empty($footInfo))
		{
			//查询用户信息
			$user = M('User');
			$re = $user->setInc('cahsback','id='.$footInfo['user_id'],$footInfo['rebate']);
			$log = new Log();
			$log->write($user->getLastSql());
			if($re)
			{
				$data['id'] = $id;
				$data['status'] = 4;
				$data['type'] = 4;
				$data['update_time'] = time();
				$res = $footprints->save($data);
				if($res)
				{
					//推送给顾客
		    		$user = M('User');
			    	$userInfo = $user->field('id,device_type,device_id')->where('id='.$footInfo['user_id'])->find();
			    	//推送消息
					$title = "回扣提醒";
					$type=3;
					$description = "您的订单已经回扣成功！";
					$user_id = $userInfo['device_id'];
					$device_type = $userInfo['device_type'];
					parent::push($user_id,$device_type,$title,$description,$type,'customer');
					$this->assign('jumpUrl', U("WaitingForTheRebate/"));
		            $this->success('回扣成功!');
				}else{
					$this->error('回扣失败!');
				}
			}else{
				$this->error('回扣失败!');
			}
		}else{
			$this->error('回扣失败!');
		}
    }
    
    //删除
    public function delete() {
        //删除指定记录
        $model = M('Footprints');
        if (!empty($model)) {
            $pk = $model->getPk();
            $id = $_REQUEST [$pk];
            if (isset($id)) {
                if(strstr($id, ','))
            	{
            		$condition = array($pk => array('in', explode(',', $id)));
            	}else{
            		$condition = array($pk => array('in', $id));
            	}
                $list = $model->where($condition)->delete();
                $log = new Log();
                $log->write($model->getLastSql());
                if ($list !== false) {
                	//删除订单反馈
                	$order_feedback = M('OrderFeedback');
                	$map['foot_id'] = array('in',explode(',', $id));
                	$order_feedback->where($map)->delete();
                	//删除订单留言记录
                	$chat = M('Chat');
                	$chat->where($map)->delete();
                    $this->success('删除成功！');
                } else {
                    $this->error('删除失败！');
                }
            } else {
                $this->error('非法操作');
            }
        }
    }
    
    /**
     * @author wenbo
     * @name 根据购物金额判断用户是否是vip用户
     * @param int $user_id 用户ID
     * @param float $amount 购物总额
     */
    public function user_is_vip($user_id,$amount)
    {
    	/**判断用户购物金额是否满足vip用户的购物金额限制**/
    	$bool = false;
		//查询vip购物金额
		$global_rebate_settings = M('GlobalRebateSettings');
		$rebate = $global_rebate_settings->order('id desc')->limit('0,1')->find();
		if(!empty($rebate))
		{
			if($rebate['type']==1)
			{
				//按照英镑计算
				if($amount>=$rebate['money'])
				{
					//设置该用户为vip用户
					$u = M('User');
					$data['id'] = $user_id;
					$data['is_vip'] = 2;
					$u->save($data);
					$bool = true;
				}
			}else{
				//按照人民币计算
				//查询显示汇率
				$exchange_rate = M('ExchangeRateShow');
				$rate = $exchange_rate->order('id desc')->limit('0,1')->find();
				if($amount*$rate['rate']>=$rebate['money'])
				{
					//设置该用户为vip用户
					$u = M('User');
					$data['id'] = $user_id;
					$data['is_vip'] = 2;
					$u->save($data);
					$bool = true;
				}
			}
		}
		return $bool;
    }
}
?>