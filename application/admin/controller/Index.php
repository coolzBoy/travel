<?php

namespace app\admin\controller;
use think\Controller;
use think\Db;//引入数据库操作类
use app\admin\model\Admins;
use app\admin\model\Sys;

class Index extends Controller
{
    protected $user;
	protected $sys;
	public function _initialize()
    {
        $this->user = new Admins();
        $this->sys = new Sys();
    }
    public function index()
    {
    	//加载html页面
    	return $this->fetch();
    }
    
    //加载后台主页
    public function main()
    {
        /*$data = $this->user->allAccess();
        $this->assign('data',$data);*/
        // dump($data);die;
        
    	return $this->fetch();
    }
    //登录验证
    public function login()
    {
       if(!captcha_check(input('code'))){
            $this->error('验证码不正确！');
        }else{
            $result = $this->user->checkUser(input());
            switch ($result) {
                case 1 :session('admin',input('username'));
                $this->sys->insertLog(input('username'),'登录成功！');
                $this->success('登录成功！','admin/index/main');break;

                case 2 :$this->error('密码不正确！');break;
                case 3 :$this->error('账号不存在！');break;
                case 4 :$this->error('你的账号被超管禁用了，请尽快联系超管！');break;
            }
        }
    }
    public function logOut()
    {
    	session('admin','');
    	$this->success('退出成功！','admin/index/index');
    }
    
}
