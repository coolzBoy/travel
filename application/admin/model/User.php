<?php

namespace app\admin\model;
use think\Model;
use think\Db;

class User extends Model
{
	
	public function getUserInfo()
	{
		return Db::table('tr_user')
					
					->select();
					
	}
	// 删除会员
	public function delUserInfo($data)
	{

		$id= $data['id'];

		return db('user')->where('uid',$id)->delete();
		
	}
	//查询浏览记录
	public function getGradeInfo()
	{
		return Db::table('tr_user')
					
					->select();
	}
	//个人展示页面
	public function getShowInfo($data)
	{
		$uid= $data['uid'];
		return Db::table('tr_user')
					->where('uid',$uid)
					->find();
					
	}

	//list页面个人展示
	public function getListShow($data)
	{
		$uid= $data['uid'];
		return Db::table('tr_user')
					->where('uid',$uid)
					->find();
					
	}


	

}