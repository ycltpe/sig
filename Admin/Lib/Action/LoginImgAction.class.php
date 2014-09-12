<?php

// 登录图片模块
class LoginImgAction extends CommonAction {

    function _filter(&$map) {
		
    }
    
    /**
	 * 创建文件夹
	 * @param String $dirName 文件夹路径名
	 */
	 public function create_dir($dirName, $recursive = 1,$mode=0777) {
		! is_dir ( $dirName ) && mkdir ( $dirName,$mode,$recursive );
	 }
	  
	 public function funname()
     {
	   	import('@.ORG.String');
		/**
		 * 生成随机名称
		 */
		$str = new String();
		$name = $str->uuid();
		$name = str_replace("}","",$name);
		$name = str_replace("{","",$name);
		return $name;
     }
     
     public function index() {
        //列表过滤器，生成查询Map对象
        $map = $this->_search();
        if (method_exists($this, '_filter')) {
            $this->_filter($map);
        }
        $name = $this->getActionName();
        $model = D($name);
        if (!empty($model)) {
            $this->_list($model, $map,'id',true);
        }
        $this->display();
        return;
    }
      
    // 文件上传
    function upload_pic($file,$type, $thumb = true, $water = false, $thumbPrefix = 'm_,s_', $thumbMaxWidth = '757,77', $thumbMaxHeight = '426,58') {
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
				$save_dir = "Uploads/pic/loginImg/".date ( 'Y' ).'/'.date ( 'Ymd' );
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
		        $upload->thumbPrefix = $thumbPrefix;  //生产2张缩略图
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
    	$log = new Log();
    	$img_name = $_REQUEST['img_name'];
    	$img_url = $_FILES['img_url'];
		$save_type = 'jpg,png,jpeg,BMP,bmp';
		// 创建数据对象
        $loginImg = M("LoginImg");

        if (!$loginImg->create()) {
            $this->error($loginImg->getError());
        } else {
			$picInfo = $this->upload_pic($img_url,$save_type);
        	$loginImg->img_name = $img_name;
	        $loginImg->img_url = $picInfo[0]['savepath'].$picInfo[0]['savename'];
	        $loginImg->m_img_url = $picInfo[0]['savepath'].'m_'.$picInfo[0]['savename'];
	        $loginImg->s_img_url = $picInfo[0]['savepath'].'s_'.$picInfo[0]['savename'];
			$loginImg->img_create_time = time();
            // 写入帐号数据
            if ($result = $loginImg->add()) {
                $this->assign('jumpUrl', U("LoginImg/"));
                $this->success('引导界面添加成功！');
            } else {
                $this->error('引导界面添加失败！');
            }
        }
    }

    public function delete() {
        //删除指定记录
        $name = $this->getActionName();
        $model = M($name);
        if (!empty($model)) {
            $pk = $model->getPk();
            $id = $_REQUEST [$pk];
            if (isset($id)) {
                $condition = array($pk => array('in', explode(',', $id)));
                $list = $model->where($condition)->delete();
                if ($list !== false) {
                	$msg = M('Message');   //删除消息
                	$cond['other_id'] = array('in', explode(',', $id));
                	$cond['type'] = array('eq', 1);
                	$msg_list = $msg->where($cond)->delete();
                    $this->success('删除成功！');
                } else {
                    $this->error('删除失败！');
                }
            } else {
                $this->error('非法操作');
            }
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