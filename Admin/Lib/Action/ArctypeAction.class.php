<?php

// 站点配置
class ArctypeAction extends CommonAction {

    public function _filter(&$map) {
        if (!empty($_GET['search_name'])) {
            $map['name'] = array('like', "%" . $_GET['search_name'] . "%");
        } else {
//            $map['p_id'] = $_GET['p_id'] ? $_GET['p_id'] : 0;
        }
    }

    public function _list($model, $map, $sortBy = '', $asc = true) {
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
        if (empty($group)) {
            $count = $model->where($map)->count('id');
        } else {
            $count = $model->where($map)->count('distinct ' . $group);
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
            $voList = $model->where($map)->order($order . " " . $sort)->group($group)->findAll();
//            $voList = $model->where($map)->order($order . " " . $sort)->group($group)->limit($p->firstRow . ',' . $p->listRows)->findAll();
//			}
//            $this->_fenlei($voList);
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

//    private function _fenlei($arr, $p_id = 0) {
//        for ($i = 0; $i < count($arr); $i++) {
//            if ($arr[$i]['p_id'] == $p_id) {
//                echo $arr[$i]['name'] . '<br/>';
//                $this->_fenlei($arr, $arr[$i]['id']);
//            }
//        }
//    }

    public function _before_add() {
        $this->assign('p_id', trim($_REQUEST['p_id']));
    }

    public function editclass() {
        $id = trim($_GET['id']);
        $name = $this->getActionName();
        $model = M($name);
        $arr = $model->where('id <> ' . $id . ' and status = 1')->findAll();
        $this->assign('arr', $arr);
        $this->assign('id', $id);
        $this->edit();
    }

    public function delete() {
        //删除指定记录
        $name = $this->getActionName();
        $model = M($name);
        if (!empty($model)) {
            $pk = $model->getPk();
            $id = $_REQUEST [$pk];
            if (isset($id)) {
                if (is_array($id)) {
                    $condition = array($pk => array('in', implode(',', $id)));
                } else {
                    $condition = array($pk => array('in', explode(',', $id)));
                }
                $list = $model->where($condition)->delete();
                if ($list !== false) {
                    $data = array('p_id' => 0);
                    if (is_array($id)) {
                        $condition = array('p_id' => array('in', implode(',', $id)));
                    } else {
                        $condition = array('p_id' => array('in', explode(',', $id)));
                    }
                    $model->where($condition)->save($data);
                    $this->success('删除成功！');
                } else {
                    $this->error('删除失败！');
                }
            } else {
                $this->error('非法操作');
            }
        }
    }

}

?>