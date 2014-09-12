<?php
class IndexAction extends CommonAction {
	
	protected function checkUser() {
        if (!isset($_SESSION[C('USER_AUTH_KEY')])) {
			  redirect('index.php/Public/login', 0, '页面跳转中...');
        }
    }
	
	// 框架首页
	public function index() {
		$this->checkUser();
        $model = M("Group");
        $list = $model->where('status=0')->order('sort asc')->select();
        $this->assign('nodeGroupList', $list);
		C( 'SHOW_RUN_TIME', false ); // 运行时间显示
		C( 'SHOW_PAGE_TRACE', false );
		$this->display();
	}
	
	public  function groupPosition(){
		$group = M('Group');
		$groupList = $group->where('status=0')->select();
		$node = M('Node');
		foreach ( $groupList as $k=>$v) {
			if($v["id"]==$_GET["menuid"] ){
				$map['group_id'] = array('eq',$v['id']);
				$map['status'] = array('eq',0);
				$nodeInfo = $node->where($map)->order('sort')->find();
				if(!empty($nodeInfo))
				{
					$html = $v['title']." > ".$nodeInfo['title'];
				}else{
					$html = $v['title'];
				}
			}
		}
		echo $html;
     }
     
     public  function nodePosition(){
	   	$node_id = $_GET["menuid"];
		$node = M('node');
		$map['id'] = array('eq',$node_id);
		$map['status'] = array('eq',0);
		$nodeInfo = $node->where($map)->find();
        $group = M('Group');
		if(!empty($nodeInfo)){
			$groupMap['id'] = array('eq',$nodeInfo['group_id']);
			$groupMap['status'] = array('eq',0);
			$groupInfo = $group->where($groupMap)->find();
			if(!empty($groupInfo))
			{
				$html=$groupInfo['title']." > ".$nodeInfo['title'];
			}else{
				$html=$nodeInfo['title'];
			}
		}else{
			$html = '设置';
		}
		echo $html;
     }
}
?>