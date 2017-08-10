<?php
namespace app\index\model;
use think\Model;
use think\Db;

class UserInfo extends Model//不一定非得继承
{



	public function getMyInfo()
	{
		return Db::table('tr_user')->where('username',session('username'))->find();
	}



	public function getUserInfo()
	{
		
		
    	return Db::table('tr_artcle')
    				->where('author',session('username'))
    				->limit(4)
					->select();//连贯操作


	}
	// 查回复
	public function  getReplyInfo()
	{
		// return Db::table('tr_artcle a, tr_commit c ,tr_user u')

  //   				->where('a.aid = c.cid and ')
  //   				->limit(4)
		// 			->select();
	}


	public function addUserInfo()//写游记并且上传图片
	{
        if(!empty($_FILES)){

            $file = request()->file('fpicture');
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
            if($info){
                // 成功上传后 获取上传信息
                // 输出 jpg
                //echo $info->getExtension();
                // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
                $info = str_replace('\\','/',$info->getSaveName());
                // 输出 42a79759f284b767dfcb2a0197904287.jpg
                //echo $info->getFilename(); 
            }else{
                // 上传失败获取错误信息
                echo $file->getError();
            }

        }
		if(!empty($_POST)){
			$data['title'] = $_POST['title'];
			$data['note'] = $_POST['note'];
			$data['content'] = $_POST['content'];
			$data['author'] = session('username');
			$data['picture'] = $info;

			//dump($data);	
			return Db::table('tr_artcle')
						
					    ->insert($data);
						
		}	
	
	}
	
	public function getCollecInfo()
	{
		return Db::table('tr_artcle aid,tr_collect cid')
		->where('cid=aid')
		// ->where('blog.typeid=type.id')
		// ->field('blog.id as id,blog.title,blog.content,type.typename as type')
		// ->order('blog.id desc')
		->limit(5)
		->select();

		//dump($data);

	}
	public function getgoodsOrderInfo()
	{
		
		$u = db('user')->where('username',session('username'))->field('uid')->find();
		// /dump($u);


		return Db::table('tr_goods_order')
					->where('uid',$u['uid'])
					->select();

	}
	public function delUserInfo($id)//删除游记
	{
		return Db::table('tr_artcle')->delete(['aid'=>$id]);
		//echo json_encode();
		//dump($_POST);
	}

	// 提交个人信息
	public function getHeadinfo()
	{
		return Db::table('tr_user')
	    ->where('username',session('username'))
	    ->select();
	}
	// 上传头像
	public function addMyInfo()
	{
	 	if(!empty($_FILES)){

	        $file = request()->file('picture');
	            // 移动到框架应用根目录/public/uploads/ 目录下
	        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
	        if($info){
	            $info = str_replace('\\','/',$info->getSaveName());
	        }else{
	                // 上传失败获取错误信息
	                echo $file->getError();
	        }

	    }

	    $info = '/uploads/'.$info;

		return Db::table('tr_user')
	    ->where('username',session('username'))
	    ->update(['icon' => $info]);

	}
	public function updateMyInfo()
	{
	 	//dump($_POST);
	 	if(!empty($_POST)) {
	 		$data['username'] = $_POST['username'];
		 	$data['sex'] = $_POST['sex'];
		 	$data['city'] = $_POST['city'];
		 	$data['birthday'] = $_POST['birthday'];
		 	// dump($data);
			
			return Db::table('tr_user')
		    ->where('username',session('username'))
		    ->update($data);


	 	}
	 	
	}
	public function getMyComment()
	{

		$u = db('user')->where('username',session('username'))->field('uid')->find();
		
		return Db::table('tr_comment')
					->where('uid',$u['uid'])
					->select();
	}



}


