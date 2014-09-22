<?php

class Validation extends Think {

//==============================================================后加的====================================
    /*
     * 危险字符
     * @param string $str
     * @return boolean
     */

    public function checkIlldalWord() {
        //定义不允许提交的SQL命令及关键字
        $words = array();
        $words[] = " add ";
        $words[] = " count ";
        $words[] = " create ";
        $words[] = " delete ";
        $words[] = " drop ";
        $words[] = " from ";
        $words[] = " grant ";
        $words[] = " insert ";
        $words[] = " select ";
        $words[] = " truncate ";
        $words[] = " update ";
        $words[] = "use ";
        $words[] = "--";
        $words[] = "*";
        $words[] = "\"";
        $words[] = "\\";
        $words[] = "/";
        $words[] = "'";
        $words[] = "=";
        $words[] = "-";
        $words[] = "#";
        $words[] = ";";
        $words[] = "<";
        $words[] = ">";
        $words[] = "+";
        $words[] = "%";

        //判断提交的数据中是否存在以上关键字,$_REQUEST中含有所有提交数据
        foreach ($_REQUEST as $strGot) {
            $strGot = strtolower($strGot); //转为小写
            foreach ($words as $word) {
                if (strstr($strGot, $word)) {
                    return strstr($strGot, $word);
                }
            }
        }
    }

    /*
     * 截取字符串
     * @param string $str
     * @return boolean
     */

    public function csubStr($str, $start, $len) {
        $strlen = strlen($str);
        $clen = 0;
        for ($i = 0; $i < $strlen; $i++, $clen++) {
            if ($clen >= $start + $len)
                break;
            if (ord(substr($str, $i, 1)) > 0xa0) {
                if ($clen >= $start)
                    $tmpstr.=substr($str, $i, 2);
                $i++;
            }
            else {
                if ($clen >= $start)
                    $tmpstr.=substr($str, $i, 1);
            }
        }
        return $tmpstr;
    }

    //===========================================================以上是后加的======================================

    /**
     * 验证为空
     *
     * @param string $str
     * @return boolean
     */
    public function checkEmpty($str) {
        return empty($str);
    }

    /**
     * 验证邮件地址
     *
     * @param string $str
     * @return boolean
     */
    public function checkEmail($str) {
        return preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $str);
    }

    /**
     * 验证URL地址
     *
     * @param string $str
     * @return boolean
     */
    public function checkUrl($str) {
        return preg_match("|^http://[_=&///?\.a-zA-Z0-9-]+$|i", $str);
    }

    /**
     * 全英文字母
     *
     * @param string $str
     * @param integer $len
     * @return boolean
     */
    public function checkAlpha($str, $len = 0) {
        if (is_int($len) && ($len > 0)) {
            return preg_match("/^([a-z]{" . $len . "})$/i", $str);
        } else {
            return preg_match("/^([a-z])+$/i", $str);
        }
    }

    /**
     * 全数字
     *
     * @param string $str
     * @param integer $len
     * @return boolean
     */
    public function checkNumber($str, $len = 0) {
        if (is_int($len) && ($len > 0)) {
            return preg_match("/^([0-9]{" . $len . "})$/", $str);
        } else {
            return preg_match("/^([0-9])+$/", $str);
        }
    }

    /**
     * 数字或字母
     *
     * @param string $str
     * @param integer $len
     * @return boolean
     */
    public function checkNumAlpha($str, $len = 0) {
        if (is_int($len) && ($len > 0)) {
            return preg_match("/^([a-z0-9]{" . $len . "})$/i", $str);
        } else {
            return preg_match("/^([a-z0-9])+$/i", $str);
        }
    }

    /**
     * 数字和字母的组合
     *
     * @param string $str
     * @param integer $len
     * @return boolean
     */
    public function checkBlend($str, $len = 0, $maxLen = 0) {
        if (is_int($maxLen) && ($maxLen > 0)) {
            if (!$this->checkLen($str, $len, $maxLen)) {
                return FALSE;
                exit;
            }
        } elseif (is_int($len) && ($len > 0) && !$maxLen) {
            if (strlen($str) > $len) {
                return FALSE;
                exit;
            }
        }
        return preg_match("/^(((\d+[a-z]+)|([a-z]+\d+))[0-9a-z]*)$/i", $str);
    }

    /**
     * 数字和字母或上划线,下划线
     *
     * @param string $str
     * @param integer $len
     * @return boolean
     */
    public function checkDash($str, $len = 0) {
        if (is_int($len) && ($len > 0)) {
            return preg_match("/^([_a-z0-9-]{" . $len . "})$/i", $str);
        } else {
            return preg_match("/^([_a-z0-9-])+$/i", $str);
        }
    }

    /**
     * 浮点数
     *
     * @param string $str
     * @return boolean
     */
    public function checkFloat($str) {
        return preg_match("/^[0-9]+\.[0-9]+$/", $str);
    }

    /**
     * 最大长度
     *
     * @param string $str
     * @param integer $length
     * @return boolean
     */
    public function checkMax($str, $length) {
        return ($this->utf8_strlen($str) <= $length);
    }

    /**
     * 最小长度
     *
     * @param string $str
     * @param integer $length
     * @return boolean
     */
    public function checkMin($str, $length) {
        return ($this->utf8_strlen($str) >= $length);
    }

    /**
     * 是否一致
     *
     * @param string $strA
     * @param strint $strB
     * @return boolean
     */
    public function checkSame($strA, $strB) {
        return ($strA == $strB) ? TRUE : FALSE;
    }

    /**
     * 指定长度
     *
     * @param string $str
     * @param integer $minLen
     * @param integer $maxLen
     * @return boolean
     */
    public function checkLen($str, $minLen, $maxLen) {
        $strLen = $this->utf8_strlen($str);
        if (($strLen >= $minLen) && ($strLen <= $maxLen)) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function utf8_strlen($string = null) {
        // 将字符串分解为单元
        preg_match_all("/./us", $string, $match);
        // 返回单元个数
        return count($match[0]);
    }

    /**
     * 中文
     *
     * @param string $str
     * @param integer $len
     * @return boolean
     */
    public function checkChinese($str, $len = 0) {
        $pregstr = "/[\x{4e00}-\x{9fa5}]+/u";   //UTF8
        if (is_int($len) && ($len > 0)) {
            $len = $len * 2;
            //return preg_match("/^[" . chr(0xa1) . "-" . chr(0xff) . "]{" . $len . "}$/", $str);
            return preg_match("/^[" . chr(0xa1) . "-" . chr(0xff) . "]{" . $len . "}$/", $str);
        } else {
            //return preg_match("/^[" . chr(0xa1) . "-" . chr(0xff) . "]+$/", $str);
            return preg_match($pregstr, $str);
        }
    }

    /**
     * IP地址验证
     *
     * @param string $str
     * @return boolean
     */
    public function checkIp($str) {
        $exp = array();
        if ($exp = explode('.', $str)) {
            foreach ($exp as $val) {
                if ($val > 255) {
                    return FALSE;
                    exit;
                }
            }
        }
        return preg_match("/^[\d]{1,3}\.[\d]{1,3}\.[\d]{1,3}\.[\d]{1,3}$/", $str);
    }

    /**
     * 日期格式验证
     *
     * @param string $str
     * @return boolean
     */
    public function checkIsDate($str) {
        $exp = array();
        if ($exp = explode('/', $str)) {
            if (count($exp) == 3) {
                $str = implode('-', $exp);
            }
        }
        if ($exp = explode('-', $str)) {
            if (count($exp) != 3 || $exp[1] > 12 || $exp[2] > 31) {
                return FALSE;
                exit;
            }
        }
        return preg_match("/^([1-9][\d])?[\d][\d][-|\/][\d]{1,2}[-|\/][\d]{1,2}$/", $str);
    }

    /**
     *  时间格式验证
     *
     * @param string $str
     * @return boolean
     */
    public function checkIsTime($str) {
        $exp = array();
        if ($exp = explode(':', $str)) {
            if (count($exp) != 3 || $exp[0] > 23 || $exp[1] > 59 || $exp[2] > 59) {
                return FALSE;
                exit;
            }
        }
        return preg_match("/^[\d]{1,2}:[\d]{1,2}:[\d]{1,2}$/", $str);
    }

    /**
     * 电话号码
     *
     * @param string $str
     * @return boolean
     */
    public function checkPhone($str) {
        return preg_match("/^(\d{3,4}-)?(\d{7,8})$/", $str);
    }

    /**
     * 手机号码
     *
     * @param string $str
     * @return boolean
     */
    public function checkMobile($str) {
        //return preg_match("/^[0]?([13|15]+)(\d{8})$/", $str);
        return preg_match("/^13[0-9]{1}[0-9]{8}$|15[0-9]{1}[0-9]{8}$|18[0-9]{1}[0-9]{8}$/", $str);
    }

    /**
     * 邮政编码
     *
     * @param string $str
     * @return boolean
     */
    public function checkZip($str) {
        return preg_match("/^[1-9]\d{5}$/", $str);
    }

    /**
     * 自定义正则验证
     *
     * @param string $str
     * @param string $type
     * type为正则表达示格式，如 /[a-z]+[\d]{3,5}/i
     * @return boolean
     */
    public function checkCustom($str, $type) {
        return preg_match($type, $str);
    }

    /**
     * 多项验证
     *
     * @param array $strArr
     * @return array
     */
    public function checkSundry($strArr) {
        $returnArr = $classMethods = $funcArr = array();
        if (is_array($strArr)) {
            $classMethods = get_class_methods('MooValidation');
            foreach ($classMethods as $methods) {
                $funcArr[] = strtoupper($methods);
            }
            foreach ($strArr as $key => $val) {
                if (is_array($val)) {
                    $func = "check" . $val[0];
                    if (!in_array(strtoupper($func), $funcArr)) {
                        echo 'ERROR: The ' . $func . ' method has not defined!';
                        exit;
                    }
                    if ($val[3]) {
                        $returnArr[] = $this->$func($val[1], $val[2], $val[3]);
                    } elseif ($val[2] && !$val[3]) {
                        $returnArr[] = $this->$func($val[1], $val[2]);
                    } else {
                        $returnArr[] = $this->$func($val[1]);
                    }
                }
            }
        }
        return $returnArr;
    }

    function kill_html($str) {   //清除HTML标签
//        $st = -1; //开始
//        $et = -1; //结束
//        $stmp = array();
//        $stmp[] = "&nbsp;";
//        $len = strlen($str);
//        for ($i = 0; $i < $len; $i++) {
//            $ss = substr($str, $i, 1);
//            if (ord($ss) == 60) { //ord("<")==60
//                $st = $i;
//            }
//            if (ord($ss) == 62) { //ord(">")==62
//                $et = $i;
//                if ($st != -1) {
//                    $stmp[] = substr($str, $st, $et - $st + 1);
//                }
//            }
//        }
//        $str = str_replace($stmp, "", $str);

        $sqlindb = array('cast', 'set', 'exec', 'insert', 'select', 'delete', 'update', 'execute', 'from', 'declare', 'varchar', 'script', 'iframe');
        foreach($sqlindb as $invalue){
            $pcon = str_ireplace($invalue,"",$str);
         }
        return $str;
    }

}