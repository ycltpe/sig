<?php

// 设置模块-商家支付管理
class BusinessmenPayAction extends CommonAction {

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
			if(!empty($voList))
			{
		        //查看用户信息
		        $u = M('User');
		        $uList = $u->field('id,email')->select();
		        foreach($voList as $k=>$v)
		        {
			        foreach($uList as $key=>$val)
			        {
			        	if($v['user_id']==$val['id'])
			        	{
			        		$voList[$k]['user_email'] = $val['email'];
			        	}
			        }
			        //查看商店订单
			       	$f = M('Footprints');
			       	$map['store_id'] = array('eq',$v['id']);
			       	$fList = $f->field('id,store_rebate')->where($map)->select();
			       	$all_store_rebate = 0;
			       	$store_rebate = 0;
			       	if(!empty($fList))
			       	{
			       		foreach($fList as $key=>$val)
			       		{
			       			$all_store_rebate += $val['store_rebate'];
			       		}
			       	}
			       	//查看已支付金额
			       	$bp = M('BussinessPay');
			       	$map1['store_id'] = array('eq',$v['id']);
			       	$map1['status'] = array('eq',1);
			       	$bpList = $bp->field('id,money')->where($map1)->select();
			       	if(!empty($bpList))
			       	{
			       		foreach($bpList as $key=>$val)
			       		{
			       			$store_rebate += $val['money'];
			       		}
			       	}
			       	$voList[$k]['other_store_rebate'] = $all_store_rebate-$store_rebate;
			       	$voList[$k]['store_rebate'] = $store_rebate;
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

    public function index() {
        //列表过滤器，生成查询Map对象
        $model = M('Store');
        $map['user_id'] = array('neq',0);
        if (!empty($model)) {
            $this->my_list($model,$map);
        }
        $this->display();
    }
    
    function PayList() {
    	$store_id = $_REQUEST['id'];
    	$this->assign("id", $store_id);
        //列表过滤器，生成查询Map对象
        $model = M('BussinessPay');
        $map['store_id'] = array('eq',$store_id);
        if (!empty($model)) {
            $this->_list($model,$map);
        }
        $this->display();
    }
    
    function addPay() {
    	$store_id = $_REQUEST['store_id'];
    	$this->assign('id', $store_id);
        $this->display();
    }
    
    function editPay() {
    	$model = M('BussinessPay');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        
        $this->display();
    }

    // 插入数据
    public function insertPay() {
    	$store_id = $_REQUEST['store_id'];
    	$type = $_REQUEST['type'];
    	$money = $_REQUEST['money'];
    	$status = $_REQUEST['status'];
    	$create_time = $_REQUEST['create_time'];
    	$fate = $_REQUEST['fate'];
    	if(!empty($money)&&!empty($create_time)&&!empty($status)&&!empty($type))
    	{
    		$bussiness_pay = M('BussinessPay');
    		$bussiness_pay->type = $type;
    		$bussiness_pay->money = $money;
    		$bussiness_pay->status = $status;
    		$bussiness_pay->store_id = $store_id;
    		$bussiness_pay->create_time = strtotime($create_time);
    		$bussiness_pay->fate = $fate;
    		$re = $bussiness_pay->add();
    		if($re)
    		{
    			$this->assign('jumpUrl', U("BusinessmenPay/PayList/id/".$store_id));
    			$this->error('添加成功!');
    		}else{
    			$this->error('添加失败!');
    		}
    	}else{
    		$this->error('请将表单数据填写完整!');
    	}
    }

    public function updatePay() {
    	$id = $_REQUEST['id'];
    	$store_id = $_REQUEST['store_id'];
    	$type = $_REQUEST['type'];
    	$money = $_REQUEST['money'];
    	$status = $_REQUEST['status'];
    	$create_time = $_REQUEST['create_time'];
    	$fate = $_REQUEST['fate'];
    	if(!empty($id))
    	{
    		if(!empty($type))
    		{
    			$data['type'] = $type;
    		}
    		if(!empty($money))
    		{
    			$data['money'] = $money;
    		}
    		if(!empty($status))
    		{
    			$data['status'] = $status;
    		}
    		if(!empty($create_time))
    		{
    			$data['create_time'] = strtotime($create_time);
    		}
    		if(!empty($fate))
    		{
    			$data['fate'] = $fate;
    		}
    		$data['id'] = $id;
    		$model = M('BussinessPay');
	        // 更新数据
	        $list = $model->save($data);
	        if (false !== $list) {
	            $this->assign('jumpUrl', U("BusinessmenPay/PayList/id/".$store_id));
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
    
    public function delete() {
        //删除指定记录
        $model = M('BussinessPay');
        if (!empty($model)) {
            $pk = $model->getPk();
            $id = $_REQUEST [$pk];
            if (isset($id)) {
            	$ids = "";
            	if(strstr($id, ','))
            	{
            		$ids = explode(',', $id);
            	}else{
            		$ids = $id;
            	}
            	$condition['store_id'] = array('in', $ids);
                $list = $model->where($condition)->delete();
                if ($list !== false) {
                	//更新商店信息，清除所有符合条件的商店店长
                    $this->success('删除成功！');
                } else {
                    $this->error('删除失败！');
                }
            } else {
                $this->error('非法操作');
            }
        }
    }
}
?>