<?php
namespace app\index\model;
use think\Model;
use think\Db;

class Scenery extends Model//不一定非得继承
{

	public function getPlaceInfo()//查询景点地区信息
	{
		return Db::table('tr_place')
    				->limit(20)
					->select();
	}

	// public function getSceneryInfo($id)
	// {
		
 	//   	return Db::table('tr_scenery')
 	//    				->limit(20)
 	//    				->where('sid',"$id")
	// 				->select();//连贯操作
	// 	// var_dump($data);	 
	// }
	
	public function getScenicInfo()//景点详情介绍
	{
		$sid = intval(input('sid'));
		//dump($sid);
    	return Db::table('tr_scenery')
    				
    				->where('sid',"$sid")
					->select();//连贯操作
		// var_dump($data);	 
	}

	// 查询景点
	public function getScenery()
	{
		return Db::table('tr_scenery')
    				// ->limit(20)
					->paginate(15);
	}

	public function recommendScennic()
	{
		return Db::table('tr_scenery')
    				->limit(3)
					->select();
	}
	public function submit_orders($data)
	{
		$id= $data['sid']; 
		return  Db::table('tr_scenery')->where('sid',$id)->find();
                 
          
	}
	
	
}