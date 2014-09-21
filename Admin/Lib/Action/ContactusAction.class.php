<?php

class ContactusAction extends CommonAction {

    public function insert() {
        $title = $_REQUEST['title'];
        $pic1 = $_FILES['img1'];
        $save_type = 'jpg,png,jpeg,BMP,bmp';
        if (!empty($title)) {
            // 创建数据对象
            $model = $this->getActionName();
            $case = M($model);
            $data = $_POST;
            if (!empty($pic1['name'])) {
                $picInfo1 = $this->upload_pic($pic1, $save_type, 'Uploads/pic/brief/');
                $data['img1'] = $picInfo1[0]['savepath'] . $picInfo1[0]['savename'];
            }
            $data['created'] = time();
            $result = $case->add($data);
            // 写入帐号数据
            if ($result) {
                $this->assign('jumpUrl', U("Contactus/"));
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
        $pic1 = $_FILES['img1'];
        $save_type = 'jpg,png,jpeg,BMP,bmp';
        if (!empty($id)) {
            $data = $_POST;
            if (!empty($title)) {
                $data['title'] = $title;
            }
            $data['id'] = $id;
            if (!empty($pic1['name'])) {
                $picInfo1 = $this->upload_pic($pic1, $save_type, 'Uploads/pic/brief/');
                $data['img1'] = $picInfo1[0]['savepath'] . $picInfo1[0]['savename'];
            }
            $model = $this->getActionName();
            $case = M($model);
            // 更新数据
            $list = $case->save($data);
            if (false !== $list) {
                $this->assign('jumpUrl', U("Contactus/"));
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