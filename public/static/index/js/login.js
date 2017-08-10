/*==========登录方式的切换=============*/
//登录切换元素的父元素
var regTop=document.getElementById('reg-top');
//获取普通登录元素
var normal=document.getElementById('normal');
//alert(normal);
//获取无密码登录元素
var nopw=document.getElementById('nopw');
//获取扫码登录元素
var saoma=document.getElementById('qrcode');
//获取PC登录元素
var screen=document.getElementById('screen');

//获取普通登录对应的div
var rc=document.getElementById('rc');
//获取无密码登录对应的div
var lc=document.getElementById('lc');
//获取扫码登录对应的div
var sm=document.getElementById('sm');

//登录状态标识位
var rcFlag=true;
var lcFlag=false;

//实现登录方式的切换
normal.onclick=function(){
	rc.style.display="block";
	lc.style.display="none";
	sm.style.display="none";
	regTop.style.display="block";
	nopw.style.borderBottom="none";
	normal.style.borderBottom="2px solid #ff1877";
	rcFlag=true;
	lcFlag=false;

}

nopw.onclick=function(){
	rc.style.display="none";
	lc.style.display="block";
	sm.style.display="none";
	regTop.style.display="block";
	nopw.style.borderBottom="2px solid #ff1877";
	normal.style.borderBottom="none";
	rcFlag=false;
	lcFlag=true;
}

saoma.onclick=function(){
	rc.style.display="none";
	lc.style.display="none";
	sm.style.display="block";
	regTop.style.display="none";
}
screen.onclick=function(){
	regTop.style.display="block";
	sm.style.display="none";
	if(rcFlag){
		rc.style.display="block";
		return;
	}else{
		rc.style.display="none";
	}
	if(lcFlag){
		lc.style.display="block";
		return;
	}else{
		lc.style.display="none";
	}
}

/*=========普通登录表单验证============*/
//获取提示框元素
//获取用户名提示输入框
var rcInnerNum=document.getElementById('rc-inner-num');
var rcinnerText=rcInnerNum.getElementsByTagName('span')[0];

//获取密码提示框
var rcInnerVirity=document.getElementById('rc-inner-virity');
var rcInnerVirityText=rcInnerVirity.getElementsByTagName('span')[0];

//手机号码输入框
var inputPhone=document.getElementsByName('phone-num')[0];
//alert(inputPhone);
//密码输入框
var inputPassword=document.getElementsByName('password')[0];
//获取登录按钮
var loginBtn=document.getElementById('login-btn');


//用户名输入框验证


//手机输入正确标识位
var userFlag=false;
inputPhone.onblur=function(){
	//手机号码的正则验证
	// var reg=/^(1([358][0-9]|(47)|[7][0178]))[0-9]{8}$/;
	/*var reg=/^0(13[0-9]|15[012356789]|17[013678]|18[0-9]|14[57])[0-9]{8}$/;

	//邮箱的正则验证
	var reg1=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	//昵称的正则验证
	var reg2=/^[\u4e00-\u9fa5_a-zA-Z0-9_]{4,10}$/i;*/
	//console.log(this.value);
	if(this.value ==""){
		rcInnerNum.style.display="block";
		rcInnerVirity.style.display="none";
		
	}
	userFlag = true;
	
}

inputPhone.onfocus=function(){
	rcInnerNum.style.display="none";
	$('.success').hide();
	$('#rc-innerError').eq(0).hide();
}

//密码输入框验证
var passFlag=false;
inputPassword.onblur=function(){

	if(this.value !== ""){
		passFlag=true;
	}
		
}

inputPassword.onfocus=function(){
	rcInnerVirity.style.display="none";
	$('#rc-innerError').eq(0).hide();
}

//按钮验证
loginBtn.onclick=function(e){
	stopDefault(e);
	if(inputPhone.value == ""){
		rcInnerNum.style.display="block";
		rcinnerText.innerText="请先输入用户名/手机号/邮箱";
		rcInnerVirity.style.display="none";
		return;
	}
	if(inputPassword.value == ""){
		if(userFlag){
			rcInnerVirity.style.display="block";
			rcInnerNum.style.display="none";
		}
		return;
	}
	
	if(passFlag&&userFlag){
		//数据提交，及登录跳转
		$('#lg').submit();

	}
}

 
/*=========手机无密码登录=============*/
//获取手机号码提示框元素
var innerNum=document.getElementById('inner-num');
var innerNumText=innerNum.getElementsByTagName('span')[0];
//获取密码提示框元素
var innerVirity=document.getElementById('inner-virity');
var innerVirityText=innerVirity.getElementsByTagName('span')[0];


//获取手机号码输入框
var noPhoneNum=document.getElementsByName('phone-num')[1];
//console.log(noPhoneNum);
//获取验证码输入框
var otp=document.getElementsByName('password')[1];
//获取验证码按钮
var code=document.getElementById('code');
//登录按钮
var loginBtn1=document.getElementById('login-btn1');


//手机号码验证
var phoneFlag=false;
var reg= /^(13[0-9]|15[012356789]|17[013678]|18[0-9]|14[57])[0-9]{8}$/;
noPhoneNum.onblur=function(){

	if(this.value==""){
		innerNum.style.display="block";
		
		innerVirity.style.display="none";
	}else if(this.value.match(reg)){
		phoneFlag = true;
	}else{
		innerNum.style.display="block";
		innerNumText.innerText="请输入11位真实的手机号码";
		innerVirity.style.display="none";
	}

}

noPhoneNum.onfocus=function(){
	innerNum.style.display="none";
	$('.success').hide();
}

//获取手机验证码

var InterValObj; //timer变量，控制时间  
var count = 180; //间隔函数，1秒执行  
var curCount;//当前剩余秒数  
var code = ""; //验证码  
var codeLength = 6;//验证码长度  

$('#code').click(function (e) { 
 	stopDefault(e);
 	if(noPhoneNum.value.match(reg)){
 
    var phone = $("#mobile").val();  
    console.log(phone);  
    $.ajax({  
        type: "POST",  
        url: "/index/user/sendSMS",  
        data: "mobile="+$("#mobile").val() ,  
        success: function (data) {  
            console.log(data);  
                //data.result && data.result.success  
                if(data){  
                    curCount = count;  
                   //设置button效果，开始计时  
                   $("#code").css("background-color", "LightSkyBlue");  
                   $("#code").attr("disabled", "true");  
                   $("#code").html("获取" + curCount + "秒");  
                   InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次  
                  // alert("验证码发送成功，请查收!");  
              }  
          },  
          dataType: 'json'  
      });  
    return false;  
	}
});  

function SetRemainTime() {  
    if (curCount == 0) {  
        window.clearInterval(InterValObj);//停止计时器  
        $("#code").removeAttr("disabled");//启用按钮  
        $("#code").css("background-color", "");  
        $("#code").html("重发验证码");  
        code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效  
    }  
    else {  
        curCount--;  
        $("#code").html("获取" + curCount + "秒");  
    }  
}


//验证码检查
var codeFlag=false;
otp.onblur=function(){
	
	if(this.value !== ""){
		codeFlag=true;
	}
	
}

otp.onfocus=function(){
	innerVirity.style.display="none";
}

//登录按钮验证
loginBtn1.onclick=function(e){
	stopDefault(e);
	if(noPhoneNum.value==""){
		innerNum.style.display="block";
		innerNumText.innerText="请输入手机号码";
		innerVirity.style.display="none";
		return;
	}
	if(otp.value==""){
		if(phoneFlag){
			innerVirity.style.display="block";
			innerVirityText.innerText="请输入验证码";
			innerNum.style.display="none";
		}
		return;
	}
	if(phoneFlag&&codeFlag){
		//数据提交，及登录跳转
		$('#ph').submit();
		
	}

}


//阻止按钮默认提交的行为函数
function stopDefault(e)
{
    if (e&&e.preventDefault)
    {
        e.preventDefault();//非IE
    }
    else
    {
        window.event.returnValue = false;//IE
        return false;
    }
}