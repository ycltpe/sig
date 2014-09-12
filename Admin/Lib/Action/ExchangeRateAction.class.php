<?php

// 汇率更新设置
class ExchangeRateAction extends CommonAction {
	
	public function index() {
		//获取网络汇率
		$model = M('ExchangeRate');
        $vo = $model->order('id desc')->limit('0,1')->find();
        $this->assign('vo', $vo);
        //获取呈现汇率
        $model = M('ExchangeRateShow');
        $id = 1;
        $voShow = $model->getById($id);
        if(isset($voShow))
        {
        	$this->assign('voShow', $voShow);
        }else{
	        $this->assign('voShow', $vo);
        }
        $this->display();
    }
    
    public function setting() {
    	$id = $_REQUEST['id'];
    	$rate = $_REQUEST['rate'];
    	$model = M('ExchangeRateShow');
    	if(!empty($id))
    	{
    		if(!empty($rate))
    		{
    			$data['rate'] = $rate;
    		}
    		$data['id'] = $id;
	        // 更新数据
	        $list = $model->save($data);
	        if (false !== $list) {
	            $this->assign('jumpUrl', U("ExchangeRate/"));
	            $this->success('编辑成功!');
	        } else {
	            //错误提示
	            $this->error('编辑失败!');
	        }
    	}else{
    		//错误提示
	       	$model->from = '英镑';
	       	$model->to = '人民币';
	       	$model->rate = $rate;
	       	$model->create_time = time();
	       	$re = $model->add();
	       	if ($re) {
	            $this->assign('jumpUrl', U("ExchangeRate/"));
	            $this->success('编辑成功!');
	        } else {
	            //错误提示
	            $this->error('编辑失败!');
	        }
    	}
    }
}
?>