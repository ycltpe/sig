<?php

// 设置模块-客户APP反馈
class CustomerFeedbackAction extends CommonAction {

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
				$u = M('User');
		        $uList = $u->field('id,name,email')->select();
		        foreach($voList as $k=>$v)
		        {
		        	foreach($uList as $key=>$val)
			        {
			        	if($v['user_id']==$val['id'])
			        	{
			        		$voList[$k]['user_name'] = $val['name'];
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
        $model = M('FeedbackCustomer');
        if (!empty($model)) {
            $this->my_list($model);
        }
        $this->display();
    }
    	
    public function search()
    {
    	$search_username = $_REQUEST['search_username'];
    	$search_content = $_REQUEST['search_content'];
    	if(!empty($search_username))
    	{
    		$u = M('User');
    		$userMap['name'] = array('like','%'.$search_username.'%');
    		$uList = $u->field('id')->where($userMap)->select();
    		$uIds = '';
    		foreach ( $uList as $key => $value ) {
		       if(trim($uIds)=='')
		       {
		       	$uIds = $value['id'];
		       }else{
		       	$uIds = $uIds.','.$value['id'];
		       }
			}
    		$map['user_id'] = array('in',$uIds);
    		$this->assign('search_username', $search_username);
    	}
    	if(!empty($search_content))
    	{
    		$map['content'] = array('like','%'.$search_content.'%');
    		$this->assign('search_content', $search_content);
    	}
    	$model = M('FeedbackCustomer');
        if (!empty($model)) {
        	if(!empty($map))
        	{
        		$this->my_list($model,$map);
        	}else{
        		$this->my_list($model);
        	}
        }
        $this->display();
    }
    
    function show() {
        $model = M('FeedbackCustomer');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        
        $u = M('User');
        $map['id'] = array('eq',$vo['user_id']);
        $uInfo = $u->where($map)->find();
        
        $this->assign('uInfo', $uInfo);
        $this->display();
    }

    public function delete() {
        //删除指定记录
        $model = M('FeedbackCustomer');
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