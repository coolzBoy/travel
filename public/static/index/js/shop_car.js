
//购物车商品信息发生变化的js

//全选
/*$('#checkbox_a0').click(function(){
	$('.cb1').prop('checked',this.checked);
});*/

//直接点购物车进入的页面
if($('.flag').prop('value') == '1'){
	//找到所有的+按钮
	add = $('.Increase');
	//找到所有的-按钮
	sub = $('.DisDe');

	//总计
	sums = 0;
	s1 = 0;
	//库存
	arrStock = [];
	arrSum = [];
	for(var i =0;i<$('.shopli').length;i++)
	{
		//初始页面
		//获取库存量
	    arrStock[i] = parseInt($('.stock')[i].value);
	    
	    // 解决数组索引越界问题
	    sub[i].index = i;
		add[i].index = i;
	    //分割字符串获取单价
	    price = $('.pr')[i].innerText.split('￥')[1];
	    num = $('.Amount')[i].value;
	    sum = num * price;
	    score = num * price *0.5;
	    $('.score')[i].innerText = score;
	    $('.sum')[i].innerText = '￥'+sum;
	    arrSum[i] = sum;		
	    //数量加
	    add[i].onclick = function(){
	    	num = parseInt($('.Amount')[this.index].value);
		    if(num < arrStock[this.index]){
		        num++;
		        $('.Amount')[this.index].value = num;
		        sum = num * price;
		        score = num * price *0.5;
		    	$('.score')[this.index].innerText = score;
		        $('.sum')[this.index].innerText = '￥'+sum;
		        arrSum[this.index] = sum;
		        for(var i in arrSum)
				{
					if(i != this.index){
						s1 = s1+arrSum[i];
					}
				}
				s2 = s1+sum;
				$('#sums').html('￥'+s2);
				s1 = 0;
		    }else{
		        alert('已达到库存量！');
		        $('.Amount')[this.index].value = stock;
		    }
	    }
	    //数量减
	    sub[i].onclick = function(){
	    	num = parseInt($('.Amount')[this.index].value);
		    if(num > 1){
		        num--;
		        $('.Amount')[this.index].value = num;
		        sum = num * price;
		        score = num * price *0.5;
		    	$('.score')[this.index].innerText = score;
		        $('.sum')[this.index].innerText = '￥'+sum;
		        arrSum[this.index] = sum;
		        for(var i in arrSum)
				{
					if(i != this.index){
						s1 = s1+arrSum[i];
					}
				}
				s2 = s1+sum;
				$('#sums').html('￥'+s2);
				s1 = 0;
		    }else{
		        $('.Amount')[this.index].value = 1;
		    }
	    }
	}
	for(var i = 0;i<arrSum.length;i++)
	{
		sums +=arrSum[i];
	}
	$('#sums').html('￥'+sums);
}
//点立即购买进入的购物车页面
if($('.flag').prop('value') == '2'){
    //获取库存量
    stock = parseInt($('#stock').prop('value'));
    //分割字符串获取单价
    price = $('#price').html().split('￥')[1];
    num = $('#num').prop('value');
    sum = num * price;
    score = num * price *0.5;
    $('#score').html(score);
    $('#sum').html('￥'+sum);
    $('#sums').html('￥'+sum);
    //数量减
	function sub()
	{
	    num = parseInt($('#num').prop('value'));
	    if(num > 1){
	        num--;
	        $('#num').prop('value',num);
	        sum = num * price;
	        score = num * price *0.5;
	    	$('#score').html(score);
	        $('#sum').html('￥'+sum);
	        $('#sums').html('￥'+sum);
	    }else{
	        $('#num').prop('value',1);
	    }
	}
	//数量加
	function add()
	{
	    num = parseInt($('#num').prop('value'));
	    if(num < stock){
	        num++;
	        $('#num').prop('value',num);
	        sum = num * price;
	        score = num * price *0.5;
	    	$('#score').html(score);
	        $('#sum').html('￥'+sum);
	        $('#sums').html('￥'+sum);
	    }else{
	        alert('已达到库存量！');
	        $('#num').prop('value',stock);
	    }
	}
}


    