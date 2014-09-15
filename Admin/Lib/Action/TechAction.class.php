<?php

class TechAction extends CommonAction {

    public function index() {
        $name = $this->getActionName();
        $model = M($name);
        $vo = $model->getById(1);
        $this->assign('vo', $vo);
        $this->display();
    }

    public function update() {
        $id = $_REQUEST['id'];
        $title = $_REQUEST['title'];
        $pic = $_FILES['techbg'];
        $save_type = 'jpg,png,jpeg,BMP,bmp';
        if (!empty($id)) {
            $data = $_POST;
            if (!empty($title)) {
                $data['title'] = $title;
            }
            if (!empty($pic['name'])) {
                $picInfo = $this->upload_pic($pic, $save_type, 'Uploads/pic/tech/');
                $data['techbg'] = $picInfo[0]['savepath'] . $picInfo[0]['savename'];
            }
            $data['id'] = $id;
            $model = $this->getActionName();
            $case = M($model);
            // 更新数据
            $list = $case->save($data);
            if (false !== $list) {
                $this->assign('jumpUrl', U("Tech/"));
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