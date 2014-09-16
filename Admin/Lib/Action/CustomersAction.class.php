<?php

class CustomersAction extends CommonAction {

    public function insert() {
        $name = $_REQUEST['name'];
        $pic = $_FILES['logo'];
        $save_type = 'jpg,png,jpeg,BMP,bmp';
        if (!empty($name) && !empty($pic['name'])) {
            // 创建数据对象
            $model = $this->getActionName();
            $case = M($model);
            $data = $_POST;
            $picInfo = $this->upload_pic($pic, $save_type, 'Uploads/pic/customers/');
            $data['logo'] = $picInfo[0]['savepath'] . $picInfo[0]['savename'];
            if(strpos($_POST['url'], 'http://') === false){
                $data['url'] = 'http://' . trim($_POST['url']);
            }
            $data['created'] = time();
            $result = $case->add($data);
            // 写入帐号数据
            if ($result) {
                $this->assign('jumpUrl', U("Customers/"));
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
        $name = $_REQUEST['name'];
        $pic = $_FILES['logo'];
        $save_type = 'jpg,png,jpeg,BMP,bmp';
        if (!empty($id)) {
            $data = $_POST;
            if (!empty($name)) {
                $data['name'] = $name;
            }
            if (!empty($pic['name'])) {
                $picInfo = $this->upload_pic($pic, $save_type, 'Uploads/pic/customers/');
                $data['logo'] = $picInfo[0]['savepath'] . $picInfo[0]['savename'];
            }
            if(strpos($_POST['url'], 'http://') === false){
                $data['url'] = 'http://' . trim($_POST['url']);
            }
            $data['id'] = $id;
            $model = $this->getActionName();
            $case = M($model);
            // 更新数据
            $list = $case->save($data);
            if (false !== $list) {
                $this->assign('jumpUrl', U("Customers/"));
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