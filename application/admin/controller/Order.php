<?php

namespace app\admin\controller;
use think\Controller;
use think\Db;//引入数据库操作类
use app\admin\model\Gorder;

class Order extends Controller
{
	protected $order;
	public function _initialize()
    {
        $this->order = new Gorder();
    }
    //订单列表页面
	public function order_list()
	{
		$data = $this->order->getOrders();
		$sum = count($data);

		return $this->fetch('',['data' =>$data,'sum'=>$sum]);
	}
	//订单详情页面
	public function order_detail()
	{
		$data = $this->order->getGoods(input());
		$user = $this->order->getUser(input());
		$detail = $this->order->detail(input());
		$consignee = $this->order->getAddress(input());

		return $this->fetch('',['data'=>$data,'user'=>$user,'detail'=>$detail,'consignee'=>$consignee]);
	}
	//修改发货状态
	public function upOrder()
	{
		echo $this->order->upOrder(input());
	}
	//删除订单
	public function delOrder()
	{
		echo $this->order->delOrder(input());
	}




}