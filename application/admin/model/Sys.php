<?php

namespace app\admin\model;
use think\Model;
use think\Db;

class Sys extends Model
{
	//系统日志添加用户登录数据
	public function insertLog($u,$info)
	{
		$ip = $_SERVER['REMOTE_ADDR'];
		if($ip == '::1'){
			$ip = '127.0.0.1';
		}
		$ip = ip2long($ip);
		$data = ['username'=>$u,'content'=>$info,'ip'=>$ip];
		db('log')->insert($data);
	}
	//获取日志信息
	public function getLogs()
	{
		return db('log')->select();
	}
	//删除日志
	public function delLog($data)
	{
		return db('log')->where('id',$data['id'])->delete();
	}
	//订单统计
	public function order_sums()
	{
		$sum = 0;
		$data1 = db('goods_order')->where('post=1 and status=1')->field('oid')->select();
		$data2 = db('goods_order')->where('post',0)->field('oid')->select();
		$data3 = db('goods_order')->where('status',1)->field('oid')->select();
		$data4 = db('goods_order')->where('status',0)->field('oid')->select();
		$data5 = db('goods_order')->where('post',1)->field('oid')->select();
		$data6 = db('goods_order')->where('post',1)->field('sum')->select();
		foreach ($data6 as $v) {
			$sum+=$v['sum'];
		}
		return [$data1,$data2,$data3,$data4,$data5,$sum];

	}
}
