<?php

// 用户模块
class UserAction extends CommonAction {

    function _filter(&$map) {
    	/**
    	 * 用户列表显示权限
    	 * system:显示全部
    	 * admin:不显示system帐号
    	 */
    	$authId = $_SESSION[C('USER_AUTH_KEY')];
    	if(!empty($authId))
    	{
    		if($authId['part_id']<>1)  //admin角色的ID
	    	{
	    		$map['part_id']  = array('not in',array(1,2));
	    	}else  //system角色的ID
	    	{
	    		$map['part_id']  = array('not in',array(1));
	    	}
    	}
//    	$map['status']  = array('neq',-1);
//        $map['ub_id'] = array('egt', 2);
//        $map['ub_account'] = array('like', "%" . $_POST['account'] . "%");
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
            $this->_list($model, $map,'is_recommend');
        }
        $this->display();
        return;
    }
    
    protected function my_list($model, $map, $search_content, $sortBy = '', $asc = false, $group = '') {
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
				$voList = $model->where($map)->order("`" . $order . "` " . $sort)->group($group)->limit($p->firstRow . ',' . $p->listRows)->findAll();
//			}
            //分页跳转的时候保证查询条件
            foreach ($map as $key => $val) {
                if (!is_array($val)) {
                    $p->parameter .= "$key=" . urlencode($val) . "&";
                }
            }
            if(trim($search_content)!="")
            {
            	$p->parameter .= "search_content=" .$search_content. "&";
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
        Cookie::set('_currentUrl_', __SELF__);
        return;
    }
    
    public function search()
    {
    	$search_content = $_REQUEST['search_content'];
    	$authId = $_SESSION['part_id'];
    	if(!empty($authId))
    	{
    		if($authId<>1)  //admin角色的ID
	    	{
	    		$map['part_id']  = array('not in',array(1,2));
	    	}else  //system角色的ID
	    	{
	    		$map['part_id']  = array('not in',array(1));
	    	}
    	}
    	$map['status']  = array('neq',-1);
    	$u = M('User');
    	if(!empty($search_content)){
			//用户邮箱
			$where['email'] = array("like","%".$search_content."%",'or');
			//用户姓名
			$where['nick_name'] = array("like","%".$search_content."%",'or');
			$where['_logic'] = 'or';
			$map['_complex'] = $where;
    	}
    	$this->assign('searchContent', $search_content);
        if (!empty($u)) {
            $this->my_list($u, $map, $search_content,'is_recommend');
        }
        
        $this->display();
    }
    
    public function add()
    {
        $this->display();
    }
    
    function edit() {
        $name = $this->getActionName();
        $model = M($name);
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        $this->display();
    }

    // 检查帐号
    public function checkAccount() {
        if (!preg_match('/^[a-z]\w{4,}$/i', $_POST['account'])) {
            $this->error('用户名必须是字母，且5位以上！');
        }
        $User = M("User");
        // 检测用户名是否冲突
        $name = $_REQUEST['account'];
        $result = $User->getByAccount($name);
        if ($result) {
            $this->error('该用户名已经存在！');
        } else {
            $this->success('该用户名可以使用！');
        }
    }

    // 插入数据
    public function insert() {
        // 创建数据对象
        $User = D("User");
        if (!$User->create()) {
            $this->error($User->getError());
        } else {
        	$User->part_id = $_REQUEST['part_id'];
        	$User->photo = 'Uploads/photo/default.jpg';
            // 写入帐号数据
            if ($result = $User->add()) {
                $this->assign('jumpUrl', U("User/"));
                $this->success('用户添加成功！');
            } else {
                $this->error('用户添加失败！');
            }
        }
    }

    protected function addRole($userId) {
        //新增用户自动加入相应权限组
        $RoleUser = M("RoleUser");
        $RoleUser->user_id = $userId;
        // 默认加入网站编辑组
        $RoleUser->role_id = 3;
        $RoleUser->add();
    }

    //重置密码
    public function resetPwd() {
        $id = $_POST['id'];
        $password = $_POST['password'];
        if ('' == trim($password)) {
            $this->error('密码不能为空！');
        }
        $User = M('User');
        $User->password = md5($password);
        $User->id = $id;
        $result = $User->save();
        if (false !== $result) {
            $this->success("密码修改为$password");
        } else {
            $this->error('重置密码失败！');
        }
    }

    public function update() {
    	$company_id = $_REQUEST['company_id'];
        $model = D('User');
        if (false === $model->create()) {
            $this->error($model->getError());
        }
        // 获取数据
        $strarr = $_POST;
        // 更新数据       
        $list = $model->save($strarr);
        if (false !== $list) {
            //成功提示
            $uc = M('UserCompany');
			$ucWhere['user_id'] = $model->id;
			$data['company_id'] = $company_id;
	        $re = $uc->where($ucWhere)->save($data);
	        if(!$re)
	        {
	        	$uc = M('UserCompany');
	        	$uc->user_id = $model->id;
				$uc->company_id = $company_id;
				$uc->create_time = time();
		        $uc->add();
	        }
            $this->assign('jumpUrl', U("User/"));
            $this->success('编辑成功!');
        } else {
            //错误提示
            $this->error('编辑失败!');
        }
    }

    public function updatepwd() {
        $id = $_POST['id'];
        if ($_POST['password'] == '') {
            $this->error('密码不能为空!');
        } else {
            $pwd = md5(trim($_POST['password']));
            $sql = "update " . C('DB_PREFIX') . "user set password='{$pwd}' where id={$id}";        
            $exe = M()->execute($sql);
//            $this->assign('jumpUrl', U("User/"));
            $this->success('密码修改成功!');
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