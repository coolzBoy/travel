<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class Note extends Model//不一定非得继承
{

	public function getNoteInfo()
	{
		
    	return Db::table('tr_artcle')
    				->limit(20)
					->select();//连贯操作
		 
	}

	// public function delNote($id)//删除景点
	// {
	// return Db::table('tr_artcle')->delete(['aid'=>$id]);
			
	// }
	
}
