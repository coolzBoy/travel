<?php

namespace app\admin\model;
use think\Model;
use think\Db;

class Gorder extends Model
{
	//查所有的订单
	public function getOrders()
	{
		return Db::table('tr_goods_order o,tr_user u,tr_address a')->where('u.uid=o.uid and o.uid=a.uid')->field('o.id,o.oid,o.sum,o.status,o.post,o.consignee,o.time,u.username,a.phone')->select();
	}
	//根据订单ID查购买的商品
	public function getGoods($data)
	{
		$id = $data['id'];
		$dt = db('goods_order')->where('id',$id)->field('gid,num')->find();
		$arr1 = explode(',',$dt['gid']);
		$arr2 = explode(',',$dt['num']);
		foreach($arr1 as $k=>$v)
		{
			$arr[] = db('goods')->where('gid',$v)->field('name,place,price,picture')->find();
		}
		return [$arr,$arr2];
	}
	//根据订单ID查购买的商品
	public function getUser($data)
	{
		$id = $data['id'];
		$dt = db('goods_order')->where('id',$id)->field('uid')->find();
		return db('user')->where('uid',$dt['uid'])->field('username,phone,email,city')->find();
	}
	//根据订单ID查订单详情
	public function detail($data)
	{
		$id = $data['id'];
		return db('goods_order')->where('id',$id)->field('oid,time,discount,pst,sum')->find();
	}
	//根据订单ID查收货人信息
	public function getAddress($data)
	{
		$id = $data['id'];
		$dt = db('goods_order')->where('id',$id)->field('uid')->find();
		return db('address')->where('uid',$dt['uid'])->find();
	}
	//修改发货状态
	public function upOrder($data)
	{
		$id = $data['id'];
		return db('goods_order')->where('id',$id)->update(['post'=>1]);
	}
	//删除订单
	public function delOrder($data)
	{
		$id = $data['id'];
		return db('goods_order')->where('id',$id)->delete();
	}




}