<?php

namespace app\admin\model;
use think\Model;
use think\Db;

class Admins extends Model
{
	public function checkUser($data)
	{
		$pwd = md5($data['password']);
		$flag = db('admin')->where('username',$data['username'])->find();
		if($flag){
			$re = db('admin')->where('username',$data['username'])->where('password',$pwd)->find();
			if($re){
				if($re['status'] == 1){
					return 4;
				}else{
					return 1;
				}
				
			}else{
				return 2;
			}
		}else{
			return 3;
		}
	}
	//联表查所有的管理员
	public function allUser()
	{
		return Db::table('tr_admin a ,tr_role r,tr_admin_role ar')->where('a.uid=ar.uid and ar.rid=r.rid')->field('a.username,a.uid,a.phone,a.mail,a.addtime,a.status,r.name as role')->select();
	}
	//联表查所有的角色
	public function allRole()
	{
		return Db::query('select r.rid,r.name,r.discription,group_concat(a.username) as userlist from tr_admin a ,tr_role r,tr_admin_role ar where a.uid=ar.uid and ar.rid=r.rid group by r.rid');
	}
	//单独查所有的角色
	public function getRoles()
	{
		return db('role')->field('rid,name,discription')->where('rid','>',1)->select();
	}
	//根据ID查角色
	public function getRole($data)
	{
		return db('role')->where('rid',$data['id'])->field('rid,name,discription')->find();
	}
	//根据ID查角色描述
	public function getDisc($data)
	{
		$id = $data['id'];
		return db('role')->where('rid',$id)->field('discription')->find();
	}
	//查除超管外的其他管理员
	public function admin()
	{
		return db('admin')->where('uid','>',1)->field('uid,username')->select();
	}
	//添加管理员
	public function addUser($data)
	{
		$arr = $data['arr'];
		$dt = ['username'=>$arr[0],'password'=>md5($arr[1]),'phone'=>$arr[2],'mail'=>$arr[3]];
		$id= db('admin')->insertGetId($dt);
		return db('admin_role')->insert(['uid'=>$id,'rid'=>$arr[4] ]);
	}
	//删除管理员
	public function deluser($data)
	{
		$id= $data['id'];
		db('admin')->where('uid',$id)->delete();
		return db('admin_role')->where('uid',$id)->delete();
	}
	//停用管理员
	public function stopAdmin($data)
	{
		$id= $data['id'];
		return db('admin')->where('uid',$id)->update(['status'=>1]);
	}
	//启用管理员
	public function startAdmin($data)
	{
		$id= $data['id'];
		return db('admin')->where('uid',$id)->update(['status'=>0]);
	}
	//查看管理员信息
	public function selUser($id)
	{
		return db('admin')->where('uid',$id)->find();
	}
	//修改管理员信息
	public function upUser($data)
	{
		$arr = $data['arr'];
		$dt = ['username'=>$arr[0],'password'=>md5($arr[1]),'phone'=>$arr[2],'mail'=>$arr[3]];
		db('admin')->where('uid',$arr[4])->update($dt);
		return db('admin_role')->where('uid',$arr[4])->update(['rid'=>$arr[5] ]);
	}
	//添加角色
	public function addRoles($data)
	{
		$arr = $data['arr'];
		$dt = ['name'=>$arr[0],'discription'=>$arr[1] ];
		$id= db('role')->insertGetId($dt);
		return db('admin_role')->insert(['uid'=>$arr[2],'rid'=>$id ]);
	}
	//删除角色
	public function delRole($data)
	{
		db('role')->where('rid',$data['id'])->delete();
		return db('admin_role')->where('rid',$data['id'])->delete();
	}
	//修改角色
	public function upRole($data)
	{
		$arr = $data['arr'];
		$dt = ['name'=>$arr[0],'discription'=>$arr[1] ];
		db('role')->where('rid',$arr[2])->update($dt);
		return db('admin_role')->where('rid',$arr[2])->update(['uid'=>$arr[3] ]);
	}
	//查所有的权限名
	public function allAccess()
	{
		$big = db('access')->where('pid',0)->field('aid,name,idname,icon,discription')->select();
		$small = db('access')->where('pid','>',0)->field('aid,pid,name,url')->select();
		return [$big,$small];
	}
	
	//查对应角色的权限
	public function getAccess($data)
	{
		$access1 = [];
		$access2 = [];
		$arr = ['1','2','3','4','5','6','7','8','9','10'];
		$arr2 = [];
		$dt = db('role_access')->where('rid',$data['id'])->field('aid')->find();
		$arr1 = explode(',',$dt['aid']);
		foreach ($arr1 as $v) {
			//角色拥有权限
			$access1[] = db('access')->where('aid',$v)->field('name')->find();
		}
		foreach ($arr as $v) {
			if(!in_array($v,$arr1)){
				$arr2[] = $v;
			}
		}
		foreach ($arr2 as $v) {
			//角色未拥有权限
			$access2[] = db('access')->where('aid',$v)->field('name')->find();
		}
		return [$access1,$access2];
	}


}