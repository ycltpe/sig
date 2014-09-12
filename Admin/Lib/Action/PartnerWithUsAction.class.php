<?php

// 设置模块-加盟我们
class PartnerWithUsAction extends CommonAction {

    public function index() {
        $model = M('PartnerWithUs');
        $vo = $model->getById(1);
        $this->assign('vo', $vo);
		$this->display();
    }

    public function edit()
    {
        $model = M('PartnerWithUs');
        $vo = $model->getById(1);
        $this->assign('vo', $vo);
		$this->display();
    }

    // 插入数据1014-03-17 15:31:19
    public function update() {
    	$id = $_REQUEST['id'];			//联系我们ID
    	$company_introduction = $_REQUEST['company_introduction'];//公司简介
    	$email = $_REQUEST['email'];	//邮箱
    	$address = $_REQUEST['address'];//地址
    	$phone = $_REQUEST['phone'];	//电话
		// 创建数据对象
        $PartnerWithUs = M("PartnerWithUs");
		$data['company_introduction'] = $company_introduction;
		$data['email'] = $email;
		$data['address'] = $address;
		$data['phone'] = $phone;
		$map['id'] = array('eq',$id);
		$res = $PartnerWithUs->where($map)->save($data);
		if($res)
		{
			$this->assign('jumpUrl', U("PartnerWithUs/"));
			$this->success('协议修改成功！');
		}else{
			$this->error('协议修改失败！');
		}
    }
}
?>