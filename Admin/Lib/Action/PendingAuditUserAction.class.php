<?php

// 设置模块-待审核用户
class PendingAuditUserAction extends AllUserAction {

    public function index() {
        //列表过滤器，生成查询Map对象
        $model = M('User');
        $map['user_type'] = array('eq',1);
        $map['is_auth'] = array('eq',3);
        if (!empty($model)) {
            $this->my_list($model,$map);
        }
        $this->display();
    }
    
    public function search()
    {
    	$search_id = $_REQUEST['search_id'];
    	$search_name = $_REQUEST['search_name'];
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
    	$u = M('User');
    	$map['user_type'] = array('eq',1);
    	$map['is_auth'] = array('eq',3);
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
        		if($is_auth==1)
        		{
        			//认证失败
        			$this->push_auth($id,0);
        		}else if($is_auth==2){
        			//认证成功
        			$this->push_auth($id,1);
        		}
	            $this->assign('jumpUrl', U("PendingAuditUser/"));
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
    
    //导出用户信息
    public function export()
    {
    	$this->error('进入导出用户信息');
    }
}
?>