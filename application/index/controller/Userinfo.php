<?php
namespace app\index\controller;//个人中心
use think\Controller;
use think\Request;
use think\Db;//引入数据库操作类
use think\Validate;
use app\index\model\UserInfo as UserInfoModel;

class UserInfo extends Controller 

{
	protected $userinfo;
	public function _initialize()
	{
         $this->userinfo = new UserInfoModel();//初始化
     }
    public function my_index()//首页
    {
    	$data = $this ->userinfo->getUserInfo();
		 $this->assign('data',$data);
		
        $reply = $this ->userinfo->getReplyInfo();
        $this->assign('data',$data);
        // 用户的信息
        
        $myinfo = $this->userinfo->getMyInfo();
        $this->assign('myinfo',$myinfo);
        //dump($myinfo);
        //dump($data);
    	return $this->fetch();
    }

    public function write_note()//上传文件
    {
    	
       
    	$data = $this ->userinfo->addUserInfo();
		$this->assign('data',$data);

        //用户信息
        $myinfo = $this->userinfo->getMyInfo();
        $this->assign('myinfo',$myinfo);
        //dump($myinfo);
    	return $this->fetch();//写游记
    } 

    public function my_note()
    {

    	$data = $this ->userinfo->getUserInfo();
		$this->assign('data',$data);
        //用户信息
        $myinfo = $this->userinfo->getMyInfo();
        $this->assign('myinfo',$myinfo);
		//dump($myinfo);
    	return $this->fetch();//我的游记
    } 
    public function collection_list()
    {
        $data = $this ->userinfo->getCollecInfo();
        $this->assign('data',$data);
        //用户信息
        $myinfo = $this->userinfo->getMyInfo();
        $this->assign('myinfo',$myinfo);
    	return $this->fetch();//我的收藏
    } 
    public function goods_order()
    {
        $data = $this ->userinfo->getgoodsOrderInfo();
        //dump($data);
        $this->assign('data',$data);

         //用户信息
        $myinfo = $this->userinfo->getMyInfo();
        $this->assign('myinfo',$myinfo);
       //dump($myinfo);
        // die;
    	return $this->fetch();//商品订单
    } 
    public function scenic_order()
    {
         //用户信息
        $myinfo = $this->userinfo->getMyInfo();
        $this->assign('myinfo',$myinfo);
    	return $this->fetch();//旅游订单
    } 
    public function note_comments()
    {

        $data = $this ->userinfo->getMyComment();
        $this->assign('data',$data);
       //dump($data);
       ////用户信息
        $myinfo = $this->userinfo->getMyInfo();
        $this->assign('myinfo',$myinfo);
        //dump($myinfo);
        // die;
    	return $this->fetch();//我的评论
    } 
    public function my_info()
    {
        $data = $this ->userinfo->getHeadinfo();
        //dump($data);
        ///用户信息
        $myinfo = $this->userinfo->getMyInfo();
        $this->assign('myinfo',$myinfo);
        //dump($myinfo);
        $this->assign('data',$data);
    	return $this->fetch();//设置
    }
    
    public function my_head()
    {
        $data = $this ->userinfo->getHeadinfo();
        //dump($data);
         //用户信息
        $myinfo = $this->userinfo->getMyInfo();
        $this->assign('myinfo',$myinfo);
        $this->assign('data',$data);
       
    	return $this->fetch();//上传头像
    }
    public function my_contact()
    {
         //用户信息
        $myinfo = $this->userinfo->getMyInfo();
        $this->assign('myinfo',$myinfo);
    	return $this->fetch();//常用联系人
    }
	public function security()
    {

        $myinfo = $this->userinfo->getMyInfo();
        $this->assign('myinfo',$myinfo);
        return $this->fetch();//修改密码
    }

    public function delUserInfo()
    {
       
    	//删除游记Controller
        if( $this->userinfo->delUserInfo(input('id'))){
            echo json_encode(1);
        }else{
            echo json_encode(0);
        }
    }
     public function delOrderInfo($id)
    {
            return Db::table('tr_goods_order')->delete(['id'=>$id]);

        //删除商品订单Controller
        // if( $this->userinfo->delOrderInfo(input('id'))){
        //     echo json_encode(1);
        // }else{
        //     echo json_encode(0);
        // }
    }
    //更新头像
    public function addMyInfo()
    {
         //用户信息
        $myinfo = $this->userinfo->getMyInfo();
        $this->assign('myinfo',$myinfo);
        $data = $this ->userinfo->addMyInfo();
        $data?$this->success('操作成功！'):$this->error('操作失败！');
    }
    //更新个人信息
    public function updateMyInfo()
    {
        $data = $this ->userinfo->updateMyInfo();
        $data?$this->success('操作成功！'):$this->error('操作失败！');
        //dump($data);
    }
}
