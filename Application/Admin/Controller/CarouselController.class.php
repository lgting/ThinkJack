<?php
namespace Admin\Controller;
use Admin\Controller;

class CarouselController extends BaseController{
    public function __construct(){
        parent::__construct();
        $this->model = D('carousel');
    }
    public function add(){
        if(IS_POST){
            $Validate = $this->model->create();
            if($Validate){
                $uploadImage = $this->uploadImage('image/',2000000);
                $image = $uploadImage->uploadOne($_FILES['path']);
                if($image){
                    $Validate['path'] = '/Public/upload/'.$image['savepath'].$image['savename'];
                    if($this->model->add($Validate)){
                        $this->success('添加成功',U('index'));
                    }else{
                        $this->error('添加失败');
                    }
                }else{
                    $this->error($uploadImage->getError());
                }
            }else{
                $this->error($this->model->getError());
            }
        }else{
            $this->display();
        }
    }

    public function delete($id){
        $item = $this->model->find($id);
        unlink(BASE_PATH.$item['path']);
        $this->model->delete($id);
        return $this->success('删除成功',U('index'));
    }

    public function update(){
        if(IS_POST){
            $Validate = $this->model;
            if($Validate->create()){
                if(!empty($_FILES['path']['name'])){
                    $uploadImage = $this->uploadImage('image/',2000000);
                    $image = $uploadImage->uploadOne($_FILES['path']);
                    if($image){
                        $Validate->path = '/Public/upload/'.$image['savepath'].$image['savename'];
                    }else{
                        $this->error($uploadImage->getError());
                    }
                }
                if($Validate->save()){
                    $this->success('修改成功',U('index'));
                }else{
                    $this->error('修改失败');
                }
            }else{
                $this->error($this->model->getError());
            }
        }else{
            $this->assign('carousel',$this->model->find(I('id')));
            $this->display();
        }
    }

    public function index(){
        $count = $this->model->count();
        $Page = new \Extend\Page($count,15);
        $carousels = $this->model->limit($Page->firstRow.','.$Page->ListRows)->order('sort desc')->select();
        $this->assign('carousels',$carousels);
        $this->assign('page',$Page->show());
        $this->display();
    }
}