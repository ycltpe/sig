<?php

// 站点配置
class SettingAction extends CommonAction {

    public function index() {
        $model = $this->getActionName();
        $vo = M($model)->getById(1);
        $this->assign('v', $vo);
        $this->display();
    }

    public function edit() {
        $model = $this->getActionName();
        $id = $_REQUEST ['id'];
        $vo = M($model)->getById(1);
        $this->assign('v', $vo);
        $this->display();
    }

    public function update() {
        $id = $_REQUEST['id'];
        $logo = $_FILES['logo'];
        $wechat_img = $_FILES['wechat_img'];
        $weibo_img = $_FILES['weibo_img'];
        $save_type = 'jpg,png,jpeg,BMP,bmp';
        if (!empty($id)) {
            $data = $_REQUEST;
            if (!empty($logo['name'])) {
                $logo_info = $this->upload_pic($logo, $save_type, 'Uploads/setting');
                $data['logo'] = $logo_info[0]['savepath'] . $logo_info[0]['savename'];
            }
            if (!empty($wechat_img['name'])) {
                $wechat_img_info = $this->upload_pic($wechat_img, $save_type, 'Uploads/setting');
                $data['wechat_img'] = $wechat_img_info[0]['savepath'] . $wechat_img_info[0]['savename'];
            }
            if (!empty($weibo_img['name'])) {
                $weibo_img_info = $this->upload_pic($weibo_img, $save_type, 'Uploads/setting/');
                $data['weibo_img'] = $weibo_img_info[0]['savepath'] . $weibo_img_info[0]['savename'];
            }
            $data['id'] = $id;
            $model = M('Setting');
            // 更新数据
            $list = $model->save($data);
            if (false !== $list) {
                $this->assign('jumpUrl', U("Setting/"));
                $this->success('编辑成功!');
            } else {
                //错误提示
                $this->error('编辑失败!');
            }
        } else {
            //错误提示
            $this->error('请将表单填写完整!');
        }
    }

}

?>