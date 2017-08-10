<?php

namespace app\admin\controller;
use think\Controller;
use think\Db;//引入数据库操作类
use app\admin\model\Sys;

class Systems extends Controller
{
	protected $system;
	public function _initialize()
    {
        $this->system = new Sys();
    }
    //系统日志页面
    public function sys_log()
    {
    	$data = $this->system->getLogs();
    	// dump($data);die;
    	return $this->fetch('',['data'=>$data]);
    }
    //产品统计页面
    public function sys_goods()
    {
    	return $this->fetch();
    }
    //销售统计页面
    public function sys_pay()
    {
    	$arr = $this->system->order_sums();
    	// dump($arr);die;
    	return $this->fetch('',['arr'=>$arr]);
    }
    //删除日志
    public function delLog()
    {
    	echo $this->system->delLog(input());
    }

    
}
