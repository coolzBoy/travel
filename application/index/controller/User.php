<?php

namespace app\index\controller;

use extend\alidayu\AlibabaAliqinFcSmsNumSendRequest;
use extend\alidayu\TopClient;
use extend\threelogin\openLogin;
use think\Controller;
//解决重名
use app\index\model\User as UserModel;

class User extends Controller
{
	protected $user;
	public function _initialize()
	{
		$this->user = new UserModel();
	}

	public function getUserInfo()
	{
		$data = $this->user->userList();
		dump($data);
	}

    //加载登录界面
    public function login()
    {
        return $this->fetch();
    }
    //加载注册界面register
    public function register()
    {
        return $this->fetch();
    }

    //验证注册
    public function doReg()
    {
        if(session('code') != $_GET['cd']){
            $this->error('手机验证码不正确！');
        }else{
             $result = $this->user->insertUser($_GET);
            // dump($result);die;
            if($result == 1){
                session('username',$_GET['u']);
                session('code','');
                $this->success('首次注册成功，+20积分！','index/index/index');
            }else if($result == 2){
                $this->error('注册失败,该手机号已经被注册！');
            }else if($result == 3){
                $this->error('注册失败,该用户名已经被注册！');
            }else{
                 $this->error('注册失败,插入数据库出错！');
            }
            
        }
      
    }
    //普通登录验证
    public function doLogin()
    {
        // dump(input());
        $result = $this->user->checkUser(input());
        // dump($result);die;
        switch ( $result) {
            case '0': $this->error('该用户名不存在！');break;
            case '1': $this->error('密码不正确！');break;
            default: session('username',$result);$this->success('登录成功！','index/index/index');break;
        }
    }

    //手机号动态登录验证
    public function dophoneLogin()
    {
        $phone = input('phone-num');
        if(session('code') != input('password')){
            $this->error('手机验证码不正确！');
        }else{
            session('username',$phone);
            session('code','');
            $this->success('登录成功！','index/index/index');
        }
        
    }
 
    //用户退出
    public function loginOut()
    {
        session('username',null);
        $this->success('退出成功','index/index/index');
    }
    //向手机号发送验证码
	public function sendSMS()
    {
        if (request()->isAjax()) {//如果是ajax请求
            $tel = input('mobile');//手机号
                            
            $c = new TopClient;//大于客户端  
            $c->format = 'json';//设置返回值得类型
 
            $c->appkey = "24545440";//阿里大于注册时给的应用appkey
            $c->secretKey = "03c3135289af1cb41182b1063064a647";//注册的app secretkey，修改成自己的
                                                                
            //请求对象，需要配置请求的参数  
            $req = new AlibabaAliqinFcSmsNumSendRequest;
            $req->setExtend("123456");//公共回传参数，可以不传
            $req->setSmsType("normal");//短信类型，传入值请填写normal
             
            //签名，阿里大于-控制中心-验证码--配置签名 中配置的签名，必须填
            $req->setSmsFreeSignName("中国梦想游");//根据前面配置短信签名里的前面做相应的修改
             
            //你在短信中显示的验证码，这个要保存下来用于验证
            $num = rand(100000,999999);
            session('code',$num);//保存到session
 
            //短信模板变量，传参规则{"key":"value"}，key的名字须和申请模板中的变量名一致，
           //传参时需传入{"code":"1234","product":"alidayu"}
           
            $req->setSmsParam("{\"number\":\"$num\"}");
            //模板参数
                                                        
            //短信接收的手机号码，可以有多个，具体参照大于号帮助文档。
            $req->setRecNum($tel);
 
            //短信模板。阿里大于-控制中心-验证码--配置短信模板 必须填
            $req->setSmsTemplateCode("SMS_77805044");//根据前面配置模板是生成的模板ID修改
            $resp = $c->execute($req);//发送请求
            return $resp;
        } 
    }

    //三方登录处理
    public function callback()
    {
        $open = new openLogin();
        $code = input('code');
        $data = $open->me($code);
        $u = $this->user->insertThree($data);
        if($u){
            session('username',$data['name']);
            $this->success('登录成功！','index/index/index');
        }else{
            $this->error('登录失败！');
        }
       
    }





}