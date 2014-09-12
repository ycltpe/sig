<?php
require("./config.inc.php");
$thisArr = array(
    'SITE_TITLE'    => '拿回扣后台管理中心',	//网站title

    'URL_PATHINFO_DEPR' => '/', //PATHINFO URL 模式下，各参数之间的分割符号
    'DEFAULT_THEME' => 'default', //默认模板主题
    'URL_HTML_SUFFIX' => '.html', //URL伪静态后缀设置
    'DEFAULT_CHARSET' => 'utf-8', // 默认输出编码
    'DEFAULT_TIMEZONE' => 'PRC', // 默认时区
    'DEFAULT_AJAX_RETURN' => 'JSON', // 默认AJAX 数据返回格式,可选JSON XML ...
    //'APP_GROUP_LIST' => 'Home,Admin', //项目分组
    //'DEFAULT_GROUP' => 'Home', //默认分组

    /* Cookie设置 */
    'COOKIE_EXPIRE' => 3600, // Coodie有效期
    'COOKIE_DOMAIN' => '', // Cookie有效域名
    'COOKIE_PATH' => '/', // Cookie路径
    'COOKIE_PREFIX' => 'nhk_', // Cookie前缀 避免冲突

    /* 静态缓存设置 */
    'HTML_CACHE_ON' => false, //默认关闭静态缓存
    'HTML_CACHE_TIME' => 60, //静态缓存有效期
    'HTML_READ_TYPE' => 0, //静态缓存读取方式 0 readfile 1 redirect
    'HTML_FILE_SUFFIX' => '.shtml', //默认静态文件后缀

    /* 错误设置 */
    'ERROR_MESSAGE' => '您浏览的页面暂时发生了错误！请稍后再试～', //错误显示信息,非调试模式有效
    'ERROR_PAGE' => '', // 错误定向页面
    //'SHOW_PAGE_TRACE'=>true,

    'URL_ROUTER_ON' => true,
    'URL_MODEL' => 1,
    'SESSION_AUTO_START' => true,
    'APP_DEBUG' => false,
    'USER_AUTH_ON' => true,
    'USER_AUTH_TYPE' => 1, // 默认认证类型 1 登录认证 2 实时认证
    'USER_AUTH_KEY' => 'nhk_authId', // 用户认证SESSION标记
    'ADMIN_AUTH_KEY' => 'administrator',
    'USER_AUTH_MODEL' => 'AdminUser', // 默认验证数据表模型
    'AUTH_PWD_ENCODER' => 'md5', // 用户认证密码加密方式
    'USER_AUTH_GATEWAY' => '/Public/login', // 默认认证网关
    'NOT_AUTH_MODULE' => 'Public', // 默认无需认证模块
    'REQUIRE_AUTH_MODULE' => '', // 默认需要认证模块
    'NOT_AUTH_ACTION' => '', // 默认无需认证操作
    'REQUIRE_AUTH_ACTION' => '', // 默认需要认证操作
    'GUEST_AUTH_ON' => false, // 是否开启游客授权访问
    'GUEST_AUTH_ID' => 0, // 游客的用户ID
    'SHOW_RUN_TIME' => true, // 运行时间显示
    'SHOW_ADV_TIME' => true, // 显示详细的运行时间
    'SHOW_DB_TIMES' => true, // 显示数据库查询和写入次数
    'SHOW_CACHE_TIMES' => true, // 显示缓存操作次数
    'SHOW_USE_MEM' => true, // 显示内存开销
    'DB_LIKE_FIELDS' => 'title|remark',
    'RBAC_ROLE_TABLE' => 't_role',
    'RBAC_USER_TABLE' => 't_role_user',
    'RBAC_ACCESS_TABLE' => 't_access',
    'RBAC_NODE_TABLE' => 't_node',
    'TMPL_PARSE_STRING' => array(
        '__SELFPUBLIC__' => __ROOT__ . '/' . APP_NAME . '/' . TMPL_DIR . '/' . C('DEFAULT_THEME') . '/' . GROUP_NAME . '/Public',
    //'__TMPL__' => __ROOT__ . '/JetonCMS/Tpl/' . $sysconfig['DEFAULT_THEME']
    )
);
return array_merge($globalConfig, $thisArr);
?>