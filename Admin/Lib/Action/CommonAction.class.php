<?php

class CommonAction extends Action {
	
    function _initialize() {
        // 用户权限检查
        if (C('USER_AUTH_ON') && !in_array(MODULE_NAME, explode(',', C('NOT_AUTH_MODULE')))) {
            import('@.ORG.RBAC');
            if (!RBAC::AccessDecision()) {
                //检查认证识别号
                if (!$_SESSION [C('USER_AUTH_KEY')]) {
                    //跳转到认证网关
                    redirect(PHP_FILE . C('USER_AUTH_GATEWAY'));
                }
                // 没有权限 抛出错误
                if (C('RBAC_ERROR_PAGE')) {
                    // 定义权限错误页面
                    redirect(C('RBAC_ERROR_PAGE'));
                } else {
                    if (C('GUEST_AUTH_ON')) {
                        $this->assign('jumpUrl', PHP_FILE . C('USER_AUTH_GATEWAY'));
                    }
                    // 提示错误信息
                    $this->error(L('_VALID_ACCESS_'));
                }
            }
        }
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
            $this->_list($model, $map);
        }
        $this->display();
        return;
    }

    /**
      +----------------------------------------------------------
     * 取得操作成功后要返回的URL地址
     * 默认返回当前模块的默认操作
     * 可以在action控制器中重载
      +----------------------------------------------------------
     * @access public
      +----------------------------------------------------------
     * @return string
      +----------------------------------------------------------
     * @throws ThinkExecption
      +----------------------------------------------------------
     */
    function getReturnUrl() {
        return __URL__ . '?' . C('VAR_MODULE') . '=' . MODULE_NAME . '&' . C('VAR_ACTION') . '=' . C('DEFAULT_ACTION');
    }

    /**
      +----------------------------------------------------------
     * 根据表单生成查询条件
     * 进行列表过滤
      +----------------------------------------------------------
     * @access protected
      +----------------------------------------------------------
     * @param string $name 数据对象名称
      +----------------------------------------------------------
     * @return HashMap
      +----------------------------------------------------------
     * @throws ThinkExecption
      +----------------------------------------------------------
     */
    protected function _search($name = '') {
        //生成查询条件
        if (empty($name)) {
            $name = $this->getActionName();
        }
        $name = $this->getActionName();
        $model = D($name);
        $map = array();
        foreach ($model->getDbFields() as $key => $val) {
            if (isset($_REQUEST [$val]) && $_REQUEST [$val] != '') {
                $map [$val] = $_REQUEST [$val];
            }
        }
        return $map;
    }

    /**
      +----------------------------------------------------------
     * 根据表单生成查询条件
     * 进行列表过滤
      +----------------------------------------------------------
     * @access protected
      +----------------------------------------------------------
     * @param Model $model 数据对象
     * @param HashMap $map 过滤条件
     * @param string $sortBy 排序
     * @param boolean $asc 是否正序
      +----------------------------------------------------------
     * @return void
      +----------------------------------------------------------
     * @throws ThinkExecption
      +----------------------------------------------------------
     */
    protected function _list($model, $map, $sortBy = '', $asc = false, $group = '') {
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
//			if(empty($group))
//			{
//				$voList = $model->where($map)->order("`" . $order . "` " . $sort)->limit($p->firstRow . ',' . $p->listRows)->findAll();
//			}else {
				$voList = $model->where($map)->order(  $order . " " . $sort)->group($group)->limit($p->firstRow . ',' . $p->listRows)->findAll();
//			}
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

    function insert() {
        //B('FilterString');
        $name = $this->getActionName();
        $model = D($name);
        if (false === $model->create()) {
            $this->error($model->getError());
        }
        $model->create_time = time();
        //保存当前数据对象
        $list = $model->add();
        if ($list !== false) { //保存成功
            $this->assign('jumpUrl', Cookie::get('_currentUrl_'));
            $this->success('新增成功!');
        } else {
            //失败提示
            $this->error('新增失败!');
        }
    }

    public function add() {
        $this->display();
    }

    function read() {
        $this->edit();
    }

    function edit() {
        $name = $this->getActionName();
        $model = M($name);
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        $this->display();
    }

    function update() {
        //B('FilterString');
        $name = $this->getActionName();
        $model = D($name);
        if (false === $model->create()) {
            $this->error($model->getError());
        }
        // 更新数据
        $list = $model->save();
        if (false !== $list) {
            //成功提示
            $this->assign('jumpUrl', Cookie::get('_currentUrl_'));
            $this->success('编辑成功!');
        } else {
            //错误提示
            $this->error('编辑失败!');
        }
    }

    /**
      +----------------------------------------------------------
     * 默认删除操作
      +----------------------------------------------------------
     * @access public
      +----------------------------------------------------------
     * @return string
      +----------------------------------------------------------
     * @throws ThinkExecn
      +----------------------------------------------------------
     */
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
                    $this->success('删除成功！');
                } else {
                    $this->error('删除失败！');
                }
            } else {
                $this->error('非法操作');
            }
        }
    }

    public function foreverdelete() {
        //删除指定记录
        $name = $this->getActionName();
        dump($name);
        $model = D($name);
        if (!empty($model)) {
            $pk = $model->getPk();
            $id = $_REQUEST [$pk];
            if (isset($id)) {
                $condition = array($pk => array('in', explode(',', $id)));
                if (false !== $model->where($condition)->delete()) {
                    //echo $model->getlastsql();
                    $this->success('删除成功！');
                } else {
                    $this->error('删除失败！');
                }
            } else {
                $this->error('非法操作');
            }
        }
        $this->forward();
    }

    public function clear() {
        //删除指定记录
        $name = $this->getActionName();
        $model = D($name);
        if (!empty($model)) {
            if (false !== $model->where('status=1')->delete()) {
                $this->assign("jumpUrl", $this->getReturnUrl());
                $this->success(L('_DELETE_SUCCESS_'));
            } else {
                $this->error(L('_DELETE_FAIL_'));
            }
        }
        $this->forward();
    }

    /**
      +----------------------------------------------------------
     * 默认禁用操作
     *
      +----------------------------------------------------------
     * @access public
      +----------------------------------------------------------
     * @return string
      +----------------------------------------------------------
     * @throws FcsException
      +----------------------------------------------------------
     */
    public function forbid() {
        $name = $this->getActionName();
        $model = D($name);
        $pk = $model->getPk();
        $id = $_REQUEST [$pk];
        $condition = array($pk => array('in', $id));
        $list = $model->forbid($condition);
        if ($list !== false) {
            $this->assign("jumpUrl", $this->getReturnUrl());
            $this->success('状态禁用成功');
        } else {
            $this->error('状态禁用失败！');
        }
    }

    public function checkPass() {
        $name = $this->getActionName();
        $model = D($name);
        $pk = $model->getPk();
        $id = $_GET [$pk];
        $condition = array($pk => array('in', $id));
        if (false !== $model->checkPass($condition)) {
            $this->assign("jumpUrl", $this->getReturnUrl());
            $this->success('状态批准成功！');
        } else {
            $this->error('状态批准失败！');
        }
    }

    public function recycle() {
        $name = $this->getActionName();
        $model = D($name);
        $pk = $model->getPk();
        $id = $_GET [$pk];
        $condition = array($pk => array('in', $id));
        if (false !== $model->recycle($condition)) {
            $this->assign("jumpUrl", $this->getReturnUrl());
            $this->success('状态还原成功！');
        } else {
            $this->error('状态还原失败！');
        }
    }

    public function recycleBin() {
        $map = $this->_search();
        $map ['status'] = - 1;
        $name = $this->getActionName();
        $model = D($name);
        if (!empty($model)) {
            $this->_list($model, $map);
        }
        $this->display();
    }

    /**
      +----------------------------------------------------------
     * 默认恢复操作
     *
      +----------------------------------------------------------
     * @access public
      +----------------------------------------------------------
     * @return string
      +----------------------------------------------------------
     * @throws FcsException
      +----------------------------------------------------------
     */
    function resume() {
        //恢复指定记录
        $name = $this->getActionName();
        $model = D($name);
        $pk = $model->getPk();
        $id = $_GET [$pk];
        $condition = array($pk => array('in', $id));
        if (false !== $model->resume($condition)) {
            $this->assign("jumpUrl", $this->getReturnUrl());
            $this->success('状态恢复成功！');
        } else {
            $this->error('状态恢复失败！');
        }
    }

    function saveSort() {
        $seqNoList = $_POST ['seqNoList'];
        if (!empty($seqNoList)) {
            //更新数据对象
            $name = $this->getActionName();
            $model = D($name);
            $col = explode(',', $seqNoList);
            //启动事务
            $model->startTrans();
            foreach ($col as $val) {
                $val = explode(':', $val);
                $model->id = $val [0];
                $model->sort = $val [1];
                $result = $model->save();
                if (!$result) {
                    break;
                }
            }
            //提交事务
            $model->commit();
            if ($result !== false) {
                //采用普通方式跳转刷新页面
                $this->success('更新成功');
            } else {
                $this->error($model->getError());
            }
        }
    }
    
    /* 
	 * 功能：循环检测并创建文件夹 
	 * 参数：$path 文件夹路径 
	 * 返回： 
	 */ 
	function createDir($path){
		if (!file_exists($path)){ 
			$this->createDir(dirname($path)); 
			mkdir($path, 0777); 
		}
	}
    
    function upload_pic($file,$type, $path,$thumb = false, $water = false, $thumbPrefix = 's_', $thumbMaxWidth = '125', $thumbMaxHeight = '125') {
		import("ORG.Net.UploadFile");
		$upload = new UploadFile();
		if(!empty($file['name'])) {
	        //设置上传文件大小
	        $upload->maxSize = 5*1024*1024;
	        //设置上传文件类型
			$upload->allowExts = explode(',', $type);
			$save_dir = $path.date ( 'Y' ).'/'.date ( 'Ymd' );
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
	        //设置上传文件规则
	        $upload->saveRule = uniqid;      
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
        //返回数据对象
        return $uploadInfo;
    }
    
    /**
	 * @param $user_id 用户标识
	 * @param $pType   推送类型：
	 * 	推送消息到某个user，设置push_type = 1; 
	 *  推送消息到一个tag中的全部user，设置push_type = 2;
	 *  推送消息到该app中的全部user，设置push_type = 3;
	 * @param $message   指定消息内容
	 * @param $device_type 设备类型:Android:3;Ios:4
	 */
	function push_message_store($user_id,$pType,$message,$device_type,$msg_key)
	{
//		header("Content-Type:text/html; charset=utf-8");
		$log= new Log();
		import('@.ORG.Channel');
	    global $api_key;
		global $secret_key;
		$api_key = "k65SlNTqq0p2tlZtthtUyz5S";
		$secret_key = "Eq2gb7RH0W7gQIMhQVRgCNR3FAUaERkf";
	    $channel = new Channel ( $api_key, $secret_key ) ;
		$push_type = $pType;
		$optional[Channel::USER_ID] = $user_id; //如果推送单播消息，需要指定user
		//optional[Channel::TAG_NAME] = "xxxx";  //如果推送tag消息，需要指定tag_name
		//指定发到哪种设备
		$optional[Channel::DEVICE_TYPE] = $device_type;
		//指定消息类型为通知
		if($device_type==3)  //android发送消息
		{
			$optional[Channel::MESSAGE_TYPE] = 0;  //0：消息；
			$log->write( '向 android 发送消息' );
		}else if($device_type==4) //iphone发送通知
		{
			//如果ios应用当前部署状态为开发状态，指定DEPLOY_STATUS为1，默认是生产状态，值为2.
			//旧版本曾采用不同的域名区分部署状态，仍然支持。
			$optional[Channel::DEPLOY_STATUS] = 1;
			$optional[Channel::MESSAGE_TYPE] = 1;  //1：通知；
			$log->write( '向 ios 发送通知' );
		}
		//通知类型的内容必须按指定内容发送，示例如下：
		$message_key = $msg_key;
	    $ret = $channel->pushMessage ( $push_type, $message, $message_key, $optional ) ;
	    if ( false === $ret )
	    {
	        $log->write( 'WRONG, ' . __FUNCTION__ . ' ERROR!!!!<br/>' );
	        $log->write ( 'ERROR NUMBER: ' . $channel->errno ( ) . '<br/>' );
//	        $log->write ( 'ERROR MESSAGE: ' . $channel->errmsg ( ) . '<br/>' );
//	        $log->write ( 'REQUEST ID: ' . $channel->getRequestId ( ) . '<br/>' );
	        return false;
	    }
	    else
	    {
	        $log->write ( 'SUCC, ' . __FUNCTION__ . ' OK!!!!!'. '<br/>' );
//	        $log->write ( 'result: ' . print_r ( $ret, true ) . '<br/>' );
	        return true;
	    }
	}
	
	/**
	 * @param $user_id 用户标识
	 * @param $pType   推送类型：
	 * 	推送消息到某个user，设置push_type = 1; 
	 *  推送消息到一个tag中的全部user，设置push_type = 2;
	 *  推送消息到该app中的全部user，设置push_type = 3;
	 * @param $message   指定消息内容
	 * @param $device_type 设备类型:Android:3;Ios:4
	 */
	function push_message_customer($user_id,$pType,$message,$device_type,$msg_key)
	{
//		header("Content-Type:text/html; charset=utf-8");
		$log= new Log();
		import('@.ORG.Channel');
	    global $api_key;
		global $secret_key;
		$api_key = "V7yX7yY8tbvcsBchBSyTDc8n";
		$secret_key = "IbsBMY4ebgPlyayj3o2m4ZhKxqu18fb8";
	    $channel = new Channel ( $api_key, $secret_key ) ;
		$push_type = $pType;
		$optional[Channel::USER_ID] = $user_id; //如果推送单播消息，需要指定user
		//optional[Channel::TAG_NAME] = "xxxx";  //如果推送tag消息，需要指定tag_name
		//指定发到哪种设备
		$optional[Channel::DEVICE_TYPE] = $device_type;
		//指定消息类型为通知
		if($device_type==3)  //android发送消息
		{
			$optional[Channel::MESSAGE_TYPE] = 0;  //0：消息；
			$log->write( '向 android 发送消息' );
		}else if($device_type==4) //iphone发送通知
		{
			//如果ios应用当前部署状态为开发状态，指定DEPLOY_STATUS为1，默认是生产状态，值为2.
			//旧版本曾采用不同的域名区分部署状态，仍然支持。
			$optional[Channel::DEPLOY_STATUS] = 1;
			$optional[Channel::MESSAGE_TYPE] = 1;  //1：通知；
			$log->write( '向 ios 发送通知' );
		}
		//通知类型的内容必须按指定内容发送，示例如下：
		$message_key = $msg_key;
	    $ret = $channel->pushMessage ( $push_type, $message, $message_key, $optional ) ;
	    if ( false === $ret )
	    {
	        $log->write( 'WRONG, ' . __FUNCTION__ . ' ERROR!!!!<br/>' );
	        $log->write ( 'ERROR NUMBER: ' . $channel->errno ( ) . '<br/>' );
//	        $log->write ( 'ERROR MESSAGE: ' . $channel->errmsg ( ) . '<br/>' );
//	        $log->write ( 'REQUEST ID: ' . $channel->getRequestId ( ) . '<br/>' );
	        return false;
	    }
	    else
	    {
	        $log->write ( 'SUCC, ' . __FUNCTION__ . ' OK!!!!!'. '<br/>' );
//	        $log->write ( 'result: ' . print_r ( $ret, true ) . '<br/>' );
	        return true;
	    }
	}
	
	function guid(){
	    if (function_exists('com_create_guid')){
	        return com_create_guid();
	    }else{
	        mt_srand((double)microtime()*10000);//optional for php 4.2.0 and up.
	        $charid = strtoupper(md5(uniqid(rand(), true)));
	        $hyphen = chr(45);// "-"
	        $uuid = chr(123)// "{"
	                .substr($charid, 0, 8).$hyphen
	                .substr($charid, 8, 4).$hyphen
	                .substr($charid,12, 4).$hyphen
	                .substr($charid,16, 4).$hyphen
	                .substr($charid,20,12)
	                .chr(125);// "}"
	        return $uuid;
	    }
	}
	
	public function push($user_id,$dType,$title,$description,$type=0,$userType)
    {
    	header("Content-Type:text/html; charset=utf-8");
    	//向Message表中添加消息数据
//    	$user_id = '659351943096636964';
    	$pType = 1;
		$message = '{
			"title": "'.$title.'",
			"type": "'.$type.'",
			"description": "'.$description.'"
 		}';
    	if($dType==1)
    	{
    		$device_type = 3;
    	}else if($dType==2){
    		$device_type = 4;
    	}
 		$text = "nhk".time().$this->guid();
    	$msg_key = md5($text);   //$message_key保证消息不重复
 		/**
 		 * 子类调用父类推送方法
 		 */
 		$log = new Log();
 		$log->write("推送内容：".$description);
    	if(!empty($userType)&&$userType=='customer')
 		{
 			$res = $this->push_message_customer($user_id,$pType,$message,$device_type,$msg_key);
 		}else{
 			$res = $this->push_message_store($user_id,$pType,$message,$device_type,$msg_key);
 		}
    	return $res;
    }
    
    /**
      * 导出数据为excel表格
      * @param $data    一个二维数组,结构如同从数据库查出来的数组
      * @param $title   excel的第一行标题,一个数组,如果为空则没有标题
      * @param $filename 下载的文件名
      * @examlpe 
      * $stu = M ('User');
      * $arr = $stu -> select();
      * exportexcel($arr,array('id','账户','密码','昵称'),'文件名!');
	  */
	function exportexcel($data=array(),$title=array(),$filename='report'){
	    header("Content-type:application/octet-stream");
	    header("Accept-Ranges:bytes");
	    header("Content-type:application/vnd.ms-excel");  
	    header("Content-Disposition:attachment;filename=".$filename.".xls");
	    header("Pragma: no-cache");
	    header("Expires: 0");
	    //导出xls 开始
	    if (!empty($title)){
	        foreach ($title as $k => $v) {
	            $title[$k]=iconv("UTF-8", "GB2312",$v);
	        }
	        $title= implode("\t", $title);
	        echo "$title\n";
	    }
	    if (!empty($data)){
	        foreach($data as $key=>$val){
	            foreach ($val as $ck => $cv) {
	                $data[$key][$ck]=iconv("UTF-8", "GB2312", $cv);
	            }
	            $data[$key]=implode("\t", $data[$key]);
	            
	        }
	        echo implode("\n",$data);
	    }
	}
	
	/**
	 * 以下为自己增加
	 */
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
      
      /**
	   * 创建文件夹
	   * @param String $dirName 文件夹路径名
	   */
	  public function create_dir($dirName, $recursive = 1,$mode=0777) {
			! is_dir ( $dirName ) && mkdir ( $dirName,$mode,$recursive );
	  }
	  
	  /**
	   * 二进制流转图片
	   * @param string $file_data 二进制流字符串
	   * @param string $type 文件后缀名（.jpg）
	   */
//	  function stream2Image($file_data,$type=".jpg")
//	  {
//		$save_name=$this->funname().$type;
//		$save_dir = "Uploads/photo/".date ( 'Y/Ymd' );
//		//创建文件夹
//		@$this->create_dir ( $save_dir );
//		$save_path=$save_dir."/".$save_name;
//		$base64 = base64_decode($file_data);
//		file_put_contents($save_path,$base64);
//		
//		return $save_path;
//	  }
	  function stream2Image($file_data,$type=".png")
	  {
		$save_name=$this->funname().$type;
		$save_dir = "Uploads/photo/".date ( 'Y/Ymd' );
		//创建文件夹
		@$this->create_dir ( $save_dir );
		$save_path=$save_dir."/".$save_name;
		$file_data = str_replace(' ','+',$file_data);
		$base64 = base64_decode($file_data);
//		$data = base64_decode($data);
		$im = imagecreatefromstring($base64);
		if ($im !== false) {
			$log = new Log();
			header('Content-Type: image/png');
		    imagepng($im,$save_path);
		    $log->write("路径：".$save_path);
		}
		else {
		    $s= "An error occurred";
		    $log = new Log();
		    $log->write("上传图片有问题------->".$s);
		}
//		file_put_contents($save_path,$im);
		return $save_path;
	  }

}

?>