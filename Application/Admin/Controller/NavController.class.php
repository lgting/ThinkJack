<?php
namespace Admin\Controller;
use Admin\Controller;

class NavController extends BaseController{
    public function add(){
        if(!IS_POST){
            $navs = D('nav')->order('sort desc')->select();
            $navs = getSortedCategory($navs);
            $this->assign('navs',$navs);
            $this->display();
        }
        else{
            $Nav = D('nav');
            if($Nav->create()){
                if($Nav->add())
                    $this->success('添加成功',U('index'));
                else
                    $this->error('添加失败');
            }
            else{
                $this->error($Nav->getError());
            }
        }
    }

    public function delete($id){
        $childrens = D('nav')->where('pid='.$id)->select();
        if($childrens)
            $this->error('不能删除带有子类的导航');
        if(D('nav')->delete($id))
            $this->success('删除成功',U('index'));
        else
            $this->error('删除失败');
    }

    public function update(){
        if(IS_POST){
            $Nav = D('nav');
            if($Nav->create()){
                if($Nav->save())
                    $this->success('修改成功',U('index'));
                else
                    $this->error('修改失败');
            }else{
                $this->error($Nav->getError());
            }
        }else{
            $nav = D('nav')->find(I('id'));
            $navs = getSortedCategory(D('nav')->select());
            $this->assign('nav',$nav);
            $this->assign('navs',$navs);
            $this->display();
        }
    }

    public function index(){
        $navs = D('nav')->select();
        $navs = getSortedCategory($navs);
        $this->assign('navs',$navs);
        $this->display();
    }
}