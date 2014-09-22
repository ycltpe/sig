<?php

class NewsAction extends CommonAction {

    public function _before_add() {
        $list = M('Arctype')->where('p_id = 45 and status = 1')->select();
        $this->assign('list', $list);
    }

    public function _before_edit() {
        $list = M('Arctype')->where('p_id = 45 and status = 1')->select();
        $this->assign('list', $list);
    }

    public function edit() {
        $model = $this->getActionName();
        $model = M($model);
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        $this->display();
    }

    // 插入数据
    public function insert() {
        $title = $_REQUEST['title'];
        if (!empty($title)) {
            // 创建数据对象
            $model = $this->getActionName();
            $case = M($model);
            $data = $_POST;
            if (empty($_POST['brief'])) {
//                import("@.ORG.Validation");
//                $v = new Validation();
//                $description = $v->kill_html($_POST['description']);
                $description = strip_tags($_POST['description']);
                $data['brief'] = msubstr(trim($description), 0, 120);
            }
            $data['created'] = time();
            $result = $case->add($data);
            // 写入帐号数据
            if ($result) {
                $this->assign('jumpUrl', U("News/"));
                $this->success('添加成功！');
            } else {
                $this->error('添加失败！');
            }
        } else {
            $this->error('请将表单填写完整！');
        }
    }

    public function update() {
        $id = $_REQUEST['id'];
        $title = $_REQUEST['title'];
        if (!empty($id)) {
            $data = $_POST;
            if (!empty($title)) {
                $data['title'] = $title;
            }
            if (empty($_POST['brief'])) {
//                import("@.ORG.Validation");
//                $v = new Validation();
//                $description = $v->kill_html($_POST['description']);
                $description = strip_tags($_POST['description']);
                $data['brief'] = msubstr(trim($description), 0, 120);
            }
            $data['id'] = $id;
            $model = $this->getActionName();
            $case = M($model);
            // 更新数据
            $list = $case->save($data);
            if (false !== $list) {
                $this->assign('jumpUrl', U("News/"));
                $this->success('编辑成功!');
            } else {
                //错误提示
                $this->error('编辑失败!');
            }
        } else {
            //错误提示
            $this->error('编辑失败!');
        }
    }

}

?>