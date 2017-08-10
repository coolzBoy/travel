<?php
namespace app\index\model;
use think\Model;
use think\Db;

class Index extends Model//不一定非得继承
{


	public function getBannerInfo()
	{

		return Db::table('tr_banner')
    				
    				->limit(4)

					->select();

	}
	public function getSceneryIndex()
	{
		return Db::table('tr_scenery')
    				
    				->limit(5)
    				->order('sid desc')
					->select();
	}

	public function getSceneryIndex2()
	{
		return Db::table('tr_scenery')
    				
    				->limit(5)
    				
					->select();
	}
	public function getArtcleInfo()
	{

		return Db::table('tr_artcle a ,tr_user u')
    				->where('a.author = u.username')
    				->limit(4)
    				
					->select();
	}



}




