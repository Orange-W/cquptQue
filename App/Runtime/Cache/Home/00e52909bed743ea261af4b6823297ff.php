<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>重邮知多少</title>
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="/ThinkPHP/ThinkPHP-Item/cquptQue/Public/css/index.css">	
</head>
<body>
	<div id="contain">
		<div class="cell">
			<div class="title" >
				<span class="big">游戏规则</span>
				<span>本次测试共15题</span>
				<span>每题10分，共150分</span>
			</div>
			<div class="start"></div>
			<div class="rank"></div>
		</div>
		<div class="cell" id="res">
			<div class="title">
				<span class="score"></span>
				<span class="honour"></span>
			</div>
			<div class="share"></div>
			<div class="rank"></div>
		</div>
	</div>
</body>
<script src="/ThinkPHP/ThinkPHP-Item/cquptQue/Public/js/zepto.min.js"></script>
<script type="text/javascript">
	//ajax
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if((xhr.status == 200 && xhr.status < 300) || xhr.status==304){
				var data = eval('('+xhr.responseText+')');
				var question,qid,ans_A,ans_B,ans_C,ans_D;
				console.log(data);
				for(var i = 0;i < 15;i++){
					question = data.data[i].question;
				 	qid = data.data[i].qid;
					ans_A = data.data[i].ans_A;
					ans_B = data.data[i].ans_B;
					ans_C = data.data[i].ans_C;
					ans_D = data.data[i].ans_D;
					var cell = document.createElement('div');
					var title = document.createElement('div');
					var que = document.createElement('p');
					var A = document.createElement('div');
					var B = document.createElement('div');
					var C = document.createElement('div');
					var D = document.createElement('div');
					que.innerHTML = "第"+(i+1)+"题</br>"+question;
					que.setAttribute('class',qid);
					A.innerHTML = "A、"+ans_A;
					B.innerHTML = "B、"+ans_B;
					C.innerHTML = "C、"+ans_C;
					D.innerHTML = "D、"+ans_D;
					document.getElementById('contain').insertBefore(cell,document.getElementById('res'));
					cell.setAttribute('class','cell');
					cell.appendChild(title);
					title.appendChild(que);
					title.setAttribute('class','title');
					cell.appendChild(A);
					cell.appendChild(B);
					cell.appendChild(C);
					cell.appendChild(D);
					A.setAttribute('class','ans');
					B.setAttribute('class','ans');
					C.setAttribute('class','ans');
					D.setAttribute('class','ans');
				}
				//开始游戏
				$('.start').on('touchend',function(){
					move();
				});
				//答题
				$('.ans').on('touchstart',function(){
					$(this).css('background-image',"url(/ThinkPHP/ThinkPHP-Item/cquptQue/Public/img/on.png)");
				});
				$('.ans').on('touchend',function(){
					var q = {};
					q.true_ans = ""+$(this).index()+"";
					q.qid = $(this).parent().find('p').attr('class');
					putdata.content.push(q);
					if($(this).parent().index() == 15){
						$.ajax({
  							type: 'POST',
						  	url: '<?php echo ($answerApi_url); ?>',
						  	dataType:'json',
						  	data: "type=getGrade&key=86b4359bdfdefb5b21d6260476087062&content="+JSON.stringify(putdata.content),
						  	success: function(data){
						  		console.log(data);
						  		$('.score').text('答对'+data.grade+'道题');
						  		$('.honour').text('恭喜获得 \"'+data.ch+'\" 称号');
						  		move();
						  	},
						  	error: function(xhr, type){
    							$('.score').text('获取分数失败!');
						  		move();
 							}
						});
					}else{
						move();
					}
				});
			}else{
				alert("获取数据失败！")
			}
		}
	}
	xhr.open("post","<?php echo ($questionApi_url); ?>",true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send("type=getContent&key=86b4359bdfdefb5b21d6260476087062");
	
	//move
	function move(){
		var left = document.body.scrollLeft;
		var timer = setInterval(function(){
			var speed = ($('.cell').width()+left-document.body.scrollLeft)/10;
			if(speed == 0.1){
				document.body.scrollLeft +=1;
			}else if(speed>1){
				document.body.scrollLeft += Math.ceil(speed);
			}else{
				document.body.scrollLeft += Math.ceil(speed+1);
			}
			if(document.body.scrollLeft%$('.cell').width() == 0){
				clearInterval(timer);
			}
		},1);
	}
	//json
	var putdata = {
		content : [],
	}
	//p
</script>
</html>