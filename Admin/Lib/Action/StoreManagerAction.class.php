<?php

// 
class StoreManagerAction extends CommonAction {

    public function index() {
        //列表过滤器，生成查询Map对象
        $model = M('Store');
        if (!empty($model)) {
            $this->_list($model);
        }
        $this->display();
    }
    
    public function search()
    {
    	$search_id = $_REQUEST['search_id'];
    	$search_name = $_REQUEST['search_name'];
    	if(!empty($search_name))
    	{
    		//英文名称匹配
    		$where['en_name'] = array('like','%'.$search_name.'%','or');
			//中文名称匹配
			$where['cn_name'] = array('like','%'.$search_name.'%','or');
			$where['_logic'] = 'or';
			$map['_complex'] = $where;
    		$this->assign('searchName', $search_name);
    	}
    	if(!empty($search_id))
    	{
    		$map['id'] = array('eq',$search_id);
    		$this->assign('searchId', $search_id);
    	}
    	$s = M('Store');
        if (!empty($s)) {
            $this->_list($s, $map);
        }
        $this->display();
    }
    
    public function add()
    {
    	$city = M('City');
    	$cityList = $city->select();
    	$this->assign('cityList', $cityList);
        $this->display();
    }
    
    function edit() {
        $model = M('Store');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        
        $city = M('City');
    	$cityList = $city->select();
    	$this->assign('cityList', $cityList);
    	
    	$user = M('User');
    	$map['user_type'] = array('eq',2);
    	$map['status'] = array('eq',0);
    	$map['id'] = array('eq',$vo['user_id']);
    	$userInfo = $user->field('id,username')->where($map)->find();
    	$this->assign('userInfo', $userInfo);
        $this->display();
    }
    
    function show() {
        $model = M('Store');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        
        $city = M('City');
    	$cityList = $city->select();
    	$this->assign('cityList', $cityList);
    	
    	$user = M('User');
    	$map['user_type'] = array('eq',2);
    	$map['status'] = array('eq',0);
    	$map['id'] = array('eq',$vo['user_id']);
    	$userInfo = $user->field('id,username')->where($map)->find();
    	$this->assign('userInfo', $userInfo);
        $this->display();
    }
    
    function upload_pic($file,$type, $path,$thumb = false, $water = false, $thumbPrefix = 's_', $thumbMaxWidth = '125', $thumbMaxHeight = '125') {
		import("ORG.Net.UploadFile");
		$upload = new UploadFile();
		if(!empty($file['name'])) {
	        //设置上传文件大小
	        $upload->maxSize = 1*1024*1024;
	        //设置上传文件类型
			$upload->allowExts = explode(',', $type);
			$save_dir = $path.date ( 'Y' ).'/'.date ( 'Ymd' );
			//创建文件夹
			@$this->create_dir ( $save_dir );
	        //设置附件上传目录
			$upload->savePath = $save_dir.'/';
	        //设置上传文件规则
	        $upload->saveRule = uniqid;
	        $info =  $upload->uploadOne($file);
	        if ($info) {
	            //取得成功上传的文件信息
	            $uploadInfo = $info;
	        } else {
	            //捕获上传异常
	            $this->error($upload->getErrorMsg());
	        }
	    } 
        //返回数据对象
        return $uploadInfo;
    }

    // 插入数据
    public function insert() {
    	$cn_name = $_REQUEST['cn_name'];
    	$en_name = $_REQUEST['en_name'];
    	$cn_address = $_REQUEST['cn_address'];
    	$cn_description = $_REQUEST['cn_description'];
    	$cn_detail = $_REQUEST['cn_detail'];
    	$cn_scope_of_business = $_REQUEST['cn_scope_of_business'];
    	$phone = $_REQUEST['phone'];
    	$postcode = $_REQUEST['postcode'];
    	$city_id = $_REQUEST['city_id'];
    	$lng = $_REQUEST['lng'];
    	$lat = $_REQUEST['lat'];
//    	$email = $_REQUEST['email'];
//    	$password = $_REQUEST['password'];
    	$logo = $_FILES['logo'];
    	$pic = $_FILES['pic'];
    	$pic_piece = $_FILES['pic_piece'];
    	$keywords = $_REQUEST['keywords'];
    	$save_type = 'jpg,png,jpeg,BMP,bmp';
    	$log = new Log();
    	$log->write('cn_name:'.$cn_name);
    	$log->write('en_name:'.$en_name);
    	$log->write('cn_address:'.$cn_address);
    	$log->write('cn_description:'.$cn_description);
    	$log->write('cn_detail:'.$cn_detail);
    	$log->write('cn_scope_of_business:'.$cn_scope_of_business);
    	$log->write('phone:'.$phone);
    	$log->write('postcode:'.$postcode);
    	$log->write('city_id:'.$city_id);
    	$log->write('cn_detail:'.$cn_detail);
//    	$log->write('email:'.$email);
//    	$log->write('password:'.$password);
        if(!empty($cn_name)&&!empty($en_name)&&!empty($cn_address)&&
        	!empty($cn_description)&&!empty($cn_detail)&&!empty($cn_scope_of_business)&&
        	!empty($phone)&&!empty($postcode))
        {
//        	//创建数据对象
//	        $user = M('User');
//	        $map['username'] = array('eq',$email);
//	        $userInfo = $user->field('id')->where($map)->find();
//	        //判断用户是否存在
//	        if(empty($userInfo))
//	        {
//	        	//不存在，先添加用户
//	        	$user->username = $email;
//	        	$user->password = md5($password);
//	        	$user->email = $email;
//	        	$user->type = 1;
//	        	$user->user_type = 2;
//	        	$user->status = 0;
//	        	$user->create_time = time();
//	        	$user->update_time = time();
//	        	$r = $user->add();
//	        }else{
//	        	$r = $userInfo['id'];
//	        }
        	// 创建数据对象
	        $store = M('Store');
	        $map1['en_name'] = array('eq',$en_name);
	        $storeInfo = $store->field('id')->where($map1)->find();
        	if(empty($storeInfo))
        	{
        		$store->cn_name = $cn_name;
		        $store->en_name = $en_name;
//		        $store->user_id = $r;
		        $store->cn_address = $cn_address;
		    	$store->cn_description = $cn_description;
		    	$store->cn_detail = $cn_detail;
		    	$store->cn_scope_of_business = $cn_scope_of_business;
		    	$store->phone = $phone;
		    	$store->postcode = $postcode;
		    	$store->lng = $lng;
		    	$store->lat = $lat;
		    	$store->city_id = $city_id;
		    	if(!empty($logo['name']))
				{
					$logoInfo = $this->upload_pic($logo,$save_type,'Uploads/store/logo/');
					$store->logo = $logoInfo[0]['savepath'].$logoInfo[0]['savename'];
				}
				if(!empty($pic['name']))
				{
					$picInfo = $this->upload_pic($pic,$save_type,'Uploads/store/pic/');
					$store->pic = $picInfo[0]['savepath'].$picInfo[0]['savename'];
				}
				if(!empty($pic_piece['name']))
				{
					$pic_pieceInfo = $this->upload_pic($pic_piece,$save_type,'Uploads/store/pic_piece/');
					$store->pic_piece = $pic_pieceInfo[0]['savepath'].$pic_pieceInfo[0]['savename'];
				}
		    	$store->keywords = $keywords;
		    	$store->create_time = time();
		    	$res = $store->add();
		    	$log->write($store->getLastSql());
		        // 写入帐号数据
		        if ($res) {
//		        	//向员工表中添加经理权限
//			        $storeEmployee = M('StoreEmployee');
//			        $storeEmployee->store_id = $res;
//			        $storeEmployee->user_id = $r;
//			        $storeEmployee->type = 2;//经理
//			        $storeEmployee->add();
		            $this->assign('jumpUrl', U("StoreManager/"));
		            $this->success('添加成功！');
		        } else {
		            $this->error('添加失败！');
		        }
        	}else{
        		$this->error('商店名已经存在！');
        	}
        }else{
        	$this->error('信息填写不完整！');
        }
    }

    public function update() {
    	$id = $_REQUEST['id'];
    	$cn_name = $_REQUEST['cn_name'];
    	$en_name = $_REQUEST['en_name'];
    	$cn_address = $_REQUEST['cn_address'];
    	$cn_description = $_REQUEST['cn_description'];
    	$cn_detail = $_REQUEST['cn_detail'];
    	$cn_scope_of_business = $_REQUEST['cn_scope_of_business'];
    	$phone = $_REQUEST['phone'];
    	$postcode = $_REQUEST['postcode'];
    	$lng = $_REQUEST['lng'];
    	$lat = $_REQUEST['lat'];
    	$city_id = $_REQUEST['city_id'];
    	$logo = $_FILES['logo'];
    	$pic = $_FILES['pic'];
    	$pic_piece = $_FILES['pic_piece'];
    	$keywords = $_REQUEST['keywords'];
    	$save_type = 'jpg,png,jpeg,BMP,bmp';
    	$log = new Log();
    	$log->write('id:'.$id);
    	$log->write('cn_name:'.$cn_name);
    	$log->write('en_name:'.$en_name);
    	$log->write('cn_address:'.$cn_address);
    	$log->write('cn_description:'.$cn_description);
    	$log->write('cn_detail:'.$cn_detail);
    	$log->write('cn_scope_of_business:'.$cn_scope_of_business);
    	$log->write('phone:'.$phone);
    	$log->write('postcode:'.$postcode);
    	$log->write('city_id:'.$city_id);
    	$log->write('cn_detail:'.$cn_detail);
        if(!empty($id)&&!empty($cn_name)&&!empty($en_name)&&!empty($cn_address)&&
        	!empty($cn_description)&&!empty($cn_detail)&&!empty($cn_scope_of_business)&&
        	!empty($phone)&&!empty($postcode))
        {
        	// 创建数据对象
	        $store = M('Store');
	        $map1['en_name'] = array('eq',$en_name);
	        $map1['id'] = array('neq',$id);
	        $storeInfo = $store->field('id')->where($map1)->find();
        	if(empty($storeInfo))
        	{
        		$data['id'] = $id;
        		$data['cn_name'] = $cn_name;
		        $data['en_name'] = $en_name;
		        $data['cn_address'] = $cn_address;
		    	$data['cn_description'] = $cn_description;
		    	$data['cn_detail'] = $cn_detail;
		    	$data['cn_scope_of_business'] = $cn_scope_of_business;
		    	$data['phone'] = $phone;
		    	$data['postcode'] = $postcode;
		    	$data['lng'] = $lng;
		    	$data['lat'] = $lat;
		    	$data['city_id'] = $city_id;
		    	if(!empty($logo['name']))
				{
					$logoInfo = $this->upload_pic($logo,$save_type,'Uploads/store/logo/');
					$data['logo'] = $logoInfo[0]['savepath'].$logoInfo[0]['savename'];
				}
				if(!empty($pic['name']))
				{
					$picInfo = $this->upload_pic($pic,$save_type,'Uploads/store/pic/');
					$data['pic'] = $picInfo[0]['savepath'].$picInfo[0]['savename'];
				}
				if(!empty($pic_piece['name']))
				{
					$pic_pieceInfo = $this->upload_pic($pic_piece,$save_type,'Uploads/store/pic_piece/');
					$data['pic_piece'] = $pic_pieceInfo[0]['savepath'].$pic_pieceInfo[0]['savename'];
				}
		    	$data['keywords'] = $keywords;
		    	$res = $store->save($data);
		    	$log->write($store->getLastSql());
		        // 写入帐号数据
		        if ($res) {
		            $this->assign('jumpUrl', U("StoreManager/"));
		            $this->success('编辑成功！');
		        } else if($res==0) {
		            $this->error('您没有修改任何数据！');
		        }else {
		            $this->error('编辑失败！');
		        }
        	}else{
        		$this->error('商店名已经存在！');
        	}
        }else{
        	$this->error('信息填写不完整！');
        }
    }

    public function delete() {
        //删除指定记录
        $model = M('Store');
        $pk = $model->getPk();
        $id = $_REQUEST [$pk];
        if (isset($id)) {
        	if(!in_array($_SESSION[C('USER_AUTH_KEY')],$id))
        	{
        		$condition['id'] = array('in', $id);
            	$list = $model->where($condition)->delete();
                if ($list !== false) {
                	//删除足迹
                	$footprints = M('Footprints');
                	$footMap['store_id'] = array('in',$id);
                	$footprints->where($footMap)->delete();
                	//删除商品
                	$commodity = M('Commodity');
                	$commodityMap['store_id'] = array('in',$id);
                	$commodity->where($commodityMap)->delete();
                	//删除推送
                	$push = M('PushToday');
                	$pushMap['_string'] = 'commodity_id!=0 AND commodity_id not in (select id from t_commodity)';
                	$push->where($commodityMap)->delete();
                	//查询商店的拥有者
                	$store_employee = M('StoreEmployee');
                	$store_employeeMap['store_id'] = array('in',$id);
                	$store_employeeMap['type'] = array('eq',1);
                	$employeeList = $store_employee->field('user_id')->where($store_employeeMap)->select();
                	$delete_user_id = "";
                	//拼接需要删除的用户ID字符串
                	foreach($employeeList as $k=>$v)
                	{
                		if($delete_user_id=="")
                		{
                			$delete_user_id = $v['user_id'];
                		}else{
                			$delete_user_id = $delete_user_id.','.$v['user_id'];
                		}
                	}
                	//根据拼接后需要删除的用户ID字符串查询商店
                	$storeMap['user_id'] = array('in',$delete_user_id);
                	$otherStoreList = $model->field('user_id')->where($storeMap)->select();
                	//判断商店所有者是否还有其他店，如果没有，删除该用户
                	$user = M('User');	
                	if(!empty($otherStoreList))
                	{
                		//定义存在其他商店的用户ID字符串
	                	$other_id = "";
	                	//拼接还存在其他商店的用户ID字符串
	                	foreach($otherStoreList as $k=>$v)
	                	{
	                		if($other_id=="")
	                		{
	                			$other_id = $v['user_id'];
	                		}else{
	                			$other_id = $other_id.','.$v['user_id'];
	                		}
	                	}
//                		$map['id'] = array('in',$delete_user_id);
//	                	$map['id'] = array('not in',$other_id);
						if(!empty($delete_user_id))	//执行删除前提，否则可能删除错误
						{
							$map['_string'] = 'id in ('.$delete_user_id.') and id not in ('.$other_id.')';
                			$user->where($map)->delete();
						}
                	}else{
                		$map['id'] = array('in',$delete_user_id);
                		$user->where($map)->delete();
                	}
                	//删除商店用户关系
                	$store_employeeMap1['store_id'] = array('in',$id);
                	$store_employee->where($store_employeeMap1)->delete();
                    $this->success('删除成功！');
                } else {
                    $this->error('删除失败！');
                }
        	}else{
        		$this->error('不能对自己进行删除操作!');
        	}
        } else {
            $this->error('非法操作!');
        }
    }
    
    public function comment_list($model, $map, $sortBy = '', $asc = false, $group = '') {
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
				$user = M('User');
				foreach($voList as $k=>$v)
				{
					$userMap['id'] = array('eq',$v['user_id']);
					$userInfo = $user->field('id,username,photo')->where($userMap)->find();
					$voList[$k]['username'] = $userInfo['username'];
					$voList[$k]['photo'] = $userInfo['photo'];
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
    
    public function commentList()
    {
    	$store_id = $_REQUEST['id'];
    	$comment = M('Comment');
    	$map['store_id'] = array('eq',$store_id);
    	if (!empty($comment)) {
            $this->comment_list($comment,$map);
        }
    	$this->display();
    }
    
    public function commodity_list($store_id,$model, $map, $sortBy = '', $asc = false, $group = '') {
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
				$store = M('Store');
				$storeMap['t1.id'] = array('eq',$store_id);
				$storeInfo = $store->table('t_store t1')->field('t1.id,t2.name')->join('t_city t2 on t1.city_id = t2.id')->where($storeMap)->find();
				$brand = M('Brand');
				$category = M('Category');
				foreach($voList as $k=>$v)
				{
					$brandMap['id'] = array('eq',$v['brand_id']);
					$brandInfo = $brand->field('id,name')->where($brandMap)->find();
					$voList[$k]['brand_name'] = $brandInfo['name'];
					$categoryMap['id'] = array('eq',$v['category_id']);
					$categoryInfo = $category->field('id,cn_name')->where($categoryMap)->find();
					$voList[$k]['category_name'] = $categoryInfo['cn_name'];
					$voList[$k]['city_name'] = $storeInfo['name'];
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
    
    //查看返利商品
    public function commodityList()
    {
    	$store_id = $_REQUEST['id'];
    	$commodity = M('Commodity');
    	$map['store_id'] = array('eq',$store_id);
    	//呈现给用户的返利比例>0
    	$map['user_rebates'] = array('GT',0);
    	if (!empty($commodity)) {
    		$this->assign('store_id', $store_id);
            $this->commodity_list($store_id,$commodity,$map);
        }
    	$this->display();
    }
    
    //查看返利商品
    public function searchCommodity()
    {
    	$store_id = $_REQUEST['store_id'];
    	$search_name = $_REQUEST['search_name'];
    	$commodity = M('Commodity');
    	$map['store_id'] = array('eq',$store_id);
    	if(!empty($search_name))
    	{
    		$map['cn_name'] = array('like','%'.$search_name.'%');
    		$this->assign('search_name', $search_name);
    	}
    	//呈现给用户的返利比例>0
    	$map['user_rebates'] = array('GT',0);
    	if (!empty($commodity)) {
    		$this->assign('store_id', $store_id);
            $this->commodity_list($store_id,$commodity,$map);
        }
    	$this->display();
    }
    
    public function addCommodity()
    {
    	$store_id = $_REQUEST['store_id'];
    	
    	$brand = M('Brand');
    	$brandList = $brand->select();
    	$this->assign('brandList', $brandList);
    	
    	$category = M('Category');
    	$categoryList = $category->select();
    	$this->assign('categoryList', $categoryList);
    	
    	$city = M('City');
    	$cityList = $city->select();
    	$this->assign('cityList', $cityList);
    	
    	if(!empty($store_id))
    	{
    		$store = M('Store');
    		$map['id'] = array('eq',$store_id);
    		$storeInfo = $store->field('city_id,cn_name,en_name')->where($map)->find();
    		$this->assign('storeInfo', $storeInfo);
    		$this->assign('store_id', $store_id);
    	}
    	$this->display();
    }
    
    public function editCommodity()
    {
    	$model = M('Commodity');
    	$id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
    	
    	$brand = M('Brand');
    	$brandList = $brand->select();
    	$this->assign('brandList', $brandList);
    	
    	$category = M('Category');
    	$categoryList = $category->select();
    	$this->assign('categoryList', $categoryList);
    	
    	$city = M('City');
    	$cityList = $city->select();
    	$this->assign('cityList', $cityList);
    	
    	if(!empty($vo))
    	{
    		$store = M('Store');
    		$map['id'] = array('eq',$vo['store_id']);
    		$storeInfo = $store->field('city_id,cn_name,en_name')->where($map)->find();
    		$this->assign('storeInfo', $storeInfo);
    	}
    	$this->display();
    }
    
    public function showCommodity()
    {
    	$model = M('Commodity');
    	$id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
    	
    	$brand = M('Brand');
    	$map['id'] = array('eq',$vo['brand_id']);
    	$brandInfo = $brand->where($map)->find();
    	$this->assign('brandInfo', $brandInfo);
    	
    	$category = M('Category');
    	$map1['id'] = array('eq',$vo['category_id']);
    	$categoryInfo = $category->where($map1)->find();
    	$this->assign('categoryInfo', $categoryInfo);
    	
    	if(!empty($vo))
    	{
    		$store = M('Store');
    		$map3['id'] = array('eq',$vo['store_id']);
    		$storeInfo = $store->field('city_id,cn_name,en_name')->where($map3)->find();
    		$this->assign('storeInfo', $storeInfo);
    		
    		$city = M('City');
    		$map4['id'] = array('eq',$storeInfo['city_id']);
	    	$cityInfo = $city->where($map4)->find();
	    	$this->assign('cityInfo', $cityInfo);
    	}
    	$this->display();
    }
    
    public function insertCommodity()
    {
    	$logo = $_FILES['logo'];
    	$cn_name = $_REQUEST['cn_name'];
    	$en_name = $_REQUEST['en_name'];
    	$brand_id = $_REQUEST['brand_id'];
    	$category_id = $_REQUEST['category_id'];
    	$city_id = $_REQUEST['city_id'];
    	$user_rebates = $_REQUEST['user_rebates'];
    	$vip_rebates = $_REQUEST['vip_rebates'];
    	$rebates = $_REQUEST['rebates'];
    	$price = $_REQUEST['price'];
    	$store_id = $_REQUEST['store_id'];
    	$save_type = 'jpg,png,jpeg,BMP,bmp';
    	$log = new Log();
    	$log->write("cn_name:".$cn_name);
    	$log->write("en_name:".$en_name);
    	$log->write("brand_id:".$brand_id);
    	$log->write("category_id:".$category_id);
    	$log->write("user_rebates:".$user_rebates);
    	$log->write("vip_rebates:".$vip_rebates);
    	$log->write("rebates:".$rebates);
    	$log->write("price:".$price);
    	$log->write("store_id:".$store_id);
    	if(!empty($cn_name)&&!empty($en_name)&&!empty($brand_id)&&!empty($category_id)
    		&&!empty($user_rebates)&&!empty($vip_rebates)&&!empty($rebates)
    		&&!empty($price)&&!empty($store_id))
    	{
    		$Commodity = M('Commodity');
	    	if(!empty($logo['name']))
			{
				$logoInfo = $this->upload_pic($logo,$save_type,'Uploads/commodity/logo/');
				$Commodity->logo = $logoInfo[0]['savepath'].$logoInfo[0]['savename'];
			}
			$Commodity->cn_name = $cn_name;
	    	$Commodity->en_name = $en_name;
	    	$Commodity->brand_id = $brand_id;
	    	$Commodity->category_id = $category_id;
	    	$Commodity->user_rebates = $user_rebates;
	    	$Commodity->vip_rebates = $vip_rebates;
	    	$Commodity->rebates = $rebates;
	    	$Commodity->price = $price;
	    	$Commodity->store_id = $store_id;
	    	$res = $Commodity->add();
	    	if($res)
	    	{
	    		$this->assign('jumpUrl', U("StoreManager/commodityList?id=".$store_id));
	    		$this->success('添加成功!');
	    	}else{
	    		$this->error('添加失败!');
	    	}
    	}else{
    		$this->error('添加失败，商品信息不完整!');
    	}
    }
    
    public function updateCommodity()
    {
    	$id = $_REQUEST['id'];
    	$logo = $_FILES['logo'];
    	$cn_name = $_REQUEST['cn_name'];
    	$en_name = $_REQUEST['en_name'];
    	$brand_id = $_REQUEST['brand_id'];
    	$category_id = $_REQUEST['category_id'];
    	$city_id = $_REQUEST['city_id'];
    	$user_rebates = $_REQUEST['user_rebates'];
    	$vip_rebates = $_REQUEST['vip_rebates'];
    	$rebates = $_REQUEST['rebates'];
    	$price = $_REQUEST['price'];
    	$store_id = $_REQUEST['store_id'];
    	$save_type = 'jpg,png,jpeg,BMP,bmp';
    	$log = new Log();
    	$log->write("id:".$id);
    	$log->write("cn_name:".$cn_name);
    	$log->write("en_name:".$en_name);
    	$log->write("brand_id:".$brand_id);
    	$log->write("category_id:".$category_id);
    	$log->write("user_rebates:".$user_rebates);
    	$log->write("vip_rebates:".$vip_rebates);
    	$log->write("rebates:".$rebates);
    	$log->write("price:".$price);
    	$log->write("store_id:".$store_id);
    	if(!empty($cn_name)&&!empty($en_name)&&!empty($brand_id)&&!empty($category_id)
    		&&!empty($user_rebates)&&!empty($vip_rebates)&&!empty($rebates)
    		&&!empty($price)&&!empty($id))
    	{
    		$Commodity = M('Commodity');
	    	if(!empty($logo['name']))
			{
				$logoInfo = $this->upload_pic($logo,$save_type,'Uploads/commodity/logo/');
				$data['logo'] = $logoInfo[0]['savepath'].$logoInfo[0]['savename'];
			}
			$data['cn_name'] = $cn_name;
	    	$data['en_name'] = $en_name;
	    	$data['brand_id'] = $brand_id;
	    	$data['category_id'] = $category_id;
	    	$data['user_rebates'] = $user_rebates;
	    	$data['vip_rebates'] = $vip_rebates;
	    	$data['rebates'] = $rebates;
	    	$data['price'] = $price;
	    	$data['id'] = $id;
	    	$res = $Commodity->save($data);
	    	if($res)
	    	{
	    		$this->assign('jumpUrl', U("StoreManager/commodityList?id=".$store_id));
	    		$this->success('添加成功!');
	    	}else{
	    		$this->error('添加失败!');
	    	}
    	}else{
    		$this->error('添加失败，商品信息不完整!');
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