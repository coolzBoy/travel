<?php

namespace app\index\model;
use think\Model;
use think\Db;

class User extends Model
{
	public function userList()
	{
		return db('user')->field('*')->select();
	}
	//查询某个用户信息
	public function getUser($flag,$user)
	{
		if($flag){
			//如果是用户名登录，查询该用户名对应的用户信息
			return db('user')->where('username',$user)->find();
		}else{
			//如果是手机号登录，查询该手机号对应的用户信息
			return db('user')->where('phone',$user)->find();
		}
		
	}

	//在数据库中插入新注册的用户
	public function insertUser($data)
	{
		//判断手机号是否被注册
		$res1 = db('user')->where('phone',$data['ph'])->find();
		//判断用户名是否被注册
		$res2 = db('user')->where('username',$data['u'])->find();
		if($res1){
			return 2;
		}else if($res2){
			return 3;
			}else{
				$dt = ['username'=>$data['u'],'password' =>md5($data['p']),'phone' =>$data['ph'],'score' =>20 ];
				return db('user')->insert($dt);
			}
	}

	//验证用户登录
	public function checkUser($data)
	{
		$user = $data['phone-num'];
		$pwd = md5($data['password']);
		//判断是否是手机号登录
		if (preg_match('/^\d{11}/',$user)){
			$result = db('user')->where('phone',$user)->field('uid')->find();
        }else{
            $result = db('user')->where('username',$user)->field('uid')->find();
        }
        // dump($result);die;
        if($result){
        	$re = db('user')->where('uid',$result['uid'])->where('password',$pwd)->field('username')->find();
        	if($re){
        		return $re['username'];
        	}else{
        		return '1';
        	}
        }else{
        	return '0';
        }

	}
	//插入三方登录的用户信息
	public function insertThree($data)
	{
		$flag = db('user')->where('username',$data['name'])->field('username')->find();
		if($flag){
			return 1;
		}else{
			$dt = ['username' =>$data['name'],'icon' =>$data['img'] ];
			return db('user')->insert($dt);
		}
	}

	

}