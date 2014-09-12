<?php

// 设置模块-订单反馈
class OrderFeedbackAction extends CommonAction {

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
		        //查看用户名称
		        $u = M('User');
		        $uList = $u->field('id,name')->select();
		        //查看订单编号
		        $f = M('Footprints');
		        $fList = $f->field('id,order_no')->select();
		        foreach($voList as $k=>$v)
		        {
			        foreach($uList as $key=>$val)
			        {
			        	if($v['user_id']==$val['id'])
			        	{
			        		$voList[$k]['user_name'] = $val['name'];
			        	}
			        }
			        foreach($fList as $key=>$val)
			        {
			        	if($val['id']==$v['foot_id'])
			        	{
			        		$voList[$k]['order_no'] = $val['order_no'];
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
        $model = M('OrderFeedback');
        if (!empty($model)) {
            $this->my_list($model);
        }
        $this->display();
    }
    
    public function search()
    {
    	$search_order_no = $_REQUEST['search_order_no'];
    	$search_content = $_REQUEST['search_content'];
    	$of = M('OrderFeedback');
    	if(!empty($search_order_no))
    	{
    		$fIds = "";
    		$f = M('Footprints');
    		$map1['order_no'] = array('like','%'.$search_order_no.'%');
    		$fList = $f->field('id')->where($map1)->select();
    		foreach($fList as $k=>$v)
    		{
    			if($fIds=="")
    			{
    				$fIds = $v['id'];
    			}else{
    				$fIds = $fIds.','.$v['id'];
    			}
    		}
    		$map['foot_id'] = array('in',$fIds);
    		$this->assign('search_order_no', $search_order_no);
    	}
    	if(!empty($search_content))
    	{
    		$map['content'] = array('like','%'.$search_content.'%');
    		$this->assign('search_content', $search_content);
    	}
        if (!empty($of)) {
            $this->my_list($of, $map);
        }
        $this->display();
    }
    
    function show() {
        $model = M('OrderFeedback');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        
        $u = M('User');
        $map['id'] = array('eq',$vo['user_id']);
        $uInfo = $u->field('id,name')->where($map)->find();
        $this->assign('u', $uInfo);
        
        //查看订单编号
        $f = M('Footprints');
        $map1['id'] = array('eq',$vo['foot_id']);
        $fInfo = $f->field('id,order_no')->where($map1)->find();
        $this->assign('f', $fInfo);
        
        $this->display();
    }
}
?>