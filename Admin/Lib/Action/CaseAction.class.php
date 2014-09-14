<?php

class CaseAction extends CommonAction {

    public function edit() {
        $model = M('Banner');
        $id = $_REQUEST [$model->getPk()];
        $vo = $model->getById($id);
        $this->assign('vo', $vo);
        $this->display();
    }

    // 插入数据
    public function insert() {
        $title = $_REQUEST['title'];
        $pic = $_FILES['pic'];
        $lit_title = $_REQUEST['lit_title'];
        $save_type = 'jpg,png,jpeg,BMP,bmp';
        if (!empty($title) && !empty($pic['name']) && !empty($lit_title)) {
            // 创建数据对象
            $model = $this->getActionName();
            $slide = M($model);
            $slide->title = $title;
            $slide->lit_title = $lit_title;
            $picInfo = $this->upload_pic($pic, $save_type, 'Uploads/pic/banner/');
            $slide->image = $picInfo[0]['savepath'] . $picInfo[0]['savename'];
            $slide->create_time = time();
            $result = $slide->add();
            // 写入帐号数据
            if ($result) {
                $this->assign('jumpUrl', U("Banner/"));
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
        $pic = $_FILES['pic'];
        $lit_title = $_REQUEST['lit_title'];
        $save_type = 'jpg,png,jpeg,BMP,bmp';
        if (!empty($id)) {
            if (!empty($title)) {
                $data['title'] = $title;
            }
            if (!empty($lit_title)) {
                $data['lit_title'] = $lit_title;
            }
            if (!empty($pic['name'])) {
                $picInfo = $this->upload_pic($pic, $save_type, 'Uploads/pic/banner/');
                $data['image'] = $picInfo[0]['savepath'] . $picInfo[0]['savename'];
            }
            $data['id'] = $id;
            $model = M('Banner');
            // 更新数据
            $list = $model->save($data);
            if (false !== $list) {
                $this->assign('jumpUrl', U("Banner/"));
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