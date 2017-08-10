<?php
namespace app\admin\controller;
use think\Controller;
use think\Request;
use think\Db;//引入数据库操作类
use app\admin\model\Scenery as SceneryModel;//解决重名问题


class Scenery extends Controller
{
    protected $scenery;
    public function _initialize()
    {
        $this->scenery = new SceneryModel();//初始化
    }
    public function scenery_category()
    {
        //return "首页";
        // 调用分配下
        $data = $this->scenery->getSceneryInfo();
        $this->assign('data',$data);
        //dump($data);
        
    	return $this->fetch(); 

    }

    public function scenery_list()
    {
        $data = $this->scenery->getSceneryInfo();

        $this->assign('data',$data);
        //dump($data);
        
    	return $this->fetch();


    }
    public function addSceneryInfo()
    {
        //var_dump($_POST);

        $result =  $this->scenery->addSceneryInfo($_POST);
        
        
    }


    public function scenery_add()
    {
        $data = $this->scenery->getPlaceInfo();
        $this->assign('data',$data);
       
        return $this->fetch();

    } 
   
    public function scenery_category_add()
    {

        return $this->fetch();
        
    }
    
    //下架景区
    // public function stopScenery()
    // {
    //     echo $this->scenery->stopScenery(input());
    // }
     // 增加景区地址
     public function addCategoryInfo()
    {
        $data = $this->scenery->addCategoryInfo($_POST);
        //dump($data);
        $data?$this->success('操作成功！'):$this->error('操作失败！');
    }


    public function delSceneryInfo(){
        //删除旅游景点
       $data = $this ->scenery->delSceneryInfo(input('id'));
       
        if($data){
            echo json_encode(1);
        }else{
            echo json_encode(0);
        }
    }


   

}
