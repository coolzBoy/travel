<?php
namespace app\admin\controller;
use think\Controller;
use app\admin\model\Goods as GoodsModel;

class Goods extends Controller
{



    protected $goods;
    public function _initialize()
    {
        $this->goods = new GoodsModel();//初始化
    }
    public function goods_category()
    {




    	return $this->fetch();    
    }

    public function goods_list()
    {


        $data = $this->goods->getGoodsInfo();

        $this->assign('data',$data);
        dump($data);
        //die;
    	return $this->fetch();

    }
    public function goods_add()
    {
        // $data = $this->goods->getTypeInfo();

        // $this->assign('data',$data);
        // dump($data);
        return $this->fetch();

    } 
    public function goods_category_add()
    {

 
        return $this->fetch();
        

    }
    //删除商品
    public function delGoodsInfo()
    {
        return $this->goods->delgoodsinfo(input());
    }
    public function addGoodsInfo()
    {

    
        $result =  $this->goods->addGoodsInfo(input());
        $result?$this->success('操作成功！'):$this->error('操作失败！');
    }
    public function addCategoryInfo()
    {

    
        $result =  $this->goods->addCategoryInfo(input());
        $result?$this->success('操作成功！'):$this->error('操作失败！');
    }

    
}
