<?php

class BriefAction extends CommonAction {

    public function index() {
        $name = $this->getActionName();
        $model = M($name);
        $vo = $model->getById(1);
        $this->assign('vo', $vo);
        $this->display();
    }

    public function update() {
        $id = $_REQUEST['id'];
        $pic = $_FILES['img'];
        $pic1 = $_FILES['img1'];
        $save_type = 'jpg,png,jpeg,BMP,bmp';
        if (!empty($id)) {
            $data = $_POST;
            if (!empty($title)) {
                $data['title'] = $title;
            }
            if (!empty($pic['name'])) {
                $picInfo = $this->upload_pic($pic, $save_type, 'Uploads/pic/brief/');
                $data['img'] = $picInfo[0]['savepath'] . $picInfo[0]['savename'];
            }
            if (!empty($pic1['name'])) {
                $picInfo1 = $this->upload_pic($pic1, $save_type, 'Uploads/pic/brief/');
                $data['img1'] = $picInfo1[0]['savepath'] . $picInfo1[0]['savename'];
            }
            $data['id'] = $id;
            $model = $this->getActionName();
            $case = M($model);
            // 更新数据
            $list = $case->save($data);
            if (false !== $list) {
                $this->assign('jumpUrl', U("Brief/"));
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