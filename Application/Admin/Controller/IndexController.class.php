<?php
namespace Admin\Controller;
use Admin\Controller;

class IndexController extends BaseController{

    public function index(){
        $this->display();
    }

    public function clean_cache(){
        deldir(BASE_PATH.'/Application/Runtime/');
        $this->success('缓存清除成功',U('index'));
    }
}
