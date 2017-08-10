<?php

namespace app\index\controller;
use think\Controller;
use think\Db;//引入数据库操作类
use app\index\model\User as UserModel;

class Travel extends Controller
{
    protected $user;
    // 初始化model对象 
    public function _initialize()
    {
        $this->user = new UserModel();
    }

    //加载行程导航页面
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
    	return $this->fetch();

    }

}