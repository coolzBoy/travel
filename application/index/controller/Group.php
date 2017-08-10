<?php
namespace app\index\controller;
use think\Controller;
use think\Db;//引入数据库操作类
use extend\chepiao100\ChePiao100;
use app\index\model\User as UserModel;
use app\index\model\Cp;
class Group extends Controller
{
    protected $user;
    protected $cp;
    // 初始化model对象 
    public function _initialize()
    {
        $this->user = new UserModel();

       $this->cp = new ChePiao100();
    }

    //加载旅游团购页面
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

        if (!empty($_GET)) {

            if ( $_GET['startStation'] && $_GET['arriveStation'] && $_GET['date'])
            {
            
            $data = $this->cp->getData('yupiao', $_GET);
            }
            //dump($data);  
         $this->assign('data',$data);
        }
        //加载html页面
        
    	return $this->fetch();

    }
    //获得机票
    public function jipiao()
    {
        if (!empty($_GET)){

            if ( $_GET['departureAirport'] && $_GET['arrivalAirport'] && $_GET['date'])
            {
                
                
                $data = $this->cp->getData('jipiao', $_GET);
            }
            //dump($data);

        $this->assign('data',$data);
        }
        return $this->fetch();    
    }
    //汽车票
    public function qichepiao()
    {
        if (!empty($_GET)){

            if ( $_GET['startStation'] && $_GET['arriveStation'])
            {
                
                $data = $this->cp->getData('qichepiao', $_GET);
            }
            //dump($data);
            $this->assign('data',$data);

        }
         return $this->fetch();  
    }
    //查询车次
    
}
