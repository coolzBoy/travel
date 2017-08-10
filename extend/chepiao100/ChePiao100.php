<?php
namespace extend\chepiao100;
/**
 * 车票100 接口类
 * 
 * @author chepiao100
 *
 */
// require 'config.php';
//  $config = array();
// $config['userid'] = "641892857@qq.com"; // 用户名邮箱
// $config['seckey'] = "bc0ca5d2e864724b2a61e2c29a380c22"; // 授权密钥

class ChePiao100
{	
	/**
	 * 接口地址
	 * @var string
	 */
	private $_apiurl = 'http://www.chepiao100.com/api/';
		
  /**
   * 返回接口数据
   * 
   * @param string $method 接口方法
   * @param array $param 请求参数
   * @return mixed
  */
  function getData($method, $param)
  {
    // global $config;
    $config['userid'] = "641892857@qq.com"; // 用户名邮箱
    $config['seckey'] = "bc0ca5d2e864724b2a61e2c29a380c22"; // 授权密钥
    $param['userid'] = $config['userid'];
    $param['seckey'] = $config['seckey'];
   // var_dump($param);
    $post = http_build_query($param);

    $html = $this->fetch_html($this->_apiurl.$method, $post);
    //var_dump($html);
    //die;
    $jsonArr = json_decode($html, TRUE);
    if ( $jsonArr['errMsg'] == 'Y') {
      return $jsonArr['data'];
    } else {
   	  return $jsonArr['errMsg'];
    }
  }
 
  /**
   * 请求HTTP
   * 
   * @param string $url
   * @param string $post
   * @return mixed
   */
  function fetch_html($url, $post)
  {
	  $ch = curl_init($url);
	  curl_setopt($ch, CURLOPT_TIMEOUT, 60);
	  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	  curl_setopt($ch, CURLOPT_POST, true);
	  //curl_setopt($ch, CURLOPT_PROXY, 'http://10.100.10.100:3128');
	  curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
	  $html = curl_exec($ch);

	  curl_close($ch);
	  return $html;
  }
}
/** End class of chepiao100 **/
