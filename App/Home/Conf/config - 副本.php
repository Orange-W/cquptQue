<?php
return array(
	//'配置项'=>'配置值'
	'URL_CASE_INSENSITIVE' => true,
	'SESSION_AUTO_START' => true,
	'URL_MODEL'          => '3',
	'DEFAULT_CHARSET'    =>  'utf-8',
	'COOKIE_EXPIRE'         =>  5,    // Cookie有效期
	'SESSION_PREFIX'        =>  '', // session 前缀
	/*
	** mysql
	*/
	'DB_TYPE'               =>  'mysql',     // 数据库类型
	'DB_HOST'               =>  'localhost', // 服务器地址
	'DB_NAME'               =>  'cqupt_question',    // 数据库名
	'DB_USER'               =>  'root',      // 用户名
	'DB_PWD'                =>  '495871401',          // 密码
	'DB_PORT'               =>  '3306',        // 端口
	'DB_FIELDS_CACHE'       =>  true,        // 启用字段缓存
	
	/**
	 * 允许模块列表
	 */
		'DEFAULT_MODULE'       =>    'Home',  // 默认模块
		
	/*
	 * 自定义参数
	*/

);