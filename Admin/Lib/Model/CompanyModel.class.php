<?php
class CompanyModel extends CommonModel {
    // 自动验证设置
    protected $_validate = array(
        array('name', 'require', '机构名称必填！', 1),
        array('name','','机构名称已经存在！',0,'unique',1),
    );
    
    public $_auto		=	array(
		array('create_time','time',self::MODEL_INSERT,'function'),
		array('update_time','time',self::MODEL_INSERT,'function'),
		);
}
?>