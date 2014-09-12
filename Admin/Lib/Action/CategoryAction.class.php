<?php

// 种类
class CategoryAction extends CommonAction {

	public function index() {
        //列表过滤器，生成查询Map对象
        $map = $this->_search();
        if (method_exists($this, '_filter')) {
            $this->_filter($map);
        }
        $name = $this->getActionName();
        $model = M($name);
        if (!empty($model)) {
            $this->_list($model, $map);
        }
        $this->display();
        return;
    }

    public function add()
    {
        $this->display();
    }

    function edit() {
        $model = M('Category');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        $this->display();
    }

    // 插入数据
    public function insert() {
    	$pic = $_FILES['pic'];
    	$cn_name = $_REQUEST['cn_name'];
    	$en_name = $_REQUEST['en_name'];
    	$save_type = 'jpg,png,jpeg,BMP,bmp';
        if(!empty($cn_name)&&!empty($en_name)&&!empty($pic['name']))
        {
        	// 创建数据对象
	        $Category = M('Category');
    		$Category->cn_name = $cn_name;
			$picInfo = $this->upload_pic($pic,$save_type,'Uploads/pic/category/');
			$Category->pic = $picInfo[0]['savepath'].$picInfo[0]['savename'];
	        $Category->en_name = $en_name;
	    	$Category->create_time = time();
	    	$result = $Category->add();
	        // 写入帐号数据
	        if ($result) {
	            $this->assign('jumpUrl', U("Category/"));
	            $this->success('种类添加成功！');
	        } else {
	            $this->error('种类添加失败！');
	        }
    	}else{
    		$this->error('请将表单填写完整！');
    	}
    }

    public function update() {
    	$id = $_REQUEST['id'];
    	$pic = $_FILES['pic'];
    	$cn_name = $_REQUEST['cn_name'];
    	$en_name = $_REQUEST['en_name'];
    	$save_type = 'jpg,png,jpeg,BMP,bmp';
    	if(!empty($id))
    	{
    		if(!empty($cn_name))
    		{
    			$data['cn_name'] = $cn_name;
    		}
    		if(!empty($en_name))
    		{
    			$data['en_name'] = $en_name;
    		}
    		if(!empty($pic['name']))
			{
				$picInfo = $this->upload_pic($pic,$save_type,'Uploads/pic/Category/');
				$data['pic'] = $picInfo[0]['savepath'].$picInfo[0]['savename'];
			}
    		$data['id'] = $id;
    		$model = M('Category');
	        // 更新数据
	        $list = $model->save($data);
	        if (false !== $list) {
	            $this->assign('jumpUrl', U("Category/"));
	            $this->success('编辑成功!');
	        } else {
	            //错误提示
	            $this->error('编辑失败!');
	        }
    	}else{
    		//错误提示
	       	$this->error('请将表单填写完整!');
    	}
    }
}
?>