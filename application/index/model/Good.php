<?php

namespace app\index\model;
use think\Model;
use think\Db;

class Good extends Model
{
	//遍历所有的特产
	public function allGoods()
	{
		return db('goods')->select();
	}
	//特产种类
	public function category()
	{
		return db('goods_category')->select();
	}
	//获取对应种类的特产
	public function getGd($data)
	{
		$id = $data['id'];
		return db('goods')->where('typeid',$id)->select();
	}
	//热销特产
	public function hotGoods()
	{
		return db('goods')->order('buys desc')->limit(5)->select();
	}
	//根据gid查询特产详情
	public function getGoods($id)
	{
		return db('goods')->where('gid',$id)->find();
	}
	//查询购物车所有商品信息
	public function getShopcar()
	{
		//查用户的uid
		$u = db('user')->where('username',session('username'))->field('uid')->find();
		return db('shopcar')->where('uid',$u['uid'])->where('gid','>',0)->select();
	}
	//往购物车添加商品
	public function addShopcar($data)
	{
		//查用户的uid
		$u = db('user')->where('username',session('username'))->field('uid')->find();
		//查要加入购物车的商品所有信息
		$dt = db('goods')->where('gid',$data['gid'])->find();
		//查看该用户的购物车中是否已经有该商品
		$flag = db('shopcar')->where(['uid'=>$u['uid'],'gid'=>$data['gid'] ])->find();
		if($flag){
			//如果购物车中已有该商品,提醒用户直接去购物车操作
			return 3;
		}else{
			//如果购物车中没有该商品,添加该商品
			$datas = ['uid' =>$u['uid'],'gid' =>$dt['gid'],'picture' =>$dt['picture'],'info'=>$dt['name']."&nbsp;&nbsp;".$dt['content'],'price'=>$dt['price'],'num'=>$data['num'],'posts'=>$dt['posts'],'stock'=>$dt['stock'] ]; 

			$datas['time'] = date('Y-m-d H:i:s',time());
			return db('shopcar')->insert($datas); 
		}
	}
	//删除购物车商品
	public function delShopcar($data)
	{
		return db('shopcar')->where('id',$data['id'])->delete();
	}
	//修改购物车商品的数量
	public function updateShopcar($data)
	{
		//查用户的uid
		$u = db('user')->where('username',session('username'))->field('uid')->find();
		$arr = $data['arr'];
		$time = date('Y-m-d H:i:s',time());
		for ($i=0; $i < count($arr); $i++) { 
			db('shopcar')->where('uid',$u['uid'])->where('gid',$i)->update(['num'=>$arr[$i],'time'=>$time]);
		}

	}
	//添加收货人
	public function addPerson($data)
	{
		$person = $data['p1'];
		$tel = $data['p2'];
		$place = $data['p3'];
		//查用户的uid
		$u = db('user')->where('username',session('username'))->field('uid')->find();
		$dt = ['consignee'=>$person,'uid'=>$u['uid'],'address'=>$place,'phone'=>$tel];
		//查地址表中是否已经有该用户
		$flag = db('address')->where('uid',$u['uid'])->field('id')->find();

		if($flag){
			return db('address')->where('id',$flag['id'])->update($dt);
		}else{
			return db('address')->insert($dt);
		}
		// return json_encode($dt);
	}
	//获取收货人信息
	public function getconsigneeInfo()
	{
		//查用户的uid
		$u = db('user')->where('username',session('username'))->field('uid')->find();
		return db('address')->where('uid',$u['uid'])->find();
	}
	//向订单表中插入数据
	public function insertOrder($data)
	{
		$consignee = $data['person'];
		$sum = $data['sum'];
		$posts = $data['posts'];
		$score = $data['score'];
		$discount = $data['discount'];
		$u = db('user')->where('username',session('username'))->field('uid')->find();
		
		if($data['flag'] == 1){

			$gid = '';
			$num = '';
			$data = db('shopcar')->where('uid',$u['uid'])->select();
			foreach ($data as $v) {
				$gid .= $v['gid'].',';
				$num .= $v['num'].',';
			}
			$gid = rtrim($gid,',');
			$num = rtrim($num,',');
			$order = date('YmdHis',time());
			$datas = ['gid'=>$gid,'uid'=>$u['uid'],'oid'=>$order,'num'=>$num,'pst'=>$posts,'score'=>$score,'discount'=>$discount,'sum'=>$sum,'consignee'=>$consignee ];
			return db('goods_order')->insert($datas);
		}
		if($data['flag'] == 2){
			$order = date('YmdHis',time());
			$id = $data['gid'];
			$num = $data['n'];
			$datas = ['gid'=>$id,'uid'=>$u['uid'],'oid'=>$order,'num'=>$num,'pst'=>$posts,'score'=>$score,'discount'=>$discount,'sum'=>$sum,'consignee'=>$consignee ];
			return db('goods_order')->insert($datas);
			
		}
		
	}
	//获取订单信息
	public function getorders()
	{
		$u = db('user')->where('username',session('username'))->field('uid')->find();
		return db('goods_order')->where('uid',$u['uid'])->order('id desc')->limit(1)->find();
	}

	//处理订单
	public function dealOrder($data)
	{
		$code = $data['code'];
		$dt = db('goods_order')->where('oid',$code)->field('id,uid,score')->find();
		$a= db('user')->where('uid',$dt['uid'])->field('score')->find();
		$score = $a['score']+$dt['score'];
		//直接在购物车买
		if($data['flag'] == 1 ){
			//订单改为已付款
			db('goods_order')->where('id',$dt['id'])->update(['status'=>1]);
			//购物车清空
			db('shopcar')->where('uid',$dt['uid'])->delete();
			//用户积分修改
			return db('user')->where('uid',$dt['uid'])->update(['score'=>$score ]);
		}
		//立即购买
		if($data['flag'] == 2 ){
			//订单改为已付款
			db('goods_order')->where('id',$dt['id'])->update(['status'=>1]);
			//用户积分修改
			return db('user')->where('uid',$dt['uid'])->update(['score'=>$score ]);
		}

	}


	public function getTypeInfo()//查询景点地区信息
	{
		return Db::table('tr_goods_type')
    				->limit(20)
					->select();
	}

	


}