<?php
namespace app\admin\model;//必须和目录一致
use think\Db;
use think\Request;
use think\Image;//引入图片
use think\Model;//引入model类 不是必须的db的不必须
class Scenery extends Model//不一定非得继承
{
	//table必须带前缀name不需要
	public function getSceneryInfo()
	{
		return Db::table('tr_scenery')
					->select();//连贯操作		 
	}
	//查询地点
	public function getPlaceInfo()
	{
		return Db::table('tr_place')
					->select();//连贯操作		 
	}
	// 增加景区地址
	public function addCategoryInfo($data)
	{
		//dump($_POST);
		if (!empty($_POST)) {
			$data['province'] = $_POST['province'];//景点地点
			// $data['classid'] = $_POST['classid'];//景点类型

			return Db::table('tr_place')->insert($data);
		}


	}
	public function addSceneryInfo($data)
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
		// die;
		if(!empty($_POST)){
			$data['name'] = $_POST['name'];//景点名称
			$data['type'] = $_POST['type'];//景点类型
			$data['style'] = $_POST['style'];//所属地区
			$data['stock'] = $_POST['stock'];//门票量
			$data['placeid'] = $_POST['placeid'];//门票量
				
			$data['price'] = $_POST['price'];//价格
			$data['keywords'] = $_POST['keywords'];//关键词
			$data['remend'] = $_POST['remend'];//是否推荐
			$data['note'] = $_POST['note'];//描述
			$data['picture'] = $info;//缩略图
			$data['picmax'] = $info;//大图
			$data['addtime'] = date("Y-m-d h:i:s");
			$data['content'] = $_POST['content'];//内容

			//dump($data);
			
			return Db::table('tr_scenery')->insert($data);
						
		}
	}

	public function delSceneryInfo($id)//删除景点
	{
			return Db::table('tr_scenery')->delete(['sid'=>$id]);
			//echo json_encode(1);

			//die;
			//dump($_POST);
	}


	//下架景区
	// public function stopScenery($data)
	// {
	// 	// $id= $data['id'];
	// 	//return db('admin')->where('uid',$id)->update(['status'=>1]);
	// }
}

