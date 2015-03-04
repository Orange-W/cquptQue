<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
	public function index(){
		
		$this->assign('answerApi_url',U('home/index/answerApi'));
		$this->assign('on_url',U('public/img/on.png'));
		$this->assign('questionApi_url',U('home/index/questionApi'));
		$this->assign('rank_url',U('home/index/rankTop'));
		$this->display();
	}
	
	public function rankTop(){
		$select = D('rank')->field('name')->order('count desc')->limit(5)->select();
		
		$this->assign('select',$select);
		$this->display();
	}
	
    private function setIn($src){
		//$public = U('Public');
       $handle = fopen($src, 'r');
	   $i=0;
	   $db = D("question");
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
	
	public function getRandom($all = 15){
		$db = D('question');
		$count = $db->count();
		$numbers = range (1,$count); 
		
		//shuffle 将数组顺序随即打乱 
		shuffle ($numbers); 
		
		//array_slice 取该数组中的某一段 
		$result = array_slice($numbers,0,$all); 
		
		return ($result); 
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
		){
			$array = $this->getRandom();
			
			$map['qid']  = array('in',$array);
			if($db_data = (D('question')->field('qid,question,ans_A,ans_B,ans_C,ans_D')->where($map)->select())){
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
			($content = I('post.content','',''))
			&&
			($name = I('post.name'))
		){
		
			$arr = json_decode($content);
			$db = D('question');
			$count = 0;
			$all=0;
			
			foreach($arr as $value){
				$all++;
				if($db->where($value)->find()){
					$count++;
				}
			}
			
			
			
			if($count >= 15){
				$ch = "重邮科学家";
				$yjh = "现在问题来了，重邮问答哪家强？";
			}else if($count>=12){
				$ch = "重邮好卧底";
				$yjh = "快说，你这么多年潜伏在重邮有何目的。";
			}else if($count>=9){
				$ch = "重邮小青蛙";
				$yjh = "童鞋你要多出去蹦哒蹦哒啊！";
			}else if($count>=6){
				$ch = "重邮小鲜肉";
				$yjh = "你这点资历很容易被坏人叔叔骗的噢";
			}else if($count>=3){
				$ch = "重邮喵星人";
				$yjh = "还不够骚年，像好奇的喵星人一样去探索吧喵！";
			}else{
				$ch = "重邮小小鸟";
				$yjh = "初来乍到的你要在学校多飞飞吖。";
			}
			
			$add= array(
				'name' => $name,
				'count' => $count
			);
			
			
			if($all==15){		
				D('rank')->add($add);
				$data = array(
						'ch' => $ch,
						'grade' => $count,
						'yjh' => $yjh,
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
	
	
}




