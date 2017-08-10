<?php

namespace app\index\controller;
use think\Controller;
use think\Db;//引入数据库操作类
use app\index\model\User as UserModel;//引入用户表model
use app\index\model\Good;

class Goods extends Controller
{
    protected $user;
    protected $goods;

    // 初始化model对象 
    public function _initialize()
    {
        $this->user = new UserModel();
        $this->goods = new Good();
    }

    //加载地方特产页面
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

        //获取所有特产种类
        $data1 = $this->goods->category(); 
        $data2 = $this->goods->allGoods(); 
       
        //加载html页面
    	return $this->fetch('',['data1'=>$data1,'data2'=>$data2]);

    }
    //特产详情页面
    public function detail()
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
        //根据gid获取某个特产的所有信息
        $data = $this->goods->getGoods(input('gid'));
        $hot = $this->goods->hotGoods();
        
        //加载html页面
        return $this->fetch('detail',['data' =>$data,'hot'=>$hot]);
    }

    //找对应特产
    public function getGd()
    {
        return json_encode($this->goods->getGd(input()));
    }
    //购物车页面
    public function shop_car()
    {
        //直接点击购物车按钮
        if(input('flag') == 1){
            if(empty(session('username'))){
                $this->error('请先登录！','index/user/login');
            }else{
                $data = $this->goods->getShopcar();
                $flag = true;
            }
        }
        //点击立即购买按钮
        if(input('flag') == 2){
            if(empty(session('username'))){
                $this->error('请先登录！','index/user/login');
            }else{
                
                $data = $this->goods->getGoods(input('gid'));
                $data['time'] = date('Y-m-d H:i:s',time());
                $data['num'] = input('num');
                $flag = false;
            }
        }
        return $this->fetch('',['data'=>$data,'flag'=>$flag]);
    }
    
    //点击加入购物车按钮
    public function add_car()
    {
        if(empty(session('username'))){
            echo 2;
        }else{ 
            echo $this->goods->addShopcar(input());
        }
    }
    //删除购物车的商品
    public function del_goods()
    {
        echo $this->goods->delShopcar(input());
    }
    //商品订单
    public function shopInfo()
    {
        if(input('flag') == 1){
            $this->goods->updateShopcar(input());
        }
        if(input('flag') == 2){
            $id = input('gid');
            return $this->goods->getGoods($id);
        }
        
    }
     //获取购物车的商品
    public function shopcars()
    {
        return json_encode($this->goods->getShopcar());
    }
    //添加收货人
    public function addPerson()
    {
        // echo json_encode(input());
        echo $this->goods->addPerson(input());
    }
    //获取收货人信息
    public function consigneeInfo()
    {
        echo json_encode($this->goods->getconsigneeInfo());
    }
    //处理订单
    public function order()
    {
        echo $this->goods->insertOrder(input());
    }
    //获取订单表信息
    public function getOrder()
    {
        return json_encode($this->goods->getorders());
    }
    //处理订单
    public function deal()
    {
        echo $this->goods->dealOrder(input());
    }


     function getGoodsInfo(){

        $data =  Db::table('tr_goods')
                 ->limit(20)
                 ->where('gid',input('id'))
                 ->select();

        file_put_contents('test.txt', json_encode($data));
       
     return json_encode($data);
    
 }
}
