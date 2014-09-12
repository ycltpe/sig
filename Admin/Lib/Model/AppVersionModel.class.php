<?php
// 版本更新模型
class AppVersionModel extends CommonModel {
	public $_validate	=	array(
		array('name','require','应用名称必须！',1),
		array('app_id','require','应用唯一标识必须！'),
		array('version_code','require','版本号必须！'),
		array('version_name','require','版本名称必须！'),
		);

	public $_auto		=	array(
		array('create_time','time',self::MODEL_INSERT,'function'),
		array('status',0),
		);

}
?>