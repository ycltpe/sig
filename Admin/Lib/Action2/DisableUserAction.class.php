<?php

// 设置模块-禁用用户
class DisableUserAction extends UserAction {

    public function index() {
        //列表过滤器，生成查询Map对象
        $model = M('User');
        $map['user_type'] = array('eq',1);
        $map['status'] = array('eq',1);
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
    	$map['status'] = array('eq',1);
        if (!empty($u)) {
            $this->my_list($u, $map);
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