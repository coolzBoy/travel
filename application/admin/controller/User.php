<?php
namespace app\admin\controller;
use think\Controller;
use think\Request;
use think\Db;//引入数据库操作类
use app\admin\model\User as UserModel;//解决重名问题


class  User extends Controller
{
    protected $user;
    public function _initialize()
    {
        $this->user = new UserModel();//初始化
    }
    public function user_list()//会员列表
    {

        $data = $this->user->getUserInfo();
        //dump($data);
        //die;
        $this->assign('data',$data);
       
        return $this->fetch(); 
    }
    public function user_grade()//会员等级
    {
        $data = $this->user->getGradeInfo();
        //dump($data);
        //die;
        $this->assign('data',$data);
        return $this->fetch(); 
    }
    public function user_show()//展示用户信息
    {
        $data = $this->user->getShowInfo(input());
        //dump($data);
        //die;
        $this->assign('data',$data);
        return $this->fetch();
    }
    public function list_show()//展示list用户信息
    {
        $data = $this->user->getListShow(input());
        //dump($data);
        //die;
        $this->assign('data',$data);
        return $this->fetch();
    }

    //删除会员方法
    public function delUserInfo()
    {
        return $this->user->deluserinfo(input());
    }


    	

}
