<?php

// 设置模块-后台用户管理
class AdminUserAction extends CommonAction {

    public function index() {
        //列表过滤器，生成查询Map对象
        $model = M('AdminUser');
        if (!empty($model)) {
            $this->_list($model);
        }
        $this->display();
    }
    
    public function search()
    {
    	$search_username = $_REQUEST['search_username'];
    	$search_part_id = $_REQUEST['search_part_id'];
    	if(!empty($search_part_id))
    	{
    		$map['part_id'] = array('eq',$search_part_id);
    		$this->assign('searchPartId', $search_part_id);
    	}
    	if(!empty($search_username))
    	{
    		$map['username'] = array('like','%'.$search_username.'%');
    		$this->assign('searchUserName', $search_username);
    	}
    	$u = M('AdminUser');
        if (!empty($u)) {
            $this->_list($u, $map);
        }
        $this->display();
    }
    
    public function add()
    {
        $this->display();
    }
    
    function edit() {
        $model = M('AdminUser');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        $this->display();
    }

    // 插入数据
    public function insert() {
    	$part_id = $_REQUEST['part_id'];
    	$name = $_REQUEST['name'];
    	$username = $_REQUEST['username'];
    	$password = $_REQUEST['password'];
        if(!empty($part_id)&&!empty($name)&&!empty($username)&&!empty($password))
        {
        	// 创建数据对象
	        $user = M('AdminUser');
	        $map['username'] = array('eq',$username);
	        $userInfo = $user->field('id')->where($map)->find();
        	if(empty($userInfo))
        	{
        		$user->part_id = $part_id;
		        $user->name = $name;
		        $user->username = $username;
		    	$user->password = md5($password);
		    	$user->create_time = time();
		    	$user->update_time = time();
		    	$result = $user->add();
		        // 写入帐号数据
		        if ($result) {
		            $this->assign('jumpUrl', U("AdminUser/"));
		            $this->success('后台用户添加成功！');
		        } else {
		            $this->error('后台用户添加失败！');
		        }
        	}else{
        		$this->error('用户名已经存在！');
        	}
        }else{
        	$this->error('后台用户添加失败！');
        }
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
    		$model = M('AdminUser');
	        // 更新数据
	        $list = $model->save($data);
	        if (false !== $list) {
	            $this->assign('jumpUrl', U("AdminUser/"));
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
        $model = M('AdminUser');
        $pk = $model->getPk();
        $id = $_REQUEST [$pk];
        if (isset($id)) {
        	if(!in_array($_SESSION[C('USER_AUTH_KEY')],$id))
        	{
        		$condition['id'] = array('in', $id);
            	$list = $model->where($condition)->delete();
                if ($list !== false) {
                    $this->success('删除成功！');
                } else {
                    $this->error('删除失败！');
                }
        	}else{
        		$this->error('不能对自己进行删除操作!');
        	}
        } else {
            $this->error('非法操作!');
        }
    }
}
?>