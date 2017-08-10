<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;//引入数据库操作类
use app\admin\model\Picture as PictureModel;

class Picture extends Controller
{
	protected $picture;
	public function _initialize()
    {
        $this->picture = new PictureModel();
    }
    public function picture_list()
    {
    	//加载html页面
       $data =  $this->picture->getBannerInfo(); 
       $this->assign('data',$data);
       // dump($data);die;
       return $this->fetch();
    }
    // 添加图片
    public function picture_add()
    {
        
         $result =  $this->picture->picture_add($_POST);

       
         return $this->fetch();

         

    }
    // 展示图片
    public function picture_show()
    {
        //加载html页面
        return $this->fetch();
    }
    //删除图片
    public function delPictureInfo()
    {
        return $this->picture->delpictureinfo(input());
    }



    //下架 图片
    public function stopPicture()
    {
        echo $this->picture->stopPicture(input());
    }
    //上架图片
    public function startPicture()
    {
        echo $this->picture->startPicture(input());
        // echo json_encode(input());
    }
}