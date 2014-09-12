<?php

// 设置模块-未认证用户
class NotAuthUserAction extends AllUserAction {

    public function index() {
        //列表过滤器，生成查询Map对象
        $model = M('User');
        $map['user_type'] = array('eq',1);
        $map['is_auth'] = array('eq',1);
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
    	$map['is_auth'] = array('eq',1);
        if (!empty($u)) {
            $this->my_list($u, $map);
        }
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
	            $this->assign('jumpUrl', U("NotAuthUser/"));
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
}
?>