<?php

namespace app\admin\controller;
use think\Controller;
use think\Db;//引入数据库操作类
use app\admin\model\Admins;

class Users extends Controller
{
	protected $user;
	public function _initialize()
    {
        $this->user = new Admins();
    }
    //角色管理页面
	public function admin_role()
	{
		$data = $this->user->allRole();
		$sum = count($data);

		return $this->fetch('',['data'=>$data,'sum'=>$sum]);
	}

	//权限管理页面
	public function admin_permission()
	{
		return $this->fetch();
	}

	//管理员列表页面
	public function admin_list()
	{
		$data = $this->user->allUser();
		$sum = count($data);
		
		return $this->fetch('',['data'=>$data,'sum'=>$sum]);
	}
	//添加管理员页面
	public function admin_add()
	{
		$data = $this->user->getRoles();
		return $this->fetch('',['data'=>$data]);
	}
	//向表中添加管理员
	public function addUser()
	{
		echo $this->user->addUser(input());
	}
	//获取对应角色的描述
	public function getTips()
	{
		return $this->user->getDisc(input());
	}
	//删除管理员
	public function delUser()
	{
		echo $this->user->deluser(input());
	}
	//停用管理员
	public function stopUser()
	{
		echo $this->user->stopAdmin(input());
	}
	//启用管理员
	public function startUser()
	{
		echo $this->user->startAdmin(input());
		// echo json_encode(input());
	}
	//编辑管理员页面
	public function admin_edit()
	{
		$data = $this->user->getRoles();
		$dt = $this->user->selUser(input('id'));
		
		return $this->fetch('',['data'=>$data,'dt'=>$dt]);
	}
	//修改管理员
	public function updateUser()
	{
		echo $this->user->upUser(input());
	}

	//添加角色页面
	public function admin_role_add()
	{
		//查询除超管外的所有管理员
		$data = $this->user->admin();

		
		return $this->fetch('',['data'=>$data]);
	}
	//编辑角色页面
	public function admin_role_edit()
	{
		//根据id获取角色信息
		$dt = $this->user->getRole(input());
		//查对应角色的权限
		$access = $this->user->getAccess(input());
		// dump($access);die;

		return $this->fetch('',['dt'=>$dt,'access'=>$access ]);
	}
	//添加新角色
	public function addRole()
	{
		echo $this->user->addRoles(input());
		
	}
	//删除角色
	public function delRole()
	{
		echo $this->user->delRole(input());
	}
	//修改角色
	public function updateRole()
	{
		echo $this->user->upRole(input());
	}



}