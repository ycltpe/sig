<?php

// 设置模块-客户帮助说明
class HelpForCustomerAction extends CommonAction {

    public function index() {
    	$map['type'] = array('eq',2);
        //列表过滤器，生成查询Map对象
        $model = M('Help');
        if (!empty($model)) {
            $this->_list($model,$map);
        }
        $this->display();
    }
    
    public function add()
    {
        $this->display();
    }
    
    function edit() {
        //列表过滤器，生成查询Map对象
        $model = M('Help');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        $this->display();
    }

    // 插入数据
    public function insert() {
    	$question = $_REQUEST['question'];
    	$answer = $_REQUEST['answer'];
        if(!empty($question)&&!empty($answer))
        {
        	// 创建数据对象
	        $help = M('Help');
	        $map['question'] = array('eq',$question);
	        $map['type'] = array('eq',2);
	        $helpInfo = $help->field('id')->where($map)->find();
        	if(empty($helpInfo))
        	{
		        $help->question = $question;
		        $help->answer = $answer;
		    	$help->type = 2;
		    	$help->create_time = time();
		    	$result = $help->add();
		        // 写入帐号数据
		        if ($result) {
		            $this->assign('jumpUrl', U("HelpForCustomer/"));
		            $this->success('问题添加成功！');
		        } else {
		            $this->error('问题添加失败！');
		        }
        	}else{
        		$this->error('问题已经存在！');
        	}
        }else{
        	$this->error('问题添加失败！');
        }
    }

    public function update() {
    	$id = $_REQUEST['id'];
    	$question = $_REQUEST['question'];
    	$answer = $_REQUEST['answer'];
    	if(!empty($id))
    	{
    		if(!empty($question))
    		{
    			$data['question'] = $question;
    		}
    		if(!empty($answer))
    		{
    			$data['answer'] = $answer;
    		}
    		$data['id'] = $id;
    		$model = M('Help');
	        // 更新数据
	        $list = $model->save($data);
	        if (false !== $list) {
	            $this->assign('jumpUrl', U("HelpForCustomer/"));
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
        $model = M('Help');
        $pk = $model->getPk();
        $id = $_REQUEST [$pk];
        if (isset($id)) {
			$condition['id'] = array('in', $id);
	    	$list = $model->where($condition)->delete();
	        if ($list !== false) {
	            $this->success('删除成功！');
	        } else {
	            $this->error('删除失败！');
	        }
        } else {
            $this->error('非法操作!');
        }
    }
}
?>