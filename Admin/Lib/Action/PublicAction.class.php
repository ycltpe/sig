<?php

// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2009 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

class PublicAction extends CommonAction {



    // 检查用户是否登录

    protected function checkUser() {
        if (!isset($_SESSION[C('USER_AUTH_KEY')])) {
            $this->assign('jumpUrl', __APP__.'/Public/login');
            $this->error('没有登录');
        }
    }

    // 顶部页面
    /*public function top() {
        C('SHOW_RUN_TIME', false);   // 运行时间显示
        C('SHOW_PAGE_TRACE', false);
        $model = M("Group");
        $list = $model->where('status=0')->getField('id,title');
        $this->assign('nodeGroupList', $list);
        $this->display();
    }*/

    // 尾部页面
    public function footer() {
        C('SHOW_RUN_TIME', false);   // 运行时间显示
        C('SHOW_PAGE_TRACE', false);
        $this->display();
    }

    // 菜单页面
    public function menu() {
    	$map['status']=0;
		if($_GET['menuid']==''||$_GET['menuid']=='3')
		{
			$map['group_id']=3;
		}else{
			$map['group_id']=$_GET['menuid'];
		}
        $tagname=M("Node")->where($map)->order('sort')->select();
        $this->assign('tagname', $tagname);
        $this->display();
    }

    // 用户登录页面
    public function login() {
        if (!isset($_SESSION[C('USER_AUTH_KEY')])) {
            $this->display();
        } else {
            $this->redirect('Index/index');
        }
    }

    public function index() {
        //如果通过认证跳转到首页
        redirect(__APP__);
    }

    // 用户登出
    public function logout() {
        if (isset($_SESSION[C('USER_AUTH_KEY')])) {
            unset($_SESSION[C('USER_AUTH_KEY')]);
            unset($_SESSION);
            session_destroy();
             $this->assign('jumpUrl', __APP__.'/Public/login');
            $this->success('登出成功！');
        } else {
            $this->error('已经登出！');
        }
    }

   // 登录检测
    public function checkLogin() {
      	$reg = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
         if (empty($_POST['username'])) {
            $this->error('用户名必须！');
        }elseif (!ereg($reg,$_POST['username'])){
			$this->error('用户名格式不正确！');
		}else if (empty($_POST['password'])) {
            $this->error('密码必须！');
        }
//        else if (empty($_REQUEST['verify'])) {
//            $this->error('验证码必须！');
//        }

        $map = array();   //生成认证条件
        $map['username'] = $_POST['username'];  // 支持使用绑定帐号登录
//        if ($_SESSION['verify'] != md5($_REQUEST['verify'])) {
//            $this->error('验证码错误！');
//        }

        import('@.ORG.RBAC');
        $authInfo = RBAC::authenticate($map);
        if (false === $authInfo) {  //使用用户名、密码和状态的方式进行认证
            $this->error('用户名不存在！');
        } else {
        	if ($authInfo['password'] != md5($_POST['password'])) {
                $this->error('密码错误！');
            }
            //缓存数据
            $_SESSION[C('USER_AUTH_KEY')] = $authInfo['id'];
            if(!empty($authInfo['name']))
            {
            	$_SESSION['loginUserName'] = $authInfo['name'];
            }else{
            	$position = strpos($authInfo['username'],'@');
            	$_SESSION['loginUserName'] = substr($authInfo['username'],0,$position);
            }
            $_SESSION['lastLoginTime'] = $authInfo['update_time'];
            if ($authInfo['part_id'] == 1 or $authInfo['part_id'] == 2) {
                $_SESSION['administrator'] = true;
            }
            //保存登录信息
            $User = M('AdminUser');
            $data = array();
            $data['id'] = $authInfo['id'];
            $data['update_time'] = time();
            $User->save($data);

            // 缓存访问权限
            RBAC::saveAccessList();
			$this->assign('jumpUrl', U("AdminUser/"));
            $this->success('登录成功！');
        }
    }

    public function password(){
        $this->checkUser();
        $this->display();
    }

    // 更换密码
    public function changePwd() {
        $this->checkUser();
        //对表单提交处理进行处理或者增加非表单数据
        $map = array();
        $map['password'] = pwdHash($_POST['oldpassword']);
        if (isset($_POST['email'])) {
            $map['email'] = $_POST['email'];
        } elseif (isset($_SESSION[C('USER_AUTH_KEY')])) {
            $map['id'] = $_SESSION[C('USER_AUTH_KEY')];
        }
        if(trim($_POST['repassword'])!=trim($_POST['password'])){
            $this->error('两次密码不一致！');
        }
        //检查用户
        $User = M("User");
        $aa=$User->where($map)->find();
        //echo $aa['id'];die();
        if ($aa['id']=='') {
            $this->error('旧密码不符！');
        } else {
            $User->password = pwdHash($_POST['password']);
            $User->save();
            //echo "<script>alert('密码修改成功！');window.parent.location.reload();</script>";
            $this->assign('jumpUrl', U("index"));
            $this->success('密码修改成功！');
        }
    }

    public function profile() {
        $this->checkUser();
        $User = M("User");
        $vo = $User->getById($_SESSION[C('USER_AUTH_KEY')]);
        $this->assign('vo', $vo);
        $this->display();
    }

    public function verify() {
        $type = isset($_GET['type']) ? $_GET['type'] : 'gif';
        import("@.ORG.Image");
        Image::buildImageVerify(4, 1, $type);
    }

	// 修改资料
    public function change() {
        $this->checkUser();
        $User = D("User");
        if (!$User->create()) {
            $this->error($User->getError());
        }
        $result = $User->save();
        if (false !== $result) {
            $this->success('资料修改成功！');
        } else {
            $this->error('资料修改失败!');
        }
    }

    //查找记录条数
    public function getNum($table, $w) {
        if ($w == '') {
            $ucount = M($table)->count(0);
        } else {
            $ucount = M($table)->where($w)->count(0);
        }
        return $ucount;
    }
}
?>