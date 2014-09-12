<?php

// 设置模块-银行卡种类管理
class BankCardTypesAction extends CommonAction {

    public function index() {
        //列表过滤器，生成查询Map对象
        $model = M('Bank');
        if (!empty($model)) {
            $this->_list($model);
        }
        $this->display();
    }
    
    public function search()
    {
    	$search_name = $_REQUEST['search_name'];
    	$b = M('Bank');
    	if(!empty($search_name))
    	{
    		$map['name'] = array('like','%'.$search_name.'%');
    		$this->assign('search_name', $search_name);
	        if (!empty($b)) {
	            $this->_list($b, $map);
	        }
    	}else{
    		if (!empty($b)) {
	            $this->_list($b);
	        }
    	}
        $this->display();
    }
    
    public function add()
    {
        $this->display();
    }
    
    function edit() {
        $model = M('Bank');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        $this->display();
    }
    
    function show() {
        $model = M('Bank');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        $this->display();
    }

    // 插入数据
    public function insert() {
    	$name = $_REQUEST['name'];
    	$type = $_REQUEST['type'];
    	$logo_android = $_FILES['logo_android'];//138×137
    	$logo_ios = $_FILES['logo_ios'];	//83×82
    	$save_type = 'jpg,png,jpeg,BMP,bmp';
        if(!empty($name)&&!empty($type)&&!empty($logo_android['name'])
        	&&!empty($logo_ios['name']))
        {
        	// 创建数据对象
	        $bank = M('Bank');
	        $map['name'] = array('eq',$name);
	        $bankInfo = $bank->field('id')->where($map)->find();
        	if(empty($bankInfo))
        	{
        		$bank->type = $type;
		        $bank->name = $name;
		        if(!empty($logo_android['name']))
				{
					$logo_androidInfo = $this->upload_pic($logo_android,$save_type,'Uploads/bank/android/');
					$bank->logo_android = $logo_androidInfo[0]['savepath'].$logo_androidInfo[0]['savename'];
				}
		        if(!empty($logo_ios['name']))
				{
					$logo_iosInfo = $this->upload_pic($logo_ios,$save_type,'Uploads/bank/ios/');
					$bank->logo_ios = $logo_iosInfo[0]['savepath'].$logo_iosInfo[0]['savename'];
				}
		    	$result = $bank->add();
		        // 写入帐号数据
		        if ($result) {
		            $this->assign('jumpUrl', U("BankCardTypes/"));
		            $this->success('银行卡种类添加成功！');
		        } else {
		            $this->error('银行卡种类添加失败1！');
		        }
        	}else{
        		$this->error('银行卡名称已经存在！');
        	}
        }else{
        	$this->error('银行卡种类添加失败2！');
        }
    }

    public function update() {
    	$id = $_REQUEST['id'];
    	$name = $_REQUEST['name'];
    	$type = $_REQUEST['type'];
    	$logo_android = $_FILES['logo_android'];//138×137
    	$logo_ios = $_FILES['logo_ios'];	//83×82
    	$save_type = 'jpg,png,jpeg,BMP,bmp';
    	if(!empty($id))
    	{
    		if(!empty($name))
    		{
    			$data['name'] = $name;
    		}
    		if(!empty($type))
    		{
    			$data['type'] = $type;
    		}
    		if(!empty($logo_android['name']))
			{
				$logo_androidInfo = $this->upload_pic($logo_android,$save_type,'Uploads/bank/android/');
				$data['logo_android'] = $logo_androidInfo[0]['savepath'].$logo_androidInfo[0]['savename'];
			}
	        if(!empty($logo_ios['name']))
			{
				$logo_iosInfo = $this->upload_pic($logo_ios,$save_type,'Uploads/bank/ios/');
				$data['logo_ios'] = $logo_iosInfo[0]['savepath'].$logo_iosInfo[0]['savename'];
			}
    		$data['id'] = $id;
    		$model = M('Bank');
	        // 更新数据
	        $list = $model->save($data);
	        if (false !== $list) {
	            $this->assign('jumpUrl', U("BankCardTypes/"));
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
        $model = M('Bank');
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