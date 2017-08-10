
angular.module('myApp',[])

.controller('regController',function($scope) { 
	
	$scope.logindata = {};

	//在用户进行提交注册操作时进行的最后判断提示
	$scope.submitLoginForm = function(e) { 
		//阻止事件的默认行为
		e.preventDefault();
		if($scope.loginForm.$invalid){ 

			alert('请检查用户信息是否正确!');
		}else{ 
			
			var user = $scope.logindata['username'];
			var pwd = $scope.logindata['password'];
			var phone = $scope.logindata['phone'];
			var yzcode = $scope.logindata['yzcode'];

			window.location.href="../user/doReg.html?u="+user+"&p="+pwd+"&ph="+phone+"&cd="+yzcode;
		}
	}
}).directive('compare',function() { 

	/* 
		1.restrict
		(字符串) 可选参数 指明自定义指令DOM里面以什么形式被声明
		取值范围: A(属性) E(元素) C(类) M(注释) 默认为A

	*/

	var obj = {};
	obj.strice = "AE";
	obj.scope = { 
		orgText:'=compare'
	};

	obj.require = 'ngModel';

	obj.link = function(scope,element,attr,con) { 

		con.$validators.compare = function(val) { 
			return val == scope.orgText;
		}

		//内部监听
		scope.$watch('orgText',function() { 
		
			con.$validate();
		});

	}

	return obj;

});