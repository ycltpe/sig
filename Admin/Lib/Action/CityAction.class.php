<?php

// 城市
class CityAction extends CommonAction {
	
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

    public function search()
    {
    	$search_name = $_REQUEST['search_name'];
    	if(!empty($search_name))
    	{
    		$map['name'] = array('like','%'.$search_name.'%');
    		$this->assign('search_name', $search_name);
    	}
    	$b = M('City');
        if (!empty($b)) {
            $this->_list($b, $map);
        }
        $this->display();
    }
    
    public function add()
    {
        $this->display();
    }
    
    function edit() {
        $model = M('City');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        $this->display();
    }

    // 插入数据
    public function insert() {
    	$name = $_REQUEST['name'];
    	$b = M('City');
        if(!empty($name))
        {
	        $b->name = $name;
	    	$b->create_time = time();
	    	$result = $b->add();
	        // 写入帐号数据
	        if ($result) {
	            $this->assign('jumpUrl', U("City/"));
	            $this->success('城市添加成功！');
	        } else {
	            $this->error('城市添加失败！');
	        }
    	}else{
    		$this->error('请将表单填写完整！');
    	}
    }

    public function update() {
    	$id = $_REQUEST['id'];
    	$name = $_REQUEST['name'];
    	if(!empty($id))
    	{
    		if(!empty($name))
    		{
    			$data['name'] = $name;
    		}
    		$data['id'] = $id;
    		$model = M('City');
	        // 更新数据
	        $list = $model->save($data);
	        if (false !== $list) {
	            $this->assign('jumpUrl', U("City/"));
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
}
?>