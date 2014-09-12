<?php
// 用户模型
class UserModel extends CommonModel {
	public $_validate	=	array(
		array('email','require','邮箱必须'),
		array('email','Email','邮箱格式不正确'),
		array('email','','邮箱已经存在',self::EXISTS_VAILIDATE,'unique',self::MODEL_INSERT),
		array('password','require','密码必须'),
//		array('repassword','require','确认密码必须'),
//		array('repassword','password','确认密码不一致',self::EXISTS_VAILIDATE,'confirm'),
		array('name','require','姓名必须'),
//		array('type'),
//		array('role'),
//		array('status'),
//		array('personalized_name'),
//		array('sex'),
		array('phone','require','手机号码必须'),
		array('phone','/^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$/','手机号码不正确'),
//		array('contact'),
//		array('address'),
		
		);

	public $_auto		=	array(
		array('password','pwdHash',self::MODEL_BOTH,'callback'),
		array('create_time','time',self::MODEL_INSERT,'function'),
		array('update_time','time',self::MODEL_UPDATE,'function'),
		array('first_login',1),
		array('sex',0),
		
		);

	protected function pwdHash() {
		if(isset($_POST['password'])) {
			return pwdHash($_POST['password']);
		}else{
			return false;
		}
	}
}
?>