<?php

// 设置模块-商家用户
class StoreUserAction extends AllUserAction {

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
		        //查看用户名称
		        $u = M('User');
		        $uList = $u->field('id,name,username')->select();
		        foreach($voList as $k=>$v)
		        {
			        foreach($uList as $key=>$val)
			        {
			        	if($v['user_id']==$val['id'])
			        	{
			        		$voList[$k]['user_name'] = $val['name'];
			        		$voList[$k]['user_username'] = $val['username'];
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

    public function index() {
        //列表过滤器，生成查询Map对象
        $model = M('Store');
        $map['user_id'] = array('neq',0);
        if (!empty($model)) {
            $this->my_list($model,$map);
        }
        $this->display();
    }
    
    public function search()
    {
    	$s = M('Store');
    	$search_id = $_REQUEST['search_id'];
    	$search_name = $_REQUEST['search_name'];
    	$search_store_name = $_REQUEST['search_store_name'];
    	if(!empty($search_id))
    	{
	        $map['id'] = array('like','%'.$search_id.'%');
    		$this->assign('search_id', $search_id);
    	}
    	if(!empty($search_name))
    	{
    		$u = M('User');
    		$map1['name'] = array('like','%'.$search_name.'%');
    		$map1['user_type'] = array('eq',2);
    		$map1['status'] = array('eq',0);
    		$uList = $u->field('id')->where($map1)->select();
    		$ids = "";
    		foreach($uList as $k=>$v)
    		{
    			if($ids=="")
    			{
    				$ids = $v['id'];
    			}else{
    				$ids = $ids.','.$v['id'];
    			}
    		}
    		$map['user_id'] = array('in',$ids);
    		$this->assign('search_name', $search_name);
    	}
    	if(!empty($search_store_name))
    	{
    		$map['cn_name'] = array('like','%'.$search_store_name.'%');
    		$this->assign('search_store_name', $search_store_name);
    	}
    	$map['user_id'] = array('neq',0);
        if (!empty($s)) {
            $this->my_list($s, $map);
        }
        $this->display();
    }
    
    public function add()
    {
    	$store = M('Store');
    	$map['user_id'] = array('eq',0);
    	$storeList = $store->field('id,cn_name')->where($map)->select();
    	if(!empty($storeList))
    	{
    		$this->assign('storeList',$storeList);
    	}
        $this->display();
    }
    
    function edit() {
        $model = M('User');
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
        $model = M('User');
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
    
    public function checkUsername($username)
    {
    	$User = M("User");
        // 检测用户名是否冲突
        $result = $User->getByUsername($username);
        return $result;
    }

    // 插入数据
    public function insert() {
    	$store_id = $_REQUEST['store_id'];//商店ID
    	$username = $_REQUEST['username'];//店长用户名
    	$Clerks = $_REQUEST['keywords'];//店员用户名（用“，”隔开）
    	$password = $_REQUEST['password'];//初始密码
    	if(isset($store_id)&&isset($username)&&isset($password))
    	{
    		$user = M('User');
    		$store_employee = M('StoreEmployee');
	    	$userInfo = $this->checkUsername($username);
	    	if(isset($userInfo)&&isset($userInfo['id'])&&$userInfo['user_type']==2)
	    	{
	    		$uid = $userInfo['id'];
	    	}else{
	    		$emailArr = explode("@",$username);
	    		$user->name = $emailArr[0];
	    		$user->username = $username;
	    		$user->email = $username;
		    	$user->password = md5($password);
		    	$user->user_type = 2;
		    	$user->create_time = time();
		    	$uRes = $user->add();
		    	if($uRes)
		    	{
		    		$uid = $uRes;
		    	}else{
		    		$this->error('店长信息添加失败!');
		    	}
	    	}
	    	if(isset($uid))
	    	{
	    		$store = M('Store');
		    	$data['id'] = $store_id;
		    	$data['user_id'] = $uid;
		    	$sRes = $store->save($data);
		    	if($sRes)
		    	{
		    		//插入关系
		    		$store_employee->store_id = $store_id;
		    		$store_employee->user_id = $uid;
		    		$store_employee->type = 1;
		    		$store_employee->add();
		    	}
		    	//判断店员
		    	if(isset($Clerks)&&trim($Clerks)!="")
		    	{
		    		$arr_Clerks = explode(",",$Clerks);
		    		if(isset($arr_Clerks))
		    		{
		    			foreach($arr_Clerks as $k=>$v)
		    			{
		    				$userInfo = $this->checkUsername($v);
		    				if(isset($userInfo)&&isset($userInfo['id']))
					    	{
					    		$uid = $userInfo['id'];
					    	}else{
					    		$emailArr = explode("@",$v);
					    		$user->name = $emailArr[0];
					    		$user->username = $v;
					    		$user->email = $v;
						    	$user->password = md5($password);
								$user->user_type = 2;
						    	$user->create_time = time();
						    	$uid = $user->add();
					    	}
					    	if(isset($uid))
					    	{
					    		//插入关系
					    		$store_employee->store_id = $store_id;
					    		$store_employee->user_id = $uid;
					    		$store_employee->type = 2;
					    		$store_employee->add();
					    	}
		    			}
		    		}
		    	}
	    	}else{
	    		$this->error('店长ID获取失败!店长ID：'.$uid);
	    	}
	    	$this->assign('jumpUrl', U("StoreUser/"));
	        $this->success('添加成功!');
    	}else{
    		$this->error('请将表单信息填写完整!');
    	}
    }

    public function update() {
//    	$id = $_REQUEST['id'];
//    	$part_id = $_REQUEST['part_id'];
//    	$name = $_REQUEST['name'];
//    	$password = $_REQUEST['password'];
//    	if(!empty($id))
//    	{
//    		if(!empty($password))
//    		{
//    			$data['password'] = md5($password);
//    		}
//    		if(!empty($name))
//    		{
//    			$data['name'] = $name;
//    		}
//    		$data['part_id'] = $part_id;
//    		$data['id'] = $id;
//    		$model = M('User');
//	        // 更新数据
//	        $list = $model->save($data);
//	        if (false !== $list) {
//	            $this->assign('jumpUrl', U("AllUser/"));
//	            $this->success('编辑成功!');
//	        } else {
//	            //错误提示
	            $this->error('编辑失败!');
//	        }
//    	}else{
//    		//错误提示
//	       	$this->error('编辑失败!');
//    	}
    }
    
    public function delete() {
        //删除指定记录
        $model = M('User');
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
            	$condition = array($pk => array('in', $ids));
                $list = $model->where($condition)->delete();
                if ($list !== false) {
                	//更新商店信息，清除所有符合条件的商店店长
                	$store = M('Store');
                	$map['user_id'] = array('in',$ids);
                	$data['user_id'] = 0;
                	$store->where($map)->save($data);
                    $this->success('删除成功！');
                } else {
                    $this->error('删除失败！');
                }
            } else {
                $this->error('非法操作');
            }
        }
    }
    
    //导出用户信息
    public function export()
    {
    	$this->error('进入导出用户信息');
    }
}
?>