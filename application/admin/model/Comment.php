<?php
namespace app\admin\model;//必须和目录一致
use think\Db;
use think\Request;
use think\Image;//引入图片
use think\Model;//引入model类 

class Comment extends Model//不一定非得继承
{
	//table必须带前缀name不需要
	//
	public function getCommentInfo()
	{
		return Db::table('tr_comment c ,tr_user u')
					->where( 'c.uid = u.uid ')
					// -filed(content)
					->select();
					
	}
	//查商品的回复
	public function getGoodsComment()
	{
		

		return Db::table('tr_comment c ,tr_goods g ,tr_user u')
					->where( 'c.gid = g.gid and u.uid=c.uid')
					
					->select();



	}

	public function delCommentInfo($id)//文章回复
	{
			return Db::table('tr_comment')->delete(['id'=>$id]);
			//echo json_encode(1);

			//die;
			//dump($_POST);
	}



	//查询地点
	// public function getPlaceInfo()
	// {
	// 	return Db::table('tr_place')
	// 				->select();//连贯操作		 
	// }
	// // 增加景区地址


	//下架景区
	// public function stopScenery($data)
	// {
	// 	// $id= $data['id'];
	// 	//return db('admin')->where('uid',$id)->update(['status'=>1]);
	// }
	
	
}

