<?php

// +----------------------------------------------------------------------
// | ThinkPHP
// +----------------------------------------------------------------------
// | Copyright (c) 2007 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$
//公共函数

function optionFenlei($arr, $p_id = 0) {
    for ($i = 0; $i < count($arr); $i++) {
        if ($arr[$i]['p_id'] == $p_id) {
            echo '<option value="' . $arr[$i]['id'] . '">' . $arr[$i]['name'] . '</option>';
            optionFenlei($arr, $arr[$i]['id']);
        }
    }
}

function fenlei($arr, $p_id = 0) {
    for ($i = 0; $i < count($arr); $i++) {
        if ($arr[$i]['p_id'] == $p_id) {
            $style = '';
            $addchild = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
            if ($p_id == 0) {
                $addchild = '<a href="' . __URL__ . '/add/p_id/' . $arr[$i]['id'] . '">添加子菜单</a> |';
            } else {
                $style = ' style="text-indent:2em;"';
            }
            echo '<tr><td class="checkbox"><input type="checkbox" name="id[]" value="' . $arr[$i]['id'] . '" class="checkbox" /></td>
                      <td' . $style . '>' . $arr[$i]['id'] . '</td><td' . $style . '>' . $arr[$i]['name'] . '</td><td>&nbsp;</td>
                      <td>' . getStatus1($arr[$i]['status']) . '</td>
                      <td>' . $addchild . '
                         <a href="' . __URL__ . '/edit/id/' . $arr[$i]['id'] . '">编辑</a> |
                         <a href="' . __URL__ . '/editclass/id/' . $arr[$i]['id'] . '">移动</a> |
                         <a href="' . __URL__ . '/delete/id/' . $arr[$i]['id'] . '">删除</a></td></tr>';
            fenlei($arr, $arr[$i]['id']);
        }
    }
}

function getNewsCate($id){
    return M('Arctype')->where('id = ' . $id . ' and p_id = 45 and status = 1')->getField('name');
}
function getServiceCate($id){
    return M('Arctype')->where('id = ' . $id . ' and p_id = 2 and status = 1')->getField('name');
}

function getCaseCate($id){
    return M('CaseCate')->where('id = ' . $id . ' and status = 1')->getField('catename');
}

function getSchemeCate($id){
    return M('SchemeCate')->where('id = ' . $id . ' and status = 1')->getField('catename');
}
function getProductCate($id){
    return M('ProductCate')->where('id = ' . $id . ' and status = 1')->getField('catename');
}

function getStatus1($id) {
    switch ($id) {
        case 1 :
            $show = '<img src="/Public/images/right.gif" />';
            break;
        case 0 :
            $show = '<img src="/Public/images/error.gif" />';
            break;
    }
    return $show;
}

function toDate($time, $format = 'Y-m-d H:i:s') {
    if (empty($time)) {
        return '';
    }
    $format = str_replace('#', ':', $format);
    return date($format, $time);
}

//excel日期转换函数
function excelTime($days, $time=false) {
    $log = new Log();
    $log->write("运行到这了。。。0。。。" . $days);
    if (is_numeric($days)) {
        $log->write("运行到这了。。。1");
        //based on 1900-1-1
        $jd = GregorianToJD(1, 1, 1970);
        $gregorian = JDToGregorian($jd + intval($days) - 25569);
        $myDate = explode('/', $gregorian);
        $myDateStr = str_pad($myDate[2], 4, '0', STR_PAD_LEFT)
                . "-" . str_pad($myDate[0], 2, '0', STR_PAD_LEFT)
                . "-" . str_pad($myDate[1], 2, '0', STR_PAD_LEFT)
                . ($time ? " 00:00:00" : '');
        $log->write("运行到这了。。。2");
        return $myDateStr;
    }
    $log->write("运行到这了。。。3");
    return $days;
}

function isHot($is_hot) {
    if ($is_hot == 0) {
        return '否';
    } else {
        return '是';
    }
}

function isAdmin($is_admin) {
    if ($is_admin == 2) {
        return '管理员';
    } else {
        return '普通用户';
    }
}

function DateAdd($interval, $number, $date) {
    $date_time_array = getdate($date);
    $hours = $date_time_array["hours"];
    $minutes = $date_time_array["minutes"];
    $seconds = $date_time_array["seconds"];
    $month = $date_time_array["mon"];
    $day = $date_time_array["mday"];
    $year = $date_time_array["year"];
    switch ($interval) {
        case "yyyy": $year +=$number;
            break;
        case "q": $month +=($number * 3);
            break;
        case "m": $month +=$number;
            break;
        case "y":
        case "d":
        case "w": $day+=$number;
            break;
        case "ww": $day+=($number * 7);
            break;
        case "h": $hours+=$number;
            break;
        case "n": $minutes+=$number;
            break;
        case "s": $seconds+=$number;
            break;
    }
    $timestamp = mktime($hours, $minutes, $seconds, $month, $day, $year);
    return $timestamp;
}

function guid() {
    if (function_exists('com_create_guid')) {
        return com_create_guid();
    } else {
        mt_srand((double) microtime() * 10000); //optional for php 4.2.0 and up.
        $charid = strtoupper(md5(uniqid(rand(), true)));
        $hyphen = chr(45); // "-"
        $uuid = chr(123)// "{"
                . substr($charid, 0, 8) . $hyphen
                . substr($charid, 8, 4) . $hyphen
                . substr($charid, 12, 4) . $hyphen
                . substr($charid, 16, 4) . $hyphen
                . substr($charid, 20, 12)
                . chr(125); // "}"
        return $uuid;
    }
}

function get_client_ip() {
    if (getenv("HTTP_CLIENT_IP") && strcasecmp(getenv("HTTP_CLIENT_IP"), "unknown"))
        $ip = getenv("HTTP_CLIENT_IP");
    else if (getenv("HTTP_X_FORWARDED_FOR") && strcasecmp(getenv("HTTP_X_FORWARDED_FOR"), "unknown"))
        $ip = getenv("HTTP_X_FORWARDED_FOR");
    else if (getenv("REMOTE_ADDR") && strcasecmp(getenv("REMOTE_ADDR"), "unknown"))
        $ip = getenv("REMOTE_ADDR");
    else if (isset($_SERVER ['REMOTE_ADDR']) && $_SERVER ['REMOTE_ADDR'] && strcasecmp($_SERVER ['REMOTE_ADDR'], "unknown"))
        $ip = $_SERVER ['REMOTE_ADDR'];
    else
        $ip = "unknown";
    return ($ip);
}

// 缓存文件
function cmssavecache($name = '', $fields = '') {
    $Model = D($name);
    $list = $Model->select();
    $data = array();
    foreach ($list as $key => $val) {
        if (empty($fields)) {
            $data [$val [$Model->getPk()]] = $val;
        } else {
            // 获取需要的字段
            if (is_string($fields)) {
                $fields = explode(',', $fields);
            }
            if (count($fields) == 1) {
                $data [$val [$Model->getPk()]] = $val [$fields [0]];
            } else {
                foreach ($fields as $field) {
                    $data [$val [$Model->getPk()]] [] = $val [$field];
                }
            }
        }
    }
    $savefile = cmsgetcache($name);
    // 所有参数统一为大写
    $content = "<?php\nreturn " . var_export(array_change_key_case($data, CASE_UPPER), true) . ";\n?>";
    file_put_contents($savefile, $content);
}

function cmsgetcache($name = '') {
    return DATA_PATH . '~' . strtolower($name) . '.php';
}

function getStatus($status, $imageShow = true) {
    switch ($status) {
        case 1 :
            $showText = '禁用';
            $showImg = '<IMG SRC="../Public/images/locked.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="禁用">';
            break;
        case 2 :
            $showText = '待审';
            $showImg = '<IMG SRC="../Public/images/prected.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="待审">';
            break;
        case - 1 :
//            $showText = '删除';
//            $showImg = '<IMG SRC="../Public/images/del.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="删除">';
            $showText = '未审核';
            $showImg = '<IMG SRC="../Public/images/locked.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="未审核">';
            break;
        case 0 :
        default :
            $showText = '正常';
            $showImg = '<IMG SRC="../Public/images/ok.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="正常">';
    }
    return ($imageShow === true) ? $showImg : $showText;
}

function getUserRecommend($status) {
    switch ($status) {
        case 0 :
            $showText = '否';
            break;
        case 1 :
            $showText = '<span style="color:red">健身专家</span>';
            break;
        case 2 :
            $showText = '<span style="color:red">减肥达人</span>';
            break;
        default :
            $showText = '否';
    }
    return $showText;
}

function getTypes($type) {
    switch ($type) {
        case 1 :
            $showText = '注册用户';
            break;
        case 2 :
            $showText = '腾讯QQ用户';
        case 3 :
            $showText = '新浪微博用户';
            break;
        default :
            $showText = '注册用户';
    }
    return $showText;
}

function getTags($tag) {
    switch ($tag) {
        case 0 :
            $showText = 'ANDROID';
            break;
        case 1 :
            $showText = 'IOS';
            break;
        default :
            $showText = 'ANDROID';
    }
    return $showText;
}

function getAchievements($achievement) {
    switch ($achievement) {
        case 1 :
            $showText = '自重篇';
            break;
        case 2 :
            $showText = '器械篇';
            break;
        case 3 :
            $showText = '有氧篇';
            break;
        case 4 :
            $showText = '社交篇';
            break;
        case 5 :
            $showText = '综合篇';
            break;
        default :
            $showText = '自重篇';
    }
    return $showText;
}

function getpublish($sta) {
    if ($sta == 1) {
        return '发布中';
    } else {
        return '待发布';
    }
}

function getDefaultStyle($style) {
    if (empty($style)) {
        return 'blue';
    } else {
        return $style;
    }
}

function IP($ip = '', $file = 'UTFWry.dat') {
    $_ip = array();
    if (isset($_ip [$ip])) {
        return $_ip [$ip];
    } else {
        import("ORG.Net.IpLocation");
        $iplocation = new IpLocation($file);
        $location = $iplocation->getlocation($ip);
        $_ip [$ip] = $location ['country'] . $location ['area'];
    }
    return $_ip [$ip];
}

function getNodeName($id) {
    if (Session::is_set('nodeNameList')) {
        $name = Session::get('nodeNameList');
        return $name [$id];
    }
    $Group = D("Node");
    $list = $Group->getField('id,name');
    $name = $list [$id];
    Session::set('nodeNameList', $list);
    return $name;
}

function get_pawn($pawn) {
    if ($pawn == 0)
        return "<span style='color:green'>没有</span>";
    else
        return "<span style='color:red'>有</span>";
}

function get_patent($patent) {
    if ($patent == 0)
        return "<span style='color:green'>没有</span>";
    else
        return "<span style='color:red'>有</span>";
}

function getNodeGroupName($id) {
    if (empty($id)) {
        return '未分组';
    }
    if (isset($_SESSION ['nodeGroupList'])) {
        return $_SESSION ['nodeGroupList'] [$id];
    }
    $Group = D("Group");
    $list = $Group->getField('id,title');
    $_SESSION ['nodeGroupList'] = $list;
    $name = $list [$id];
    return $name;
}

function getCardStatus($status) {
    switch ($status) {
        case 0 :
            $show = '未启用';
            break;
        case 1 :
            $show = '已启用';
            break;
        case 2 :
            $show = '使用中';
            break;
        case 3 :
            $show = '已禁用';
            break;
        case 4 :
            $show = '已作废';
            break;
    }
    return $show;
}

function showStatus($status, $id) {
    switch ($status) {
        case 1 :
            $info = '<a href="javascript:resume(' . $id . ')">恢复</a>';
            break;
        case 2 :
//            $info = '<a href="javascript:pass(' . $id . ')">批准</a>';
            $info = '无';
            break;
        case 0 :
            $info = '<a href="javascript:forbid(' . $id . ')">禁用</a>';
            break;
        case -1 :
//            $info = '<a href="javascript:recycle(' . $id . ')">还原</a>';
            $info = '<span style="color:red;">未审核</span>';
            break;
    }
    return $info;
}

function showActionType($show_type) {
    switch ($show_type) {
        case 1 :
            $info = '自重训练';
            break;
        case 2 :
            $info = '器械训练';
            break;
        case 3 :
            $info = '有氧训练';
            break;
        case 4 :
            $info = '操课训练';
            break;
        default :
            $info = '自重训练';
    }
    return $info;
}

function showRecommend($recommend, $id) {
    switch ($recommend) {
//        case 1 :
//            $info = '<a href="javascript:actionList(' . $id . ')">挑战动作</a>';
//            break;
//        case 0 :
//            $info = '<span style="color:red;">不能修改</span>';
//            break;
        case 1 :
            $info = '<a href="javascript:resumeRecommend(' . $id . ')"><span style="color:red;">取消推荐</span></a>';
            break;
        case 0 :
            $info = '<a href="javascript:addRecommend(' . $id . ')">设为推荐</a>';
            break;
    }
    return $info;
}

function showHot($is_hot, $id) {
    switch ($is_hot) {
//        case 1 :
//            $info = '<a href="javascript:actionList(' . $id . ')">挑战动作</a>';
//            break;
//        case 0 :
//            $info = '<span style="color:red;">不能修改</span>';
//            break;
        case 1 :
            $info = '<a href="javascript:resumeHot(' . $id . ')"><span style="color:red;">取消热门</span></a>';
            break;
        case 0 :
            $info = '<a href="javascript:addHot(' . $id . ')">设为热门</a>';
            break;
    }
    return $info;
}

function download($id) {
//    $info = '<a href="'.__ROOT__.'/'.$url.'">下载</a>';
    $info = '<a href="javascript:toDownload(' . $id . ')">下载</a>';
    return $info;
}

/**
  +----------------------------------------------------------
 * 获取登录验证码 默认为4位数字
  +----------------------------------------------------------
 * @param string $fmode 文件名
  +----------------------------------------------------------
 * @return string
  +----------------------------------------------------------
 */
function build_verify($length = 4, $mode = 1) {
    return rand_string($length, $mode);
}

function getGroupName($id) {
    if ($id == 0) {
        return '无上级组';
    }
    if ($list = F('groupName')) {
        return $list [$id];
    }
    $dao = D("Role");
    $list = $dao->findAll(array('field' => 'id,name'));
    foreach ($list as $vo) {
        $nameList [$vo ['id']] = $vo ['name'];
    }
    $name = $nameList [$id];
    F('groupName', $nameList);
    return $name;
}

function sort_by($array, $keyname = null, $sortby = 'asc') {
    $myarray = $inarray = array();
    # First store the keyvalues in a seperate array
    foreach ($array as $i => $befree) {
        $myarray [$i] = $array [$i] [$keyname];
    }
    # Sort the new array by
    switch ($sortby) {
        case 'asc' :
            # Sort an array and maintain index association...
            asort($myarray);
            break;
        case 'desc' :
        case 'arsort' :
            # Sort an array in reverse order and maintain index association
            arsort($myarray);
            break;
        case 'natcasesor' :
            # Sort an array using a case insensitive "natural order" algorithm
            natcasesort($myarray);
            break;
    }
    # Rebuild the old array
    foreach ($myarray as $key => $befree) {
        $inarray [] = $array [$key];
    }
    return $inarray;
}

/**
  +----------------------------------------------------------
 * 产生随机字串，可用来自动生成密码
 * 默认长度6位 字母和数字混合 支持中文
  +----------------------------------------------------------
 * @param string $len 长度
 * @param string $type 字串类型
 * 0 字母 1 数字 其它 混合
 * @param string $addChars 额外字符
  +----------------------------------------------------------
 * @return string
  +----------------------------------------------------------
 */
function rand_string($len = 6, $type = '', $addChars = '') {
    $str = '';
    switch ($type) {
        case 0 :
            $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' . $addChars;
            break;
        case 1 :
            $chars = str_repeat('0123456789', 3);
            break;
        case 2 :
            $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' . $addChars;
            break;
        case 3 :
            $chars = 'abcdefghijklmnopqrstuvwxyz' . $addChars;
            break;
        default :
            // 默认去掉了容易混淆的字符oOLl和数字01，要添加请使用addChars参数
            $chars = 'ABCDEFGHIJKMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789' . $addChars;
            break;
    }
    if ($len > 10) { //位数过长重复字符串一定次数
        $chars = $type == 1 ? str_repeat($chars, $len) : str_repeat($chars, 5);
    }
    if ($type != 4) {
        $chars = str_shuffle($chars);
        $str = substr($chars, 0, $len);
    } else {
        // 中文随机字
        for ($i = 0; $i < $len; $i++) {
            $str .= msubstr($chars, floor(mt_rand(0, mb_strlen($chars, 'utf-8') - 1)), 1);
        }
    }
    return $str;
}

function pwdHash($password, $type = 'md5') {
    return hash($type, $password);
}

//友情链接判断为什么链接形式
function showLink($id) {
    $info = M("Links")->where("id={$id}")->find();
    switch ($info['typeid']) {
        case 1 :

            $value = '<img  src="__ROOT__/Uploads/link/' . $info['imgurl'] . '"/>';
            break;
        case 2 :
            $value = $info['content'];
            break;
    }
    return $value;
}

//得到新闻的类型

function getnewtype($tid) {
    switch ($tid) {
        case 1 :
            $value = "新闻中心";
            break;
        case 2 :
            $value = "技术支持";
            break;
    }
    return $value;
}

//友情链接判断为什么链接形式
function showLinkType($id) {
    $info = M("Links")->where("id={$id}")->find();
    switch ($info['typeid']) {
        case 1 :
            $value = "图片链接";
            break;
        case 2 :
            $value = "文字链接";
            break;
    }
    return $value;
}

//案例网站类型
function showCaseType($typeid) {
    $casetype = M("Categorypro")->where("id={$typeid}")->find();
    $value = $casetype['typename'];
    return $value;
}

//下载分类
function showDownType($typeid) {
    $casetype = M("Catedown")->where("id={$typeid}")->find();
    $value = $casetype['typename'];
    return $value;
}

//案例所属类别
function showClassName($id) {
    $dao = M("Category");
    $info = $dao->field('catename')->where("id={$id}")->find();
    $value = $info['catename'];
    return $value;
}

//行业范围类别
function showScopeName($id) {
    $info = M("Catescope")->field('catename')->where("id={$id}")->find();
    $value = $info['catename'];
    return $value;
}

//案例详细图
function showDetaile($id) {
    $detail = M("Detailed")->where("id={$id}")->find();
    $value = '<img  width="75px" height="50px" src="__ROOT__/Uploads/detail/' . $detail['imgurl'] . '"/>';
    return $value;
}

function showDetaileType($id) {
    $info = M("Detailed")->where("id={$id}")->find();
    $casetype = M("Case")->where("id={$info['parentid']}")->find();
    $value = $casetype['proname'];
    return $value;
}

function getShort($str, $length = 25, $ext = '') {
    $str = htmlspecialchars($str);
    $str = strip_tags($str);
    $str = htmlspecialchars_decode($str);
    $strlenth = 0;
    $out = '';
    preg_match_all("/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/", $str, $match);
    foreach ($match[0] as $v) {
        preg_match("/[\xe0-\xef][\x80-\xbf]{2}/", $v, $matchs);
        if (!empty($matchs[0])) {
            $strlenth += 1;
        } elseif (is_numeric($v)) {
            $strlenth += 0.545;
        } else {
            $strlenth += 0.475;
        }

        if ($strlenth > $length) {
            $output .= $ext;
            break;
        }

        $output .= $v;
    }
    return $output;
}

function getcatename($id) {
    $gory = M("Category");
    $name = $gory->where("id={$id}")->getField('catename');
    return $name;
}

function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true) {
    if (function_exists("mb_substr")) {
        if ($suffix) {
            if (strlen($str) > $length)
                return mb_substr($str, $start, $length, $charset) . "...";
            else
                return mb_substr($str, $start, $length, $charset);
        }
        else
            return mb_substr($str, $start, $length, $charset);
    }
    elseif (function_exists('iconv_substr')) {
        if ($suffix) {
            if (iconv_strlen($str) > $length)
                return iconv_substr($str, $start, $length, $charset) . "...";
            else
                return iconv_substr($str, $start, $length, $charset);
        }
        else
            return iconv_substr($str, $start, $length, $charset);
    }
    $re['utf-8'] = "/[x01-x7f]|[xc2-xdf][x80-xbf]|[xe0-xef][x80-xbf]{2}|[xf0-xff][x80-xbf]{3}/";
    $re['gb2312'] = "/[x01-x7f]|[xb0-xf7][xa0-xfe]/";
    $re['gbk'] = "/[x01-x7f]|[x81-xfe][x40-xfe]/";
    $re['big5'] = "/[x01-x7f]|[x81-xfe]([x40-x7e]|xa1-xfe])/";
    preg_match_all($re[$charset], $str, $match);
    $slice = join("", array_slice($match[0], $start, $length));
    if ($suffix)
        return $slice . "…";
    return $slice;
}

?>