<?php
namespace Admin\Controller;
use Think\Controller;

class BaseController extends Controller {
    public function _initialize(){
        $sid = session('adminId');
        //判断用户是否登陆
        if(!isset($sid ) ) {
            redirect(U('Login/index'));
        }

    }

    public function uploadImage($path='image/',$maxSize=1000000){
        $uploader = new \Think\Upload();
        $uploader->maxSize = $maxSize;
        $uploader->exts = array('png','jpeg','jpg','gif');
        $uploader->rootPath = BASE_PATH.'/Public/upload/';
        $uploader->savePath = $path;
        return $uploader;
    }

}