<?php

// 后台版本更新模块
class AppVersionAction extends CommonAction {

    function _filter(&$map) {
    	
    }
    
    function upload($type)
    {
        import('ORG.Net.UploadFile');
	    $upload = new UploadFile();// 实例化上传类
//	    $upload->maxSize  = 3145728 ;// 设置附件上传大小
	    if($type == 'android')
	    	$upload->allowExts  = array('apk');// 设置附件上传类型
	    elseif($type == 'ios')
	    	$upload->allowExts  = array('ipa');// 设置附件上传类型
		$upload->savePath =  'Uploads/app/';// 设置附件上传目录
	    if(!$upload->upload()) {// 上传错误提示错误信息
	        $this->error($upload->getErrorMsg());
	    }else{// 上传成功
	    	$info = $upload->getUploadFileInfo();  //上传成功，获取上传附件的信息 
	        return $info;
	    }
    }
    
    function saveApp()
    {
    	$app = M("AppVersion");
    	$type = $_REQUEST['type'];
    	$data['name'] = $_REQUEST['name'];
    	$data['type'] = $type;
    	$data['app_id'] = $_REQUEST['app_id'];
    	$data['version_code'] = $_REQUEST['version_code'];
    	$data['version_name'] = $_REQUEST['version_name'];
    	$data['create_msg'] = $_REQUEST['create_msg'];
    	$data['create_time'] = time();
    	$data['status'] = 0;
    	if($type=="1")
    	{
    		$info = $this->upload('android');
    		$data['file_android_url'] = $info[0]['savepath'].$info[0]['savename']; // 保存上传的照片根据需要自行组装
    	}
		else if($type=="2"){
			$info = $this->upload('ios');
			$data['file_ios_url'] = $info[0]['savepath'].$info[0]['savename']; // 保存上传的照片根据需要自行组装
		}
		$re = $app->add($data);
    	if ($re) {
        	$this->assign('jumpUrl', U("AppVersion/"));
            $this->success('数据添加成功！');
        } else {
            $this->error('数据添加失败！');
        }
    }
}
?>