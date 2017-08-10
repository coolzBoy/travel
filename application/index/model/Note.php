<?php
namespace app\index\model;
use think\Model;
use think\Db;

class Note extends Model//不一定非得继承
{

	public function getNoteInfo()
	{
		
    	return Db::table('tr_artcle')
    				// ->limit(5)
					//->select();
					->paginate(4);

					//连贯操作
		 
	}//得到返回index

	public function getNoteContent()
	{
		//dump(input('aid'));
		return Db::table('tr_artcle')
    				->where('aid',input('aid'))
					->find();
	}
	// 返回到note
	
	public function replyInfo()
	{

		$aid=input('aid');
		return Db::table('tr_comment c,tr_user u')
    				->where('c.uid=u.uid and c.cid='.$aid)
					->select();



		// return Db::table('tr_goods_order order,tr_goods goods')
		// 			->where('order.gid = goods.gid')
		// 			->select();
					
	}


	public function addReplyInfo()
    {

    	$u = db('user')->where('username',session('username'))->field('uid')->find();
		if (!empty($_POST['reply'])) {

			$data['content'] = $_POST['reply'];
			$data['cid'] = $_POST['aid'];
			$data['uid'] = $u['uid'];
			$data['time'] = date('Y-m-d m:i:s');
			//dump($data);
			//die;	
			return Db::table('tr_comment')
							
					->insert($data);
		}
    }
    // 发表回复
}
