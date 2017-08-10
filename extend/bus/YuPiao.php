<?php

if (!empty($_GET)) {
	if ( $_GET['startStation'] && $_GET['arriveStation'] && $_GET['date'])
	{
	require 'chepiao100.php';
	$cp = new chepiao100();
	$data = $cp->getData('yupiao', $_GET);
	}
}

var_dump($_GET);
var_dump($_POST);
var_dump($data);
// $cp = new chepiao100();
// $_GET['startStation'] = '北京';
// $_GET['arriveStation'] = '上海';
// $_GET['date'] = '2017-07-26';
// echo $data = $cp->getData('checi', $_GET);
