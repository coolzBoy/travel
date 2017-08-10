<?php
namespace app\index\controller;
use think\Controller;
use think\Db;//引入数据库操作类
use app\index\model\User as UserModel;
use app\index\model\Scenery as SceneryModel;

class Scenery extends Controller
{
    protected $user;
    protected $scenery;
   

    // 初始化model对象 
    public function _initialize()
    {
        $this->user = new UserModel();
        $this->scenery = new SceneryModel();

    }


    //加载旅游景点页面
    public function index()
    {
    	//判断是否是手机号动态登录
        if (preg_match('/^\d/',session('username'))){
            $flag = false;
            $u = $this->user->getUser($flag,session('username'));
        }else{
            $flag = true;
            $u = $this->user->getUser($flag,session('username'));
        }
        $this->assign('u',$u);
        $this->assign('flag',$flag); 
        //加载html页面
        $place = $this ->scenery->getPlaceInfo();
        $data1 = $this ->scenery->getScenery();
        // 分配page
        $page = $data1->render();
        $this->assign('page',$page);

        $this->assign('place',$place);
        $this->assign('data1',$data1);
        //dump($data1);
    	return $this->fetch();
    }

    public function scenic()
    {
        //判断是否是手机号动态登录
        if (preg_match('/^\d/',session('username'))){
            $flag = false;
            $u = $this->user->getUser($flag,session('username'));
        }else{
            $flag = true;
            $u = $this->user->getUser($flag,session('username'));
        }
        $this->assign('u',$u);
        $this->assign('flag',$flag); 
        // 景点
        $data = $this ->scenery->getScenicInfo();
        //推荐景点
        $recommend= $this ->scenery->recommendScennic();


        $this->assign('data',$data);
        $this->assign('recommend',$recommend);
        //dump($recommend);
        return $this->fetch();
    }

    function getSceneryInfo(){

        $data =  Db::table('tr_scenery')
                 ->limit(20)
                 ->where('placeid',input('id'))
                 ->select();

        //file_put_contents('test.txt', json_encode($data));
       //    $data = $this ->scenery->getSceneryInfo(input('id'));

      //$this->assign('data',$data);
       // // return $this->fetch();
    
     return json_encode($data);



    }

    public function submit_orders()
    {

        $data = $this ->scenery->submit_orders(input());
        // 分配page
        //dump($data);
        // die;
        $this->assign('data',$data);
         return $this->fetch();

    }
    public function confirm_order()
    {

        $data = $this ->scenery->submit_orders(input());
        // 分配page
        //dump($data);
        // die;
        $this->assign('data',$data);
         return $this->fetch();

    }


}




    