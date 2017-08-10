<?php
namespace app\admin\controller;
use think\Controller;
use think\Request;
use think\Db;//引入数据库操作类
use app\admin\model\Comment as CommentModel;//解决重名问题


class Comment extends Controller
{
    protected $comment;
    public function _initialize()
    {
        $this->comment = new CommentModel();//初始化
    }
    public function comment_list()
    {
        //return "首页";
        // 调用分配下
        $data = $this->comment->getCommentInfo();
        //dump($data);
        $this->assign('data',$data);
       
        //die;
        
    	return $this->fetch(); 

    }
    // 删除回复
     public function delCommentInfo(){
        
       $data = $this ->comment->delCommentInfo(input('id'));
       
        if($data){
            echo json_encode(1);
        }else{
            echo json_encode(0);
        }
    }
    // 商品评价
    public function goods_comment()
    {
        //return "首页";
        // 调用分配下
        $data = $this->comment->getGoodsComment();
        //dump($data);
        $this->assign('data',$data);
       
        //die;
        
        return $this->fetch(); 

    }
    
}
