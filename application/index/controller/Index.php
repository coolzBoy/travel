<?php

namespace app\index\controller;
use think\Controller;
use think\Db;//引入数据库操作类
use app\index\model\User as UserModel;
use app\index\model\Index as IndexModel;

use app\index\model\Scenery as SceneryModel;

class Index extends Controller
{
    protected $user;
    protected $scenery;
    protected $index;

    public function _initialize()
    {
        $this->user = new UserModel();
        $this->scenery= new SceneryModel();
        $this->index= new IndexModel();
    }

    //加载首页
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
       



        // banner图
        $banner = $this->index->getBannerInfo();
        $this->assign('banner',$banner);
        //dump($banner);
        //dump($data);
        // 景区
        $scenery = $this->index->getSceneryIndex();
        $this->assign('scenery',$scenery);
        
        $scenery2 = $this->index->getSceneryIndex2();
        $this->assign('scenery2',$scenery2);



        $artcle = $this->index->getArtcleInfo();
        $this->assign('artcle',$artcle);

        //dump($artcle);





    	return $this->fetch();

        
    }







    
}
