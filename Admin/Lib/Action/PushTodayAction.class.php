<?php

// 
class PushTodayAction extends CommonAction {

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
				//查看商店名称
				$s = M('Store');
		        $sList = $s->field('id,cn_name')->select();
		        //查看商品信息
				$c = M('Commodity');
		        $cList = $c->field('id,store_id,cn_name,price,user_rebates')->select();
		        foreach($voList as $k=>$v)
		        {
		        	foreach($sList as $key=>$val)
			        {
			        	if($v['type']==2&&$v['other_id']==$val['id'])
			        	{
			        		$voList[$k]['store_name'] = $val['cn_name'];
			        	}
			        }
			        foreach($cList as $key=>$val)
			        {
			        	if($v['type']==3&&$v['other_id']==$val['id'])
			        	{
			        		foreach($sList as $key1=>$val1)
					        {
					        	if($val['store_id']==$val1['id'])
					        	{
					        		$voList[$k]['store_name'] = $val1['cn_name'];
					        	}
					        }
			        		$voList[$k]['commodity_name'] = $val['cn_name'];
			        		$voList[$k]['commodity_price'] = $val['price'];
			        		$voList[$k]['commodity_rebates'] = $val['user_rebates'];
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
        $model = M('PushToday');
        if (!empty($model)) {
            $this->my_list($model);
        }
        $this->display();
    }
    
    public function search()
    {
    	$search_name = $_REQUEST['search_name'];
    	if(!empty($search_name))
    	{
    		$map['name'] = array('like','%'.$search_name.'%');
    		$this->assign('searchName', $search_name);
    	}
    	$model = M('PushToday');
        if (!empty($model)) {
            $this->my_list($model, $map);
        }
        $this->display();
    }
    
    public function add()
    {
    	$store = M('Store');
        $commodity = M('commodity');
        $storeList = $store->field('id,en_name,cn_name')->select();
        $commodityList = $commodity->field('id,store_id,en_name,cn_name')->select();
        $this->assign('storeList', $storeList);
        $this->assign('commodityList', $commodityList);
        $this->display();
    }
    
    function edit() {
        $model = M('PushToday');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        
        $store = M('Store');
        $commodity = M('commodity');
        $storeList = $store->field('id,en_name,cn_name')->select();
        $commodityList = $commodity->field('id,store_id,en_name,cn_name')->select();
        $this->assign('storeList', $storeList);
        $this->assign('commodityList', $commodityList);
        
        if($vo['type']==2)
        {
        	$map['store_id'] = array('eq',$vo['other_id']);
	        $commodity1List = $commodity->field('id,store_id,en_name,cn_name')->where($map)->select();
	        $this->assign('commodity1List', $commodity1List);
	        $this->assign('storeId', $vo['other_id']);
        }else if($vo['type']==3)
        {
        	$map['id'] = array('eq',$vo['other_id']);
	        $commodityInfo = $commodity->field('id,store_id')->where($map)->find();
	        $map1['store_id'] = array('eq',$commodityInfo['store_id']);
	        $commodity1List = $commodity->field('id,store_id,en_name,cn_name')->where($map1)->select();
	        $this->assign('storeId', $commodityInfo['store_id']);
	        $this->assign('commodity1List', $commodity1List);
        }
        $this->display();
    }
    
    function show() {
        $model = M('PushToday');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        
        $store = M('Store');
        $commodity = M('commodity');
        $storeList = $store->field('id,en_name,cn_name')->select();
        $this->assign('storeList', $storeList);
        
        if($vo['type']==2)
        {
        	$map['store_id'] = array('eq',$vo['other_id']);
	        $commodityList = $commodity->field('id,store_id,en_name,cn_name')->where($map)->select();
	        $this->assign('commodityList', $commodityList);
	        $this->assign('storeId', $vo['other_id']);
        }else if($vo['type']==3)
        {
        	$map['id'] = array('eq',$vo['other_id']);
	        $commodityInfo = $commodity->field('id,store_id')->where($map)->find();
	        $map1['store_id'] = array('eq',$commodityInfo['store_id']);
	        $commodityList = $commodity->field('id,store_id,en_name,cn_name')->where($map1)->select();
	        $this->assign('storeId', $commodityInfo['store_id']);
	        $this->assign('commodityList', $commodityList);
        }
        $this->display();
    }
    
    function show_history() {
        $model = M('PushToday');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        
        $store = M('Store');
        $commodity = M('commodity');
        $storeList = $store->field('id,en_name,cn_name')->select();
        $this->assign('storeList', $storeList);
        
        if($vo['type']==2)
        {
        	$map['store_id'] = array('eq',$vo['other_id']);
	        $commodityList = $commodity->field('id,store_id,en_name,cn_name')->where($map)->select();
	        $this->assign('commodityList', $commodityList);
	        $this->assign('storeId', $vo['other_id']);
        }else if($vo['type']==3)
        {
        	$map['id'] = array('eq',$vo['other_id']);
	        $commodityInfo = $commodity->field('id,store_id')->where($map)->find();
	        $map1['store_id'] = array('eq',$commodityInfo['store_id']);
	        $commodityList = $commodity->field('id,store_id,en_name,cn_name')->where($map1)->select();
	        $this->assign('storeId', $commodityInfo['store_id']);
	        $this->assign('commodityList', $commodityList);
        }
        $this->display();
    }
    
    //推送历史
    public function push_history()
    {
    	$push_history = M('PushTodayHistory');
    	if (!empty($push_history)) {
            $this->my_list($push_history);
        }
        $this->display();
    }
    
    //推送
    public function push_start()
    {
    	$search_id = $_REQUEST['search_id'];
    	//推送指定记录
        $model = M('PushToday');
        $pk = $model->getPk();
        $id = $_REQUEST [$pk];
        if(!empty($id))
        {
        	//根据search_id找到适合推送人群
        	if($search_id==1)
        	{
        		$search_map['sex'] = array('neq','女');
        		$search_map['user_type'] = array('eq',1);
        	}else if($search_id==2)
        	{
        		$search_map['sex'] = array('neq','男');
        		$search_map['user_type'] = array('eq',1);
        	}else{
        		$search_map['user_type'] = array('eq',1);
        	}
        	$user = M('User');
			$userList = $user->field('id,device_type,device_id')->where($search_map)->select();
        	if(strstr($id, ','))
	    	{
	    		$condition = explode(',', $id);
	    	}else{
	    		$condition = $id;
	    	}
	    	$map['id'] = array('in',$condition);
	    	$pushList = $model->where($map)->select();
	    	$i = -1;
	    	$data = array();
	    	foreach ( $pushList as $k => $v ) {
	    		$i++;
	    		foreach($userList as $key=>$value)
	    		{
	    			//推送消息
					$title = "今日推送";
					$type=9;
					$description = "您有一条新的今日推送消息！";
					$user_id = $value['device_id'];
					$device_type = $value['device_type'];
					parent::push($user_id,$device_type,$title,$description,$type,'customer');
	    		}
			    $data[$i]['type'] = $v['type'];
			    $data[$i]['sex'] = $search_id;
			    $data[$i]['other_id'] = $v['other_id'];
			    $data[$i]['poster'] = $v['poster'];
			    $data[$i]['poster_big'] = $v['poster_big'];
			    $data[$i]['show_list_pic'] = $v['show_list_pic'];
			    $data[$i]['show_list_pic_big'] = $v['show_list_pic_big'];
			    $data[$i]['status'] = 1;
			    $data[$i]['create_time'] = time();
			}
			if(!empty($data))
			{
				$push_history = M('PushTodayHistory');
				$re = $push_history->addAll($data);
				if($re)
				{
					$this->assign('jumpUrl', U("PushToday/push_history"));
	            	$this->success('推送成功！');
				}else{
					$this->error('推送失败！');
				}
			}else{
				$this->error('非法操作！');
			}
        }else{
        	$this->error('您没有选择推送信息！');
        }
    }
    
    // 文件上传
    function upload_pic($file,$type, $thumb = true, $water = false, $thumbPrefix = 's_', $thumbMaxWidth = '77', $thumbMaxHeight = '58') {
    	import("ORG.Net.UploadFile");
    	$upload = new UploadFile();
//    	$uploadList = array();
//    	foreach($pics as $key=>$file)
//    	{
    		if(!empty($file['name'])) {
		        //设置上传文件大小
		        $upload->maxSize = 2*1024*1024;
		        //设置上传文件类型
				$upload->allowExts = explode(',', $type);
				$save_dir = "Uploads/poster/".date ( 'Y' ).'/'.date ( 'Ymd' );
				//创建文件夹
				@$this->create_dir ( $save_dir );
		        //设置附件上传目录
				$upload->savePath = $save_dir.'/';
		        //设置上传文件规则
		        $upload->saveRule = uniqid;
		        //设置需要生成缩略图，仅对图像文件有效
		        $upload->thumb = $thumb;
		        // 设置引用图片类库包路径
		        $upload->imageClassPath = 'ORG.Util.Image';
		        //设置需要生成缩略图的文件后缀
		        $upload->thumbPrefix = $thumbPrefix;  //生产1张缩略图
		        //设置缩略图最大宽度
		        $upload->thumbMaxWidth = $thumbMaxWidth;
		        //$upload->thumbMaxWidth = '414,311';
		        //设置缩略图最大高度
		        $upload->thumbMaxHeight = $thumbMaxHeight;
		        //$upload->thumbMaxHeight = '414,311';
		        $upload->thumbRemoveOrigin = false; //不删除原图
		        $info =  $upload->uploadOne($file);
		        if ($info) {
		            //取得成功上传的文件信息
		            $uploadInfo = $info;
		        } else {
		            //捕获上传异常
		            $this->error($upload->getErrorMsg());
		        }
		    } 
//    	}
        //返回数据对象
        return $uploadInfo;
    }

    // 插入数据
    public function insert() {
    	$type = $_REQUEST['type'];
    	$store_id = $_REQUEST['store_id'];
    	$commodity_id = $_REQUEST['commodity_id'];
    	$poster = $_FILES['poster'];
    	$show_list_pic = $_FILES['show_list_pic'];
    	$save_type = 'jpg,png,jpeg,BMP,bmp';
        if(!empty($type))
        {
        	// 创建数据对象
	        $push = M('PushToday');
    		$push->type = $type;
	        if($commodity_id!=0)
	        {
	        	$push->other_id = $commodity_id;
	        }else if($store_id!=0){
	        	$push->store_id = $store_id;
	        }
	        if(!empty($poster['name']))
			{
				$picInfo = $this->upload_pic($poster,$save_type);
				$push->poster = $picInfo[0]['savepath'].'s_'.$picInfo[0]['savename'];
				$push->poster_big = $picInfo[0]['savepath'].$picInfo[0]['savename'];
			}
			if(!empty($show_list_pic['name']))
			{
				$picInfo = $this->upload_pic($show_list_pic,$save_type);
				$push->show_list_pic = $picInfo[0]['savepath'].'s_'.$picInfo[0]['savename'];
				$push->show_list_pic_big = $picInfo[0]['savepath'].$picInfo[0]['savename'];
			}
	    	$push->create_time = time();
	    	$result = $push->add();
	        // 写入帐号数据
	        if ($result) {
	            $this->assign('jumpUrl', U("PushToday/"));
	            $this->success('今日推送添加成功！');
	        } else {
	            $this->error('今日推送添加失败！');
	        }
        }else{
        	$this->error('今日推送添加失败！');
        }
    }

    public function update() {
    	$id = $_REQUEST['id'];
    	$type = $_REQUEST['type'];
    	$store_id = $_REQUEST['store_id'];
    	$commodity_id = $_REQUEST['commodity_id'];
    	$poster = $_FILES['poster'];
    	$show_list_pic = $_FILES['show_list_pic'];
    	$save_type = 'jpg,png,jpeg,BMP,bmp';
    	if(!empty($id))
    	{
    		if(!empty($type))
    		{
    			$data['type'] = $type;
    		}
    		if(!empty($commodity_id))
    		{
    			$data['other_id'] = $commodity_id;
    		}else if(!empty($store_id))
    		{
    			$data['other_id'] = $store_id;	
    		}
    		// 创建数据对象
	        if(!empty($poster['name']))
			{
				$picInfo = $this->upload_pic($poster,$save_type);
				$data['poster'] = $picInfo[0]['savepath'].'s_'.$picInfo[0]['savename'];
				$data['poster_big'] = $picInfo[0]['savepath'].$picInfo[0]['savename'];
			}
			if(!empty($show_list_pic['name']))
			{
				$picInfo = $this->upload_pic($show_list_pic,$save_type);
				$data['show_list_pic'] = $picInfo[0]['savepath'].'s_'.$picInfo[0]['savename'];
				$data['show_list_pic_big'] = $picInfo[0]['savepath'].$picInfo[0]['savename'];
			}
    		$data['id'] = $id;
    		$model = M('PushToday');
	        // 更新数据
	        $list = $model->save($data);
	        if (false !== $list) {
	            $this->assign('jumpUrl', U("PushToday/"));
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
        $model = M('PushToday');
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
    
    public function deleteHistory() {
        //删除指定记录
        $model = M('PushTodayHistory');
        $pk = $model->getPk();
        $id = $_REQUEST [$pk];
        if (isset($id)) {
    		$condition['id'] = array('in', $id);
        	$list = $model->where($condition)->delete();
            if ($list !== false) {
            	$this->assign('jumpUrl', U("PushToday/push_history"));
                $this->success('删除成功！');
            } else {
                $this->error('删除失败！');
            }
        } else {
            $this->error('非法操作!');
        }
    }
    
    public function export()
    {
    	$u = M('User');
    	$uList = $u->field('name,email,type,phone')->select();
    	$titles = array();
    	$titles[] = "用户姓名";
    	$titles[] = "用户邮箱";
    	$titles[] = "类型（1：工程师；2：客户）";
    	$titles[] = "电话";
    	parent::exportexcel($uList,$titles,"user");
    }
}
?>