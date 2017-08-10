<?php

namespace app\index\controller;
use think\Controller;
use think\Db;//引入数据库操作类
use app\index\model\User as UserModel;
use app\index\model\Note as NoteModel;

class Strategy extends Controller
{
    protected $user;
    protected $note;
    // 初始化model对象 
    public function _initialize()
    {
        $this->user = new UserModel();
        $this->note = new NoteModel();
    }

    //加载旅游攻略页面
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
        // 查询攻略信息
        $data = $this->note->getNoteInfo();
        
        $page = $data->render();
        $this->assign('page',$page);

        $this->assign('u',$u);
        $this->assign('flag',$flag); 
        $this->assign('data',$data);
        //dump($data);
        //加载html页面
    	return $this->fetch();

    }
    public function note()
    {
        if (preg_match('/^\d/',session('username'))){
            $flag = false;
            $u = $this->user->getUser($flag,session('username'));
        }else{
            $flag = true;
            $u = $this->user->getUser($flag,session('username'));
        }
        $data = $this->note->getNoteContent();
        $this->assign('u',$u);
        $this->assign('flag',$flag); 
        // 头部需要
        $reply = $this->note->replyinfo();//回复用
       //dump($data);
        $this->assign('data',$data);
         $this->assign('reply',$reply);
       //dump($reply);
        return $this->fetch();
        
    }

    // 发表评论
    

    public function addReplyInfo()
    {
         $id = input('aid');
         $addreplyinfo = $this->note->addreplyinfo();
         
         $this->success('回复成功！',"index/strategy/note?aid=".$id);

         $addreplyinfo?$this->success('操作成功！',"index/strategy/note?aid=".$id):$this->error('操作失败！',"index/strategy/note?aid=".$id);
        
    }


}