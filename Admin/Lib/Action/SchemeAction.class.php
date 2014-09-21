<?php

class SchemeAction extends CommonAction {

    public function _before_add() {
        $list = M('SchemeCate')->where('status = 1')->select();
        $this->assign('list', $list);
    }

    public function _before_edit() {
        $list = M('SchemeCate')->where('status = 1')->select();
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
        $pic = $_FILES['thumb'];
        $save_type = 'jpg,png,jpeg,BMP,bmp';
        if (!empty($title) && !empty($pic['name'])) {
            // 创建数据对象
            $model = $this->getActionName();
            $case = M($model);
            $data = $_POST;
            $picInfo = $this->upload_pic($pic, $save_type, 'Uploads/pic/scheme/');
            $data['thumb'] = $picInfo[0]['savepath'] . $picInfo[0]['savename'];
            $data['created'] = time();
            $result = $case->add($data);
            // 写入帐号数据
            if ($result) {
                $this->assign('jumpUrl', U("Scheme/"));
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
        $pic = $_FILES['thumb'];
        $save_type = 'jpg,png,jpeg,BMP,bmp';
        if (!empty($id)) {
            $data = $_POST;
            if (!empty($title)) {
                $data['title'] = $title;
            }
            if (!empty($pic['name'])) {
                $picInfo = $this->upload_pic($pic, $save_type, 'Uploads/pic/scheme/');
                $data['thumb'] = $picInfo[0]['savepath'] . $picInfo[0]['savename'];
            }
            $data['id'] = $id;
            $model = $this->getActionName();
            $case = M($model);
            // 更新数据
            $list = $case->save($data);
            if (false !== $list) {
                $this->assign('jumpUrl', U("Scheme/"));
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