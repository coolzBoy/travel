<?php
namespace app\admin\model;//必须和目录一致
use think\Db;
use think\Request;
use think\Image;//引入图片
use think\Model;//引入model类 不是必须的db的不必须
class Goods extends Model//不一定非得继承
{
	//table必须带前缀name不需要
	public function getGoodsInfo()
	{
		return Db::table('tr_goods')
					->select();//连贯操作		 
	}
	//查寻商品种类
	// public function getTypeInfo()
	// {
	// 	return Db::table('tr_goods_type')
	// 				->select();//连贯操作		 
	// }
	// 增加商品种类
	public function addCategoryInfo($data)
	{
		//dump($_POST);
		//die;
		if (!empty($_POST)) {

			$data['type'] = $_POST['type'];//景点地点

			return Db::table('tr_goods_type')->insert($data);
		}


	}
	//增加商品信息图片
	public function addGoodsInfo($data)
	{
		//dump($_FILES);
		//dump($_POST);
        if(!empty($_FILES)){

            $file = request()->file('picture');
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
            if($info){
                // 成功上传后 获取上传信息
                // 输出 jpg
                //echo $info->getExtension();
                // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
                $info = str_replace('\\','/',$info->getSaveName());
                // 输出 42a79759f284b767dfcb2a0197904287.jpg
               //$info = $info->getFilename(); 
            }else{
                // 上传失败获取错误信息
                echo $file->getError();
            }
        }
        //dump($info);
		//die;

		if(!empty($_POST)){

			$data['name'] = $_POST['name'];//商品名称
			$data['typeid'] = $_POST['typeid'];//景点类型
			$data['buys'] = $_POST['buys'];//所属地区
			$data['stock'] = $_POST['stock'];//门票量
			$data['place'] = $_POST['place'];//门票量		
			$data['posts'] = $_POST['price'];//价格
			$data['keywords'] = $_POST['keywords'];//关键词
			$data['recommend'] = $_POST['recommend'];//是否推荐
			$data['note'] = $_POST['note'];//描述
			$data['picture'] = $info;//缩略图
			$data['picmax'] = $info;//大图
			$data['addtime'] = date("Y-m-d h:i:s");
			$data['content'] = $_POST['content'];//内容
			
			return Db::table('tr_Goods')->insert($data);
						
		}
	}


	public function delGoodsInfo($data)
	{

		$id= $data['id'];

		return db('goods')->where('gid',$id)->delete();
		
	}

	


	//下架景区
	// public function stopScenery($data)
	// {
	// 	// $id= $data['id'];
	// 	//return db('admin')->where('uid',$id)->update(['status'=>1]);
	// }
}