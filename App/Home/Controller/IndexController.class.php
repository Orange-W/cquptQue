<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
	
	private $queNum = 15;
	private $acess_token = 'gh_68f0a1ffc303';
	private $wx_url = 'http://hongyan.cqupt.edu.cn/MagicLoop/index.php?s=/addon/Api/Api/';
	
	public function index(){
		$openId = I('get.id');
		
		$time=time();
		$str = 'abcdefghijklnmopqrstwvuxyz1234567890ABCDEFGHIJKLNMOPQRSTWVUXYZ';
		$string='';
		for($i=0;$i<16;$i++){
			$num = mt_rand(0,61);
			$string .= $str[$num];
		}
		$secret =sha1(sha1($time).md5($string)."redrock");
		$web=$this->wx_url.'userInfo';
		$find=array(
			'timestamp'=>$time,
			'string'=>$string,
			'secret'=>$secret,
			'token'=>$this->acess_token,
		);
		
		$back = json_decode($this->curl_api($this->wx_url."apiJsTicket",$find),true);
		
		$timestamp=time();
		
		$str = 'abcdefghijklnmopqrstwvuxyz1234567890ABCDEFGHIJKLNMOPQRSTWVUXYZ';
		$nonceStr='';
		for($i=0;$i<16;$i++){
			$num = mt_rand(0,61);
			$nonceStr .= $str[$num];
		}
		
		$url ="http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
		$key ="jsapi_ticket=$ticket&noncestr=$nonceStr&timestamp=$timestamp&url=$url";
		
		$data['ticket'] =$back['data'];
		$data['signature'] =sha1($key);
		$data['timestamp']=$timestamp;
		$data['nonceStr'] =$nonceStr;
		

		$this->assign('answerApi_url',U('home/index/answerApi'));
		$this->assign('on_url',U('public/img/on.png'));
		$this->assign('questionApi_url',U('home/index/questionApi'));
		$this->assign('rank_url',U('home/index/rankTop'));
		$this->assign('openId',$openId);
		$this->assign('Js',$data);
		$this->display();
	}
	
	
	
	public function rankTop(){
		$select = D('rank')->field('name')->order('count desc')->limit(5)->select();
		
		$this->assign('select',$select);
		$this->display();
	}
	
    private function setIn($src=''){
		
		$n=4;
		
       $handle = fopen("http://localhost/ThinkPHP/ThinkPHP-Item/cquptque/public/ask/$n.txt", 'r');
	   $i=0; 
	   $db = D("question$n");
	   $chose=array(
			2=>'ans_A',
			3=>'ans_B',
			4=>'ans_C',
			5=>'ans_D',
	   );
		while(!feof($handle)){
			if($content = trim(fgets($handle, 1024))){
				
				$i++;
				if($i==1){
					$arr = preg_split( "/[\s]+/", $content );
					$data['question'] = $arr[0];
					if(trim($arr[1])=='A'){
						$tmp = 1;
					}else if(trim($arr[1])=='B'){
						$tmp = 2;			
					}else if(trim($arr[1])=='C'){
						$tmp = 3;
					}else if(trim($arr[1])=='D'){
						$tmp = 4;
					}else{
						$tmp = 5;
					}
					$data['true_ans'] = $tmp;
				}else{
					$feld = $chose[$i];
					$data["$feld"] = $content;
				}
			}
			
			if($i==5){
				$feld = $chose[$i];
				$data["$feld"] = $content;
				print_r($data);
				echo '<br/>';
				$db->add($data);
				$i=0;
			}
		}
		fclose($handle);
		
		echo 'OK';

    }
	
	public function getRandom($table,$all){
		$db = D($table);
		$count = $db->count();
		$numbers = range (1,$count); 
		
		//shuffle 将数组顺序随即打乱 
		shuffle ($numbers); 
		
		//array_slice 取该数组中的某一段 
		$result = array_slice($numbers,0,$all); 
		
		return ($result); 
	}
	
	public function getTable($table){
		$return_table = D('que_table_info')->field('que_table')->where("`que_type_id`=$table")->find();
		return $return_table['que_table'];
	}
	
	public function	questionApi(){
		
		$data = array(
					'data'=>"您访问的页面不存在",
					'status' => 404
		);
				
		if( 
			(I('post.type')== 'getContent')
			&&
			(I('post.key') == md5('cqupt_question'))  //密文:86b4359bdfdefb5b21d6260476087062
			&&
			($table_id = I('post.tableId'))
		){
			$data = array(
					'data' => '数据异常',
					'status' => 444,
			);
			$return_table = $this->getTable($table_id);
			$array = $this->getRandom($return_table,$this->queNum);
			$map['qid']  = array('in',$array);
			if($db_data = (D($return_table)->field('qid,question,ans_A,ans_B,ans_C,ans_D')->where($map)->select())){
				$data = array(
					'data' => $db_data,
					'status' => 200,
				);
			}
		}
		$this->ajaxReturn($data);
	}
	
	public function	answerApi(){
		
		$data = array(
					'data'=>"您访问的页面不存在",
					'status' => 404
		);
				
		if(
			(I('post.type')== 'getGrade')
			&&
			(I('post.key') == md5('cqupt_question'))  //密文:86b4359bdfdefb5b21d6260476087062
			&&
			($content = I('post.content','',false))
			&&
			($table_id = I('post.tableId'))
			&&
			($openId = I('post.openId'))/*微信openid*/		
		){
			//[{"true_ans":"1","qid":"1","costTime":"3"},{"true_ans":"1","qid":"7","costTime":"3"},{"true_ans":"1","qid":"46","costTime":"3"},{"true_ans":"1","qid":"55","costTime":"3"},{"true_ans":"1","qid":"57","costTime":"3"},{"true_ans":"1","qid":"65","costTime":"3"},{"true_ans":"1","qid":"66","costTime":"3"},{"true_ans":"1","qid":"68","costTime":"3"},{"true_ans":"1","qid":"77","costTime":"3"},{"true_ans":"1","qid":"86","costTime":"3"}]
			
			$arr = json_decode($content,true);
			$return_table = $this->getTable($table_id);
			$db = D($return_table);
			
			/*计算正确数和成绩*/
			$count = 0;
			$all=count($arr);
			if($all!=$this->queNum){
				$this->ajaxReturn($data);
				exit();
			}
			$grade=0;
			
			foreach($arr as $value){
				
				$theTime = $value['costTime'];
				unset($value['costTime']);
				
				if($db->where($value)->find()){
					$grade += (!($theTime>=15))
								?((15-$theTime)/15*24)
								:0;
					$count++;
				}
			}
			
		    $u['wx_id']= $openId;
			
			if(D('wx_user')->where("wx_id='$openId'")->find()){
				
			}else{
				$this->addUser($openId);
			}
			
			
			/*跟新reply成绩,比原来高就覆盖*/
			$add= array(
				'rightNum' => $count,
				'grade' => $grade,
			);
			$find = array(
				'wx_id' => $openId,
				'que_type' => $table_id,
			);
			
			
			
			
			if($check = D('reply')->where("wx_id='$openId' and que_type=$table_id")->find()){
				if($check['rightNum']>$add['rightNum']){
					$add['rightNum']= $check['rightNum'];
				}
				
				if($check['grade']>$add['grade']){
					$add['grade']= $check['grade'];
				}	
				
				D('reply')->where("wx_id='$openId' and que_type=$table_id")->save($add);
			}else{
				$add['wx_id'] = $openId;
				$add['que_type'] = $table_id;
				D('reply')->where("wx_id='$openId' and que_type=$table_id")->add($add);
			}
			
			/*跟新用户总成绩*/

			$replyData = D('reply')->where("wx_id='$openId'")->select();
			$n = count($replyData);
			$wx_user_grade=0;
			$wx_user_count=0;
			foreach($replyData as $key => $value){
				$wx_user_grade += $value['grade'];
				$wx_user_count += $value['rightNum'];
			}
			
			$rate = $wx_user_count*100/$n/$this->queNum;
			$save['rate'] = $rate;
			$save['allGrade'] = $wx_user_grade;
			$save['unlock'] = $n;
			$save['avgGrade'] = $wx_user_grade/$n*(1+$n*1.25/10)*($rate+300)/400;
			
			D('wx_user')->where("wx_id='$openId'")->save($save);
			
			/*回复称号*/

			if($all==$this->queNum){	
				$rankNum = D('reply')->where("grade>$grade and que_type=$table_id")->count();			
				$data = array(
						'rank' => $rankNum+1,
						'grade' => $grade,
						'num' => $count,
						'status' => 200
				);
			}else{
				$data = array(
						'info' => '操作非法',
						'status' => 0
				);
			}
		}
		
		

		$this->ajaxReturn($data);
	}
	
	private function backUserInfo($openId){
		$time=time();
		$str = 'abcdefghijklnmopqrstwvuxyz1234567890ABCDEFGHIJKLNMOPQRSTWVUXYZ';
		$string='';
		for($i=0;$i<16;$i++){
			$num = mt_rand(0,61);
			$string .= $str[$num];
		}
		$secret =sha1(sha1($time).md5($string)."redrock");
		$web=$this->wx_url.'userInfo';
		$data=array(
			'timestamp'=>$time,
			'string'=>$string,
			'secret'=>$secret,
			'token'=>$this->acess_token,
			'openid'=>$openId,
		);
		$information=$this->curl_api($web,$data);
		
		$tmp = json_decode($information,true);
		return $tmp;
	}
	
	public function addUser($openId){
		$tmp=$this->backAppInfo($openId);
		$add = array(
			'wx_id'=>$tmp['data']['openid'],
			'name'=>$tmp['data']['nickname'],
			'img_src'=>$tmp['data']['headimgurl'],
			'sex'=>$tmp['data']['sex'],
		);
		
		D('wx_user')->add($add);
	}
	
	/*curl通用函数*/
	private function curl_api($web,$post=''){
		header('Content-Type:application/json; charset=utf-8');
		$send="";
		foreach($post as $p=>$value){
			
			$send .= '&'.$p."=".$value;
		}
		$curlPost = $send;
		// 初始化一个curl对象	
		$curl = curl_init();

		// 设置url
		curl_setopt($curl,CURLOPT_URL,$web);

		// 设置参数，输出或否
		curl_setopt($curl,CURLOPT_RETURNTRANSFER,1);

		//数据
		curl_setopt($curl,CURLOPT_POSTFIELDS,$curlPost);

		// 运行curl，获取网页。
		$contents = curl_exec($curl);
		// 关闭请求
		curl_close($curl);
		return $contents;
	}
	
	public function userInfo(){
		$data = array(
					'data'=>"您访问的页面不存在",
					'status' => 404
		);
				
		if(
			(I('post.key') == md5('cqupt_question'))  //密文:86b4359bdfdefb5b21d6260476087062
			&&
			($openId = I('post.openId','1'))/*微信openid*/	
			&&
			($type = I('post.type'))			
		){
			switch($type){
				case 'rankAll':
					$tmp = D('wx_user')->field('name,allGrade,avgGrade')->order('avgGrade desc')->limit(10)->select();
					$data = array(
						'data'=>$tmp,
						'status' => 200
					);
					break;
					
				case 'userInfo':
				    $tmp =D('reply')->field('que_type,rightNum,grade')->where("wx_id='$openId'")->select();
					unset($data['data']);
					$data['status']=200;
					foreach($tmp as $key => $value){
						$data['data'][] = $value;
					}
					$tmp = D('wx_user')->where("wx_id='$openId'")->find();
					$data['userInfo'] = $tmp;
					break;
					
				default:
					break;
			}
			
			
		}
		$this->ajaxReturn($data);
	}
}




