<?php

// 设置模块-商家注册条款
class ClauseByBusinessesAction extends CommonAction {

    public function index() {
        $model = M('Clause');
        $vo = $model->getById(2);
        $this->assign('vo', $vo);
		$this->display();
    }
    
    public function edit()
    {
        $model = M('Clause');
        $vo = $model->getById(2);
        $this->assign('vo', $vo);
		$this->display();
    }
    
    // 插入数据2014-03-17 15:31:19
    public function update() {
    	$content = $_REQUEST['content'];							//协议内容
		// 创建数据对象
        $clause = M("Clause");
		$data['content'] = $content;
		$data['create_time'] = time();
		$map['id'] = array('eq',2);
		$res = $clause->where($map)->save($data);
		if($res)
		{
			$this->assign('jumpUrl', U("ClauseByBusinesses/"));
			$this->success('协议修改成功！');
		}else{
			$this->error('协议修改失败！');
		}
    }
}
?>