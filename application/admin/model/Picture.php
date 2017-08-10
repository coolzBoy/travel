<?php
namespace app\admin\model;
use think\Model;
use think\Db;

class Picture extends Model
{


	public function getBannerInfo()
	{
		return Db::table('tr_banner')
					->select();//连贯操作

	}

	public function picture_add($data)
	{
		

		 if(!empty($_FILES)){

            $file = request()->file('icon');
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
            if($info){
              
                $info = str_replace('\\','/',$info->getSaveName());
                
            }else{
                // 上传失败获取错误信息
                echo $file->getError();
            }
            //dump($info);

        }
        	
        //dump($_POST);

		if(!empty($_POST)){
			$data['link'] = $_POST['link'];//景点名称
			$data['is_show'] = $_POST['is_show'];//景点类型
			$data['description'] = $_POST['description'];
			$data['icon'] = $info;//所属地区
			
			return Db::table('tr_banner')->insert($data);
						
		}
	}

	//删除图片
	public function delPictureInfo($data)
	{

		$id= $data['id'];

		return db('banner')->where('id',$id)->delete();
		
	}

	//下架图片
	public function stopPicture($data)
	{
		$id= $data['id'];
		return db('banner')->where('id',$id)->update(['is_show'=>0]);
	}
	//上架图片
	public function startPicture($data)
	{
		$id= $data['id'];
		return db('banner')->where('id',$id)->update(['is_show'=>1]);
	}

}


