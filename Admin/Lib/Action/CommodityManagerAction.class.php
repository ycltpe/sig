<?php

// 
class CommodityManagerAction extends CommonAction {

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
				$b = M('Brand');
				$c = M('Category');
				$city = M('City');
		        $sList = $s->field('id,cn_name,city_id')->select();
		        $bList = $b->field('id,name')->select();
		        $cList = $c->field('id,cn_name')->select();
		        $cityList = $city->field('id,name')->select();
		        foreach($voList as $k=>$v)
		        {
		        	foreach($sList as $key=>$val)
			        {
			        	if($v['store_id']==$val['id'])
			        	{
			        		$voList[$k]['store_name'] = $val['cn_name'];
			        		$voList[$k]['city_id'] = $val['city_id'];
			        	}
			        }
			        foreach($bList as $key=>$val)
			        {
			        	if($v['brand_id']==$val['id'])
			        	{
			        		$voList[$k]['brand_name'] = $val['name'];
			        	}
			        }
			        foreach($cList as $key=>$val)
			        {
			        	if($v['category_id']==$val['id'])
			        	{
			        		$voList[$k]['category_name'] = $val['cn_name'];
			        	}
			        }
			        foreach($cityList as $key=>$val)
			        {
			        	if($voList[$k]['city_id']==$val['id'])
			        	{
			        		$voList[$k]['city_name'] = $val['name'];
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
        $model = M('Commodity');
        if (!empty($model)) {
            $this->my_list($model);
        }
        $this->display();
    }
    
    public function search()
    {
    	$search_name = $_REQUEST['search_name'];
    	$search_store_name = $_REQUEST['search_store_name'];
    	if(!empty($search_name))
    	{
    		if(!empty($search_store_name))
    		{
    			//英文名称匹配
	    		$where['en_name'] = array('like','%'.$search_name.'%','or');
				//中文名称匹配
				$where['cn_name'] = array('like','%'.$search_name.'%','or');
				$where['_logic'] = 'or';
				$map['_complex'] = $where;
    		}else{
    			//英文名称匹配
	    		$map['en_name'] = array('like','%'.$search_name.'%','or');
				//中文名称匹配
				$map['cn_name'] = array('like','%'.$search_name.'%');
    		}
    		$this->assign('search_name', $search_name);
    	}
    	if(!empty($search_store_name))
    	{
    		//英文名称匹配
    		$where1['en_name'] = array('like','%'.$search_store_name.'%','or');
			//中文名称匹配
			$where1['cn_name'] = array('like','%'.$search_store_name.'%','or');
			$where1['_logic'] = 'or';
			$map1['_complex'] = $where1;
			$store = M('Store');
			$storeList = $store->field('id')->where($map1)->select();
			$store_ids = "";
			foreach($storeList as $k=>$v)
			{
				if($store_ids=="")
				{
					$store_ids = $v['id'];
				}else{
					$store_ids = $store_ids.','.$v['id'];
				}
			}
			$map['store_id'] = array('in',$store_ids);
    		$this->assign('search_store_name', $search_store_name);
    	}
    	$c = M('Commodity');
        if (!empty($c)) {
            $this->my_list($c, $map);
        }
        $this->display();
    }
    
    public function add()
    {
    	$brand = M('Brand');
    	$brandList = $brand->select();
    	$this->assign('brandList', $brandList);
    	
    	$category = M('Category');
    	$categoryList = $category->select();
    	$this->assign('categoryList', $categoryList);
    	
    	$city = M('City');
    	$cityList = $city->select();
    	$this->assign('cityList', $cityList);
    	
    	$store = M('Store');
    	$storeList = $store->field('id,en_name,cn_name,city_id')->select();
    	$this->assign('storeList', $storeList);
    	
        $this->display();
    }
    
    function edit() {
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
    	
    	$store = M('Store');
    	$storeList = $store->field('id,en_name,cn_name,city_id')->select();
    	$this->assign('storeList', $storeList);
        $this->display();
    }
    
    function show() {
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
    	
    	$city = M('City');
    	$map2['id'] = array('eq',$vo['city_id']);
    	$cityInfo = $city->where($map2)->find();
    	$this->assign('cityInfo', $cityInfo);
    	
    	$store = M('Store');
    	$map3['id'] = array('eq',$vo['store_id']);
    	$storeInfo = $store->field('id,en_name,cn_name,city_id')->where($map3)->find();
    	$this->assign('storeInfo', $storeInfo);
        $this->display();
    }

    public function insert()
    {
    	$logo = $_FILES['logo'];
    	$cn_name = $_REQUEST['cn_name'];
    	$en_name = $_REQUEST['en_name'];
    	$brand_id = $_REQUEST['brand_id'];
    	$category_id = $_REQUEST['category_id'];
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
	    		$this->assign('jumpUrl', U("CommodityManager/"));
	    		$this->success('添加成功!');
	    	}else{
	    		$this->error('添加失败!');
	    	}
    	}else{
    		$this->error('添加失败，商品信息不完整!');
    	}
    }

    public function update()
    {
    	$id = $_REQUEST['id'];
    	$logo = $_FILES['logo'];
    	$cn_name = $_REQUEST['cn_name'];
    	$en_name = $_REQUEST['en_name'];
    	$brand_id = $_REQUEST['brand_id'];
    	$category_id = $_REQUEST['category_id'];
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
    		&&!empty($price)&&!empty($id)&&!empty($store_id))
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
	    	$data['store_id'] = $store_id;
	    	$data['id'] = $id;
	    	$res = $Commodity->save($data);
	    	if($res)
	    	{
	    		$this->assign('jumpUrl', U("CommodityManager/"));
	    		$this->success('编辑成功!');
	    	}else{
	    		$this->error('编辑失败!');
	    	}
    	}else{
    		$this->error('编辑失败，商品信息不完整!');
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