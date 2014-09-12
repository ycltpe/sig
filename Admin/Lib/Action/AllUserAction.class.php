<?php

// 设置模块-全部用户
class AllUserAction extends CommonAction {

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
		        $uList = $u->field('id,name')->select();
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
//			        		$voList[$k]['is_vip'] = $val['is_vip'];
			        	}
			        }
//			        foreach($commodityList as $key=>$val)
//			        {
//			        	//判断同一个订单的商品
//			        	if($v['id']==$val['order_id'])
//			        	{
//			        		if($v['is_vip']==2)
//			        		{
//			        			
//			        		}else{
//			        			
//			        		}
//			        	}
//			        }
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
        $model = M('User');
        $map['user_type'] = array('eq',1);
        if (!empty($model)) {
            $this->my_list($model,$map);
        }
        $this->display();
    }
    
    public function search()
    {
    	$search_id = $_REQUEST['search_id'];
    	$search_name = $_REQUEST['search_name'];
    	$search_is_auth = $_REQUEST['search_is_auth'];
    	if(!empty($search_id))
    	{
    		$map['id'] = array('like','%'.$search_id.'%');
    		$this->assign('search_id', $search_id);
    	}
    	if(!empty($search_name))
    	{
    		$map['name'] = array('like','%'.$search_name.'%');
    		$this->assign('search_name', $search_name);
    	}
    	if(!empty($search_is_auth))
    	{
    		$map['is_auth'] = array('eq',$search_is_auth);
    		$this->assign('search_is_auth', $search_is_auth);
    	}
    	$u = M('User');
    	$map['user_type'] = array('eq',1);
        if (!empty($u)) {
            $this->my_list($u, $map);
        }
        $this->display();
    }
    
    public function add()
    {
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
    
    public function checkUsername($username) {
        $User = M("User");
        // 检测用户名是否冲突
        $result = $User->getByUsername($username);
        return $result;
    }

    // 插入数据
    public function insert() {
    	$name = $_REQUEST['name'];
    	$username = $_REQUEST['username'];
    	$password = $_REQUEST['password'];
    	$sex = $_REQUEST['sex'];
    	$birthday = $_REQUEST['birthday'];
    	$email = $_REQUEST['email'];
    	$phone = $_REQUEST['phone'];
    	$cahsback = $_REQUEST['cahsback'];
    	$photo = $_FILES['photo'];
    	$IDCard = $_FILES['IDCard'];
    	$is_auth = $_REQUEST['is_auth'];
    	$status = $_REQUEST['status'];
    	$save_type = 'jpg,png,jpeg,BMP,bmp';
    	if(!empty($name)&&!empty($username)&&!empty($password)&&!empty($sex)&&!empty($birthday)
    		&&!empty($email)&&!empty($phone)&&!empty($cahsback))
    	{
    		$res = $this->checkUsername($username);
    		if(!$res||$res['user_type']!=1)
    		{
    			$rqcode = $foot->funname();
    			$birth = date("Y",strtotime($birthday));
				$now = date("Y",time());
				$age = $now-$birth;
		    	$user = M('User');
		    	$user->name = $name;
		    	$user->username = $username;
		    	$user->password = md5($password);
		    	$user->sex = $sex;
		    	$user->birthday = strtotime($birthday);
		    	$user->age = $age;
		    	$user->email = $email;
		    	$user->phone = $phone;
		    	$user->rqcode = $rqcode;
		    	$user->cahsback = $cahsback;
		    	if(!empty($photo['name']))
				{
					$photoInfo = $this->upload_pic($photo,$save_type,'Uploads/photo/');
					$user->photo = $photoInfo[0]['savepath'].$photoInfo[0]['savename'];
				}
				if(!empty($IDCard['name']))
				{
					$IDCardInfo = $this->upload_pic($IDCard,$save_type,'Uploads/IDCard/');
					$user->IDCard = $IDCardInfo[0]['savepath'].$IDCardInfo[0]['savename'];
				}
		    	$user->is_auth = $is_auth;
		    	$user->status = $status;
		    	$re = $user->add();
		    	if($re)
		    	{
		    		$this->assign('jumpUrl', U("AllUser/"));
			        $this->success('添加成功!');
		    	}else{
		    		$this->error('添加失败!');
		    	}
    		}else{
    			$this->error('用户名已存在!');
    		}
    	}else{
    		$this->error('请将表单信息填写完整!');
    	}
    }


    public function update() {
    	$id = $_REQUEST['id'];
    	$name = $_REQUEST['name'];
    	$password = $_REQUEST['password'];
    	$sex = $_REQUEST['sex'];
    	$birthday = $_REQUEST['birthday'];
    	$email = $_REQUEST['email'];
    	$phone = $_REQUEST['phone'];
    	$cahsback = $_REQUEST['cahsback'];
    	$photo = $_FILES['photo'];
    	$IDCard = $_FILES['IDCard'];
    	$is_auth = $_REQUEST['is_auth'];
    	$last_auth = $_REQUEST['last_auth'];
    	$status = $_REQUEST['status'];
    	$save_type = 'jpg,png,jpeg,BMP,bmp';
    	if(!empty($id))
    	{
    		if(!empty($name))
    		{
    			$data['name'] = $name;
    		}
    		if(!empty($sex))
    		{
    			$data['sex'] = $sex;
    		}
    		if(!empty($birthday))
    		{
    			$data['birthday'] = strtotime($birthday);
    			$birth = date("Y",strtotime($birthday));
				$now = date("Y",time());
				$age = $now-$birth;
    			$data['age'] = $age;
    		}
    		if(!empty($password))
    		{
    			$data['password'] = md5($password);
    		}
    		if(!empty($email))
    		{
    			$data['email'] = $email;
    		}
    		if(!empty($phone))
    		{
    			$data['phone'] = $phone;
    		}
    		if(!empty($cahsback))
    		{
    			$data['cahsback'] = $cahsback;
    		}
    		if(!empty($photo['name']))
			{
				$photoInfo = $this->upload_pic($photo,$save_type,'Uploads/photo/');
				$data['photo'] = $photoInfo[0]['savepath'].$photoInfo[0]['savename'];
			}
			if(!empty($IDCard['name']))
			{
				$IDCardInfo = $this->upload_pic($IDCard,$save_type,'Uploads/IDCard/');
				$data['IDCard'] = $IDCardInfo[0]['savepath'].$IDCardInfo[0]['savename'];
			}
    		$data['is_auth'] = $is_auth;
    		$data['status'] = $status;
    		$data['id'] = $id;
    		$model = M('User');
//	        // 更新数据
	        $list = $model->save($data);
	        if (false !== $list) {
	        	if($last_auth==3)
	        	{
	        		if($is_auth==1)
	        		{
	        			//认证失败
	        			$this->push_auth($id,0);
	        		}else if($is_auth==2){
	        			//认证成功
	        			$this->push_auth($id,1);
	        		}
	        	}
	            $this->assign('jumpUrl', U("AllUser/"));
	            $this->success('编辑成功!');
	        } else {
//	            //错误提示
	            $this->error('编辑失败!');
	        }
    	}else{
    		//错误提示
	       	$this->error('编辑失败!');
    	}
    }
    
    public function delete() {
        //删除指定记录
        $model = M('User');
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
                if ($list !== false) {
                    $this->success('删除成功！');
                } else {
                    $this->error('删除失败！');
                }
            } else {
                $this->error('非法操作');
            }
        }
    }
    
    public function regPassword()
    {
    	$id = $_REQUEST['id'];
    	if(!empty($id))
    	{
    		$user = M('User');
	    	$data['id'] = $id;
	    	$data['password'] = md5('123456');
	    	$user->save($data);
	    	$this->success('密码重置成功！');
    	}else{
    		$this->error('非法操作！');
    	}
    }
    
    public function confirmRemind()
    {
    	$id = $_REQUEST['id'];
    	if(!empty($id))
    	{
    		$user = M('User');
	    	$userInfo = $user->field('id,device_type,device_id')->where('id='.$id)->find();
	    	//推送消息
			$title = "确认提醒";
			$description = "这是一条确认提醒消息！";
			$user_id = $userInfo['device_id'];
			$device_type = $userInfo['device_type'];
			parent::push($user_id,$device_type,$title,$description,0,'store');
	    	$this->success('提醒成功！');
    	}else{
    		$this->error('非法操作！');
    	}
    }
    
    public function payRemind()
    {
    	$log=new Log();
    	$log->write('进到支付提醒');
    	$id = $_REQUEST['id'];
    	if(!empty($id))
    	{
    		$user = M('User');
	    	$userInfo = $user->field('id,device_type,device_id')->where('id='.$id)->find();
	    	//推送消息
			$title = "支付提醒";
			$description = "这是一条支付提醒消息！";
			$user_id = $userInfo['device_id'];
			$device_type = $userInfo['device_type'];
			parent::push($user_id,$device_type,$title,$description,0,'store');
	    	$this->success('提醒成功！');
    	}else{
    		$this->error('非法操作！');
    	}
    }
    
    public function push_auth($user_id,$is_auth)
    {
    	$user = M('User');
    	$userInfo = $user->field('id,device_type,device_id')->where('id='.$user_id)->find();
    	//推送消息
		$title = "认证提醒";
		if($is_auth)
		{
			$type = 4;
			$description = "恭喜！您的信息已被认证通过！";
		}else{
			$type = 5;
			$description = "抱歉！您的信息未通过认证！";
		}
		$user_id = $userInfo['device_id'];
		$device_type = $userInfo['device_type'];
		parent::push($user_id,$device_type,$title,$description,$type,'customer');
    }
    
    //导出用户信息
    public function export()
    {
    	$this->error('进入导出用户信息');
    }
}
?>