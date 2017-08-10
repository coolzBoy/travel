// 代售点JS 通用JS
// @authoer phpbin
// date 2014-04-02
$(function(){
    // init  省份
	$('#province').change(function(){ do_ajax_province($(this)); });
	// init 城市
	$('#city').change(function(){ do_ajax_city($(this)); });
});


// 省份
var do_ajax_province = function(obj)
{
    var province = obj.val();
	var action = BaseURL + 'sell_auto?province='+encodeURIComponent(province)+'&act=city';
	$.getJSON(action, function(json){
	    var html = '<option value="">请选择城市</option>';
		for(var i=0; i<json.length; i++)
		{
		    html += '<option value="'+json[i].city+'">'+json[i].city+'</option>';
		}
		$('#city').html(html);
		$('#county').html('<option value="">请选择区/县</option>');
	});
}

// 城市
var do_ajax_city = function(obj)
{
	var province = $('#province').val();
    var city = obj.val();
	var action = BaseURL + 'sell_auto?province='+encodeURIComponent(province)+'&city='+encodeURIComponent(city)+'&act=county';
	$.getJSON(action, function(json){
	    var html = '<option value="">请选择区/县</option>';
		for(var i=0; i<json.length; i++)
		{
		    html += '<option value="'+json[i].county+'">'+json[i].county+'</option>';
		}
		$('#county').html(html);
	});
}

// 代售点提交
var doSell = function()
{
    var province = $('#province').val();
	var city     = $('#city').val();
	var county   = $('#county').val();
    
	if ( province == "")
	{
	   $('#province').focus();
	   $('#province').addClass('error');
	   return
	}
	$('#province').removeClass('error');
	
	// 参数生成
	var param = new Array();
	if ( province != "") param[param.length] = encodeURIComponent(province);
	if ( city != "")     param[param.length] = encodeURIComponent(city);
	if ( county != "")   param[param.length] = encodeURIComponent(county);
    var action = BaseURL + 'daishoudian/'+param.join(',')+'.html';
	$('#sub_form').attr('method', 'post');
	$('#sub_form').attr('action', action);
	$('#sub_form').submit();
	$(".loading").show();
}