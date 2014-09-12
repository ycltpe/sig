<?php

// 幻灯片
class SlideAction extends CommonAction {

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
				$s = M('Store');
		        $sList = $s->field('id,cn_name,city_id')->select();
		        foreach($voList as $k=>$v)
		        {
		        	foreach($sList as $key=>$val)
			        {
			        	if($v['store_id']==$val['id'])
			        	{
			        		$voList[$k]['store_name'] = $val['cn_name'];
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
        $model = M('Slide');
        if (!empty($model)) {
            $this->my_list($model);
        }
        $this->display();
    }
    
    public function add()
    {
    	$store = M('Store');
    	$storeList = $store->field('id,en_name,cn_name')->select();
    	$this->assign('storeList', $storeList);
    	
        $this->display();
    }
    
    function edit() {
        $model = M('Slide');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        
        $store = M('Store');
    	$storeList = $store->field('id,en_name,cn_name')->select();
    	$this->assign('storeList', $storeList);
        $this->display();
    }

    // 插入数据
    public function insert() {
    	$pic_name = $_REQUEST['pic_name'];
    	$pic = $_FILES['pic'];
    	$store_id = $_REQUEST['store_id'];
    	$save_type = 'jpg,png,jpeg,BMP,bmp';
        if(!empty($pic_name)&&!empty($pic['name'])&&!empty($store_id))
        {
        	// 创建数据对象
	        $slide = M('Slide');
    		$slide->pic_name = $pic_name;
			$picInfo = $this->upload_pic($pic,$save_type,'Uploads/pic/slide/');
			$slide->pic = $picInfo[0]['savepath'].$picInfo[0]['savename'];
	        $slide->store_id = $store_id;	
	    	$slide->create_time = time();
	    	$result = $slide->add();
	        // 写入帐号数据
	        if ($result) {
	            $this->assign('jumpUrl', U("Slide/"));
	            $this->success('幻灯片添加成功！');
	        } else {
	            $this->error('幻灯片添加失败！');
	        }
    	}else{
    		$this->error('请将表单填写完整！');
    	}
    }

    public function update() {
    	$id = $_REQUEST['id'];
    	$pic_name = $_REQUEST['pic_name'];
    	$pic = $_FILES['pic'];
    	$store_id = $_REQUEST['store_id'];
    	$save_type = 'jpg,png,jpeg,BMP,bmp';
    	if(!empty($id))
    	{
    		if(!empty($pic_name))
    		{
    			$data['pic_name'] = $pic_name;
    		}
    		if(!empty($store_id))
    		{
    			$data['store_id'] = $store_id;
    		}
    		if(!empty($pic['name']))
			{
				$picInfo = $this->upload_pic($pic,$save_type,'Uploads/pic/slide/');
				$data['pic'] = $picInfo[0]['savepath'].$picInfo[0]['savename'];
			}
    		$data['id'] = $id;
    		$model = M('Slide');
	        // 更新数据
	        $list = $model->save($data);
	        if (false !== $list) {
	            $this->assign('jumpUrl', U("Slide/"));
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