<?php

// 全局返利设置
class GlobalRebateSettingsAction extends CommonAction {
	
	public function index() {
        $model = M('GlobalRebateSettings');
        $id = 1;
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        $store = M('Store');
        $commodity = M('commodity');
        $storeList = $store->field('id,en_name,cn_name')->select();
        $commodityList = $commodity->field('id,store_id,en_name,cn_name')->select();
        $this->assign('storeList', $storeList);
        $this->assign('commodityList', $commodityList);
        $this->display();
    }
    
    public function setting()
    {
    	$store_id = $_REQUEST['store_id'];
    	$commodity_id = $_REQUEST['commodity_id'];
    	$type = $_REQUEST['type'];
    	$rebate_num = $_REQUEST['rebate_num'];
    	if(!empty($type)&&!empty($rebate_num))
    	{
    		$commodity = M('Commodity');
    		if($store_id==0)
    		{
    			//全部商品加减返利比例
    			if($type==1)	//增加
    			{
    				$commodity->setInc('rebates', $rebate_num);
					$commodity->setInc('user_rebates', $rebate_num);
					$commodity->setInc('vip_rebates', $rebate_num);
    			}else{			//减少
	    			$map['vip_rebates'] = array('GT',$rebate_num);
		    		$map['rebates'] = array('GT',$rebate_num);
		    		$map['user_rebates'] = array('GT',$rebate_num);
    				$commodity->setDec('rebates',$map, $rebate_num);
					$commodity->setDec('user_rebates',$map, $rebate_num);
					$commodity->setDec('vip_rebates',$map, $rebate_num);
					$map1['vip_rebates'] = array('ELT',$rebate_num);
		    		$map1['rebates'] = array('ELT',$rebate_num);
		    		$map1['user_rebates'] = array('ELT',$rebate_num);
		    		//将小于等于要减少的返利比例直接设置为0
		    		$data['rebates'] = 0;
		    		$data['user_rebates'] = 0;
		    		$data['vip_rebates'] = 0;
		    		$commodity->where($map1)->save($data);
    			}
    		}else{
    			$map['store_id'] = array('eq',$store_id);
    			//指定商店商品加减返利比例
    			if($commodity_id==0)
    			{
    				if($type==1)	//增加
	    			{
	    				$commodity->setInc('rebates',$map, $rebate_num);
						$commodity->setInc('user_rebates',$map, $rebate_num);
						$commodity->setInc('vip_rebates',$map, $rebate_num);
	    			}else{			//减少
	    				$map['vip_rebates'] = array('GT',$rebate_num);
			    		$map['rebates'] = array('GT',$rebate_num);
			    		$map['user_rebates'] = array('GT',$rebate_num);
	    				$commodity->setDec('rebates', $rebate_num);
						$commodity->setDec('user_rebates',$map, $rebate_num);
						$commodity->setDec('vip_rebates',$map, $rebate_num);
						$map1['store_id'] = array('eq',$store_id);
						$map1['vip_rebates'] = array('ELT',$rebate_num);
			    		$map1['rebates'] = array('ELT',$rebate_num);
			    		$map1['user_rebates'] = array('ELT',$rebate_num);
			    		//将小于等于要减少的返利比例直接设置为0
			    		$data['rebates'] = 0;
			    		$data['user_rebates'] = 0;
			    		$data['vip_rebates'] = 0;
			    		$commodity->where($map1)->save($data);
	    			}
    			}else{
    				$map['id'] = array('eq',$commodity_id);
    				if($type==1)	//增加
	    			{
	    				$commodity->setInc('rebates',$map, $rebate_num);
						$commodity->setInc('user_rebates',$map, $rebate_num);
						$commodity->setInc('vip_rebates',$map, $rebate_num);
	    			}else{			//减少
	    				$map['vip_rebates'] = array('GT',$rebate_num);
			    		$map['rebates'] = array('GT',$rebate_num);
			    		$map['user_rebates'] = array('GT',$rebate_num);
	    				$commodity->setDec('rebates',$map, $rebate_num);
						$commodity->setDec('user_rebates',$map, $rebate_num);
						$commodity->setDec('vip_rebates',$map, $rebate_num);
						$map1['id'] = array('eq',$commodity_id);
						$map1['vip_rebates'] = array('ELT',$rebate_num);
			    		$map1['rebates'] = array('ELT',$rebate_num);
			    		$map1['user_rebates'] = array('ELT',$rebate_num);
			    		//将小于等于要减少的返利比例直接设置为0
			    		$data['rebates'] = 0;
			    		$data['user_rebates'] = 0;
			    		$data['vip_rebates'] = 0;
			    		$commodity->where($map1)->save($data);
	    			}
    			}
    		}
    		$this->assign('jumpUrl', U("GlobalRebateSettings/"));
	        $this->success('设置成功!');
    	}else{
    		//错误提示
	       	$this->error('表单信息不完整!');
    	}
    }
    
    public function update() {
    	$id = $_REQUEST['id'];
    	$money = $_REQUEST['money'];
    	$type = $_REQUEST['type'];
    	if(!empty($id))
    	{
    		if(!empty($money))
    		{
    			$data['money'] = $money;
    		}
    		if(!empty($type))
    		{
    			$data['type'] = $type;
    		}
    		$data['id'] = $id;
    		$model = M('GlobalRebateSettings');
	        // 更新数据
	        $list = $model->save($data);
	        if (false !== $list) {
	            $this->assign('jumpUrl', U("GlobalRebateSettings/"));
	            $this->success('编辑成功!');
	        } else {
	            //错误提示
	            $this->error('编辑失败!');
	        }
    	}else{
    		//错误提示
	       	$this->error('表单信息不完整!');
    	}
    }
    
    
}
?>