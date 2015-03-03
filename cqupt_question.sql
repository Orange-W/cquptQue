/*
Navicat MySQL Data Transfer

Source Server         : me
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : cqupt_question

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2015-03-03 16:45:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `qid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `ans_A` varchar(50) NOT NULL,
  `ans_B` varchar(50) NOT NULL,
  `ans_C` varchar(50) NOT NULL,
  `ans_D` varchar(50) NOT NULL,
  `true_ans` int(1) unsigned NOT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '“太极之夜”指什么？', '青春杯足球赛决赛', '梦想杯足球之夜', '太极杯足球决赛', '迎新杯足球决赛', '1');
INSERT INTO `question` VALUES ('2', '“文峰青年大讲堂”曾邀请到了中国神话电视剧巅峰之作中一位表演者前来讲座，请问这位著名的艺术家是？', '徐少华', '章金莱（六小龄童）', '马德华', '闫怀礼', '2');
INSERT INTO `question` VALUES ('3', '哪个全国大型益智类电视活动节目举办了重邮专场？', '开门大吉', '超级大脑', '职来职往', '天才知道', '4');
INSERT INTO `question` VALUES ('4', '重邮新校门附近的KTV叫？', '好乐迪', '高乐迪', '多乐迪', '享乐迪', '3');
INSERT INTO `question` VALUES ('5', '以下哪些景点不位于重邮附近？', '一棵树', '天坑', '老君洞', '黄葛古道', '2');
INSERT INTO `question` VALUES ('6', '重庆邮电大学有几个大型运动场?', '3个', '4个', '5个', '6个', '1');
INSERT INTO `question` VALUES ('7', '重庆邮电大学草坪音乐会的名称是?', '春华音韵', '邮你发声', '重邮好声音', '黄桷馨声', '4');
INSERT INTO `question` VALUES ('8', '腾飞广场在重庆邮电大学哪个地方：', '老校门', '老操场', '新校门', '三教前', '3');
INSERT INTO `question` VALUES ('9', '重邮传媒艺术学院师生的哪一部原创作品在2010年获得优秀国产动画奖?', '《侠岚》', '《可儿历险记》', '《猫眼小子包达达》', '《怪物山》', '2');
INSERT INTO `question` VALUES ('10', '目前下列哪一个是我校微信人数关注度最高的一个平台？', '重邮小帮手', '重邮微校', '重邮青年', '重庆邮电大学', '1');
INSERT INTO `question` VALUES ('11', '校运会和军训汇演是在哪里进行？', '雨红莲', '老运动场', '新运动场', '腾飞广场', '3');
INSERT INTO `question` VALUES ('12', '由张翰、陈乔恩主演的哪部电影在我校取？', '《至少还有你》', '《至少还有她》', '《至少还有他》', '《至少有你》', '1');
INSERT INTO `question` VALUES ('13', '重邮女生节是哪一天？', '3月5日', '3月6日', '3月7日', '3月8日', '3');
INSERT INTO `question` VALUES ('14', '2014年举办的十大歌手是第几届?', '第十六届', '第十七届', '第十八届', '第十九届', '4');
INSERT INTO `question` VALUES ('15', '开展校内团日活动最集中的室外场地是？', '雨红莲', '太极操场', '风雨操场', '腾飞广场', '1');
INSERT INTO `question` VALUES ('16', '重邮的“五四之星”是每几年评选一次？', '每年', '两年', '三年', '四年', '2');
INSERT INTO `question` VALUES ('17', '每年樱花盛开时，重邮会举办什么节？', '樱花节', '校园文化节', '校园艺术节', '校园音乐节', '2');
INSERT INTO `question` VALUES ('18', '重邮计算机学院在第几教学楼？', '二教', '三教', '四教', '五教', '1');
INSERT INTO `question` VALUES ('19', '校团委在什么地方？', '逸夫楼', '四教', '信科大楼', '新运动场', '4');
INSERT INTO `question` VALUES ('20', '教务处在什么地方？', '二教', '三教', '四教', '五教', '3');
INSERT INTO `question` VALUES ('21', '学校保卫处在什么地方？', '二教', '三教', '老图书馆后面', '数字图书馆后面', '3');
INSERT INTO `question` VALUES ('22', '学生处在什么地方？', '千喜鹤食堂3楼', '新行政楼', '二教', '逸夫楼', '1');
INSERT INTO `question` VALUES ('23', '招生就业处在什么地方？', '新行政楼', '逸夫楼', '信科大楼', '四教', '1');
INSERT INTO `question` VALUES ('24', '档案馆在什么地方？', '数字图书馆', '老图书馆', '信科大楼', '逸夫科技楼', '4');
INSERT INTO `question` VALUES ('25', '学校有几个校门？', '三个', '四个', '五个', '六个', '2');
INSERT INTO `question` VALUES ('26', '校史馆在什么地方？', '信科大楼', '老图书馆', '逸夫楼', '数字图书馆', '3');
INSERT INTO `question` VALUES ('27', '学校开展的“四个一”素质提升活动，”四个一”是指？', '培养一类运动爱好、养成一个读书习惯、坚持一项志愿服务、提升一类表达能力', '培养一类文艺爱好、养成一个读书习惯、坚持一项志愿服务、提升一类表达能力', '培养一类文艺爱好、养成一个运动习惯、坚持一项志愿服务、提升一类学习能力', '培养一类文艺爱好、养成一个运动习惯、坚持一项志愿服务、提升一类表达能力', '4');
INSERT INTO `question` VALUES ('28', '”三走”是指的？', '走下网络、走出宿舍、走向操场', '走下网络、走出宿舍、走向校园', '走出宿舍、走出校园、走向世界', '走下网络、走出寝室、走向图书馆', '1');
INSERT INTO `question` VALUES ('29', '“三爱”是指的？', '爱学习、爱劳动、爱生活', '爱工作、爱劳动、爱祖国', '爱学习、爱长辈、爱祖国', '爱学习、爱劳动、爱祖国', '4');
INSERT INTO `question` VALUES ('30', '老图书馆后面的书吧叫做什么名字？', '池塘书吧', '泥塘书吧', '杏花书吧', '荷塘书吧', '4');
INSERT INTO `question` VALUES ('31', '学校的学生社团有多少个？', '70', '71', '72', '92', '4');
INSERT INTO `question` VALUES ('32', '学校每年的先进班集体和五四评优答辩是在哪个教室？', '2217', '2100', '2117', '2116', '2');
INSERT INTO `question` VALUES ('33', '学校勤工助学中心里负责送饮用桶装水的组织是？', '服务部', '自立水坊', '运送水坊', '搬运水坊', '2');
INSERT INTO `question` VALUES ('34', '校医院在哪个位置？', '留学生楼附近', '三教旁边', '中心食堂附近', '旧校门和重邮宾馆之间', '4');
INSERT INTO `question` VALUES ('35', '第三国际会议厅在哪个地方？', '二教', '三教', '四教', '五教', '2');
INSERT INTO `question` VALUES ('36', '第二国际会议厅在哪个地方？', '三教', '逸夫楼', '信科大厦', '二教', '3');
INSERT INTO `question` VALUES ('37', '“三自”教育是指？', '自我管理，自我教育，自我服务', '自我管理，自我约束，自我教育', '自我教育，自我服务，自我约束', '自我服务，自我管理，自我约束', '1');
INSERT INTO `question` VALUES ('38', '与重邮校园遥相辉映的建筑是？', '文峰塔', '大金鹰', '一棵树观景台', '南山塔', '1');
INSERT INTO `question` VALUES ('39', '重邮关注度最高的官方微信公众平台是？', '重邮小帮手', '重邮生活圈', '重邮微校', '重庆青年', '1');
INSERT INTO `question` VALUES ('40', '学校目前正在扩建的校区是？', '东部校区', '西部校区', '南部校区', '北部校区', '3');
INSERT INTO `question` VALUES ('41', '学校地址是重庆南岸区什么路？', '崇文路', '岩山路', '中山路', '紫阳大道', '1');
INSERT INTO `question` VALUES ('42', '学校毕业季校园大甩卖的二手市场在哪？', '雨红莲', '太极操场周围', '腾飞广场', '风雨操场', '2');
INSERT INTO `question` VALUES ('43', '学校规定晚上几点以后没回寝室属于晚归？', '十一点', '十一点半', '十二点', '十二点半', '2');
INSERT INTO `question` VALUES ('44', '学校最具影响力的学生体育赛事是？', '重邮杯', '迎新杯', '新生杯', '青春杯', '4');
INSERT INTO `question` VALUES ('45', '每学期校领导与师生进行相互交流的活动是？', '校领导网上接待活动', '校园研讨会', '校园接待日', '师生座谈会', '1');
INSERT INTO `question` VALUES ('46', '学校要求借阅图书的时间期限是？', '十天', '半个月', '一个月', '两个月', '4');
INSERT INTO `question` VALUES ('47', '“校园十大歌手赛”是由哪个学生组织承办的？', '校学生会', '社联', '校科技联合会', '红岩网校', '1');
INSERT INTO `question` VALUES ('48', '“文峰青年大讲堂”是由哪个学生组织承办的？', '校学生会', '学生社联', '学生科联', '红岩网校', '3');
INSERT INTO `question` VALUES ('49', '“学霸帮帮忙”活动是由哪个学生组织承办的？', '校学生会', '心理互助中心', '学生社联', '学生科联', '1');
INSERT INTO `question` VALUES ('50', '“学长演播厅”活动是由哪个学生组织承办的？', '校学生会', '学生社团联合会', '阳光校广', '学生科技联合会', '4');
INSERT INTO `question` VALUES ('51', '南山最有名的美食是？', '火锅，泉水鸡', '火锅，脆皮鸡', '泉水鸡，水煮鱼', '肯打鸡，串串香', '1');
INSERT INTO `question` VALUES ('52', '外国语学院在第几教学楼 ？', '二教', '三教', '四教', '五教', '4');
INSERT INTO `question` VALUES ('53', '光电工程学院\\重庆国际半导体学院在第几教学楼？', '老一教', '二教', '三教', '四教', '1');
INSERT INTO `question` VALUES ('54', '软件工程学院在第几教学楼？', '二教', '三教', '四教', '五教', '1');
INSERT INTO `question` VALUES ('55', '国际学院在第几教学楼？', '二教', '三教', '四教', '五教', '4');
INSERT INTO `question` VALUES ('56', '传媒艺术学院在第几教学楼？', '二教', '四教', '四教', '八教', '4');
INSERT INTO `question` VALUES ('57', '体育学院在学校哪个地方？', '二教', '四教', '风雨操场', '新体育场', '3');
INSERT INTO `question` VALUES ('58', '通信与信息工程学院在学校哪个地方？', '三教', '五教', '信科大厦', '逸夫科技楼', '4');
INSERT INTO `question` VALUES ('59', '重庆邮电大学的校训顺序排列正确的是？', '修德  博学  创新  求实', '博学  求实  修德  创新', '修德  博学  求实  创新', '求实  创新  博学  修德', '3');
INSERT INTO `question` VALUES ('60', '学校名称英文简写CQUPT中的P代表什么?', 'people', 'person', 'post', 'posts', '4');
INSERT INTO `question` VALUES ('61', '2015年是重庆邮电大学建校多少周年？', '60年', '62年', '65年', '66年', '3');
INSERT INTO `question` VALUES ('62', '重庆邮电大学官方网站的网址是？', 'WWW.CQUPT.EDU.CN', 'WWW.CQUPA.EDU.CN', 'WWW.CQUPT.ADU.CN', 'WWW.CQUPE.CN', '1');
INSERT INTO `question` VALUES ('63', '重庆邮电大学校徽是由哪三种颜色组成？', '蓝、绿  、黑', '黄、绿、黑', '红、蓝、黑', '白、黑、绿', '2');
INSERT INTO `question` VALUES ('64', '22.重庆邮电大学老校门旁边是什么建筑？', '科技会堂', '信科', '逸夫楼', '1教', '1');
INSERT INTO `question` VALUES ('65', '科技会堂大门前的雕塑名称是？', '夸父追日', '女娲补天', '一柱擎天', '嫦娥奔月', '2');
INSERT INTO `question` VALUES ('66', '重邮首任党委书记、院长、老红军是谁？', '刘宜伦', '郭长波', '刘欢', '郭靖', '2');
INSERT INTO `question` VALUES ('67', '我校刘宜伦老院长曾在哪个国家留学？', '英国', '德国', '美国', '没有出国', '3');
INSERT INTO `question` VALUES ('68', '重庆邮电学院当初在教育部“升大”会议上排名第几通过申请更名为重庆邮电大学？', '第一', '第二', '第三', '第五', '1');
INSERT INTO `question` VALUES ('69', '十五栋的快递接收点能接哪种快递？', '圆通', '中通', '顺丰', '汇通', '1');
INSERT INTO `question` VALUES ('70', '补办一卡通要在什么时间去哪里办理？', '周一至周五，早九点至晚五点，数图一卡通中心', '周一至周五，早八点至晚六点，信科大厦一卡通中心', '周一至周五，早九点至晚五点，信科大厦一卡通中心', '周一至周五，早八点至晚六点，数图一卡通中心', '2');
INSERT INTO `question` VALUES ('71', '重邮的邮政编码？', '400000', '400060', '400062', '400065', '4');
INSERT INTO `question` VALUES ('72', '学校有几块网球场地？', '3块', '4块', '5块', '6块', '3');
INSERT INTO `question` VALUES ('73', '情人坡旁的雕塑是什么形象？', '电话', '电脑', '手机', '校徽', '1');
INSERT INTO `question` VALUES ('74', '哪个食堂的豆浆种类最多？', '好食基', '红高粱', '兴业苑', '中心食堂', '1');
INSERT INTO `question` VALUES ('75', '32栋是？', '男寝', '女寝', '教学楼', '哪来的32栋，你在逗我迈？', '2');
INSERT INTO `question` VALUES ('76', '春华秋实奖学金每年奖励多少钱?', '5000元', '8000元', '3000元', '2000元', '2');
INSERT INTO `question` VALUES ('77', '新生报到地点是？', '雨红莲操场', '老操场', '太极操场', '风雨操场', '4');
INSERT INTO `question` VALUES ('78', '在“八十万”方便时可以顺便去哪家取快递？', '顺丰快递', '圆通', '中通', 'EMS', '4');
INSERT INTO `question` VALUES ('79', '重邮最高的建筑是？', '信科大厦', '3教', '2教', '22栋', '1');
INSERT INTO `question` VALUES ('80', '学校第几教学楼前有喷泉？', '8教', '1教', '3教', '5教', '3');
INSERT INTO `question` VALUES ('81', '请问重邮信科大厦前面的雕塑是哪位著名科学家？', '赫兹', '法拉第', '贝尔', '牛顿', '1');
INSERT INTO `question` VALUES ('82', '请问我校数字图书馆前面的雕塑是哪位著名科学家？', '赫兹', '麦克斯韦', '达尔文', '牛顿', '2');
INSERT INTO `question` VALUES ('83', '重庆邮电大学地理位置最高的宿舍楼是哪一栋？', '22栋', '17栋', '5栋', '32栋', '1');
INSERT INTO `question` VALUES ('84', '重庆邮电大学最古老的宿舍楼是：', '1.2.3栋', '1.5.6栋', '1.7.9栋', '1.4.5栋', '2');
INSERT INTO `question` VALUES ('85', '从重庆邮电大学去南坪需乘坐346，346到南坪的始末车时间为？', '6:00～20:30', '6:00～21:30', '6:30～21:30', '6:30～22:00', '3');
INSERT INTO `question` VALUES ('86', '学校一卡通的统一识别码有几位数?', '6', '7', '8', '9', '2');
INSERT INTO `question` VALUES ('87', '经济类图书借阅室在老图书馆的第几层?', '1楼', '2楼', '3楼', '4楼', '1');
INSERT INTO `question` VALUES ('88', '学校共设有几个银行的自动取款机?', '3', '4', '5', '6', '2');
INSERT INTO `question` VALUES ('89', '下面哪些热词不属于重邮?', '八十万', '夺命天梯', '乡村基', '皇家邮电', '3');
INSERT INTO `question` VALUES ('90', '哪路公交车的终点站为重邮？', '346', '347', '310', '381', '1');
INSERT INTO `question` VALUES ('91', '重邮校园观光车的票价多少？', '1元', '1.5元', '2元', '免费', '1');
INSERT INTO `question` VALUES ('92', '重庆邮电大学新校门前面的广场叫什么？', '腾飞广场', '涂山湖广场', '黄桷垭广场', '通信广场', '1');
INSERT INTO `question` VALUES ('93', '2005年10月，重庆邮电大学科研人员成功研制出世界上第一颗采用0.13μm工艺设计的TD-SCDMA芯片，得到了广泛的应用，并成功服务2008年奥运会。该芯片叫做？', '通芯一号', '重邮之芯', 'TD芯片', '渝芯一号', '1');
INSERT INTO `question` VALUES ('94', '哪一年，重庆邮电学院更名为重庆邮电大学。', '2005年', '2006年', '2007年', '2008年', '2');
INSERT INTO `question` VALUES ('95', '重邮曾开发出第一个什么而被称为中国“数字通信发源地”。', '符合国际标准的数字通信脉冲编码设备', '符合国际标准的数字通信设备', '符合国际标准的电力线载波通信', '符合国际标准的数字信息设备', '1');
INSERT INTO `question` VALUES ('96', '重邮于哪一年建校？', '1949年', '1950年', '1951年', '1952年', '2');
INSERT INTO `question` VALUES ('97', '下列中哪一项不是属于我校的科研成果？', '新一代控制系统高性能现场总线—EDA', '第三代移动通信标准TD-SCDMA标准', '世界第一块TD—SCDMA基带芯片-“通芯一号', '第四代移动通信标准TD-SCDMA标准', '1');
INSERT INTO `question` VALUES ('98', '重邮被誉为什么的发源地？', '中国数字通信发源地', '中国信息发源地', '中国信息技术', '中国电子科技', '1');
INSERT INTO `question` VALUES ('99', '重庆邮电大学参与制定的第三代移动通信标准是：', 'WCDMA', 'TD-SCDMA', 'CDMA2000', 'CTHD', '2');
INSERT INTO `question` VALUES ('100', '由我校研发世界上第一块工业物联网芯片叫什么？', '渝芯一号', '重邮第一芯', 'YXYH', 'THOM', '1');
INSERT INTO `question` VALUES ('101', '“春华秋实”雕像坐落在校园哪个位置。', '3教', '2教', '四教', '逸夫楼', '2');
INSERT INTO `question` VALUES ('102', '重庆邮电大学又被称作什么？', '中国信息通信人才的摇篮', '中国电子信息人才的摇篮', '中国电子通信人才的摇篮', '中国信息技术人才的摇篮', '1');
INSERT INTO `question` VALUES ('103', '2008年，由我校牵头的“TD-SCDMA终端芯片平台关键技术”项目荣获什么奖项？', '国家科技发明二等奖', '国家创新发明二等奖', '国家科技创新二等奖', '国家创新发明奖一等奖', '1');
INSERT INTO `question` VALUES ('104', '我校在“挑战杯”中国大学生创业计划竞赛中获得的好成绩是？', '金奖', '特等奖', '夺得“挑战杯”', '累计创新金奖', '1');
INSERT INTO `question` VALUES ('105', '学校里专做水果服务，荣获“五四之星—创业之星”的团队是？', '菜小二团队', '咖啡猫团队', '果盘团队', '绿色果园团队', '1');
INSERT INTO `question` VALUES ('106', '我校学生陈琦所拍摄的哪部微电影在第三届国际大学生微电影盛典上获得大奖？', '《芦山纪》。', '《假期历险记》', '《最初的梦想》', '《初阳》', '1');
INSERT INTO `question` VALUES ('107', '由红岩网校工作站开发，目前为校内最大资源共享平台，视频电影、学习资源下载中心的网站叫什么？', 'BT  Down铺', '软件中心', '红岩网校', '香奈儿音乐', '1');
INSERT INTO `question` VALUES ('108', '重庆邮电大学现共有多少个学院？', '10', '20', '13', '15', '4');
INSERT INTO `question` VALUES ('109', '重邮什么时候获得了博士学位授予单位?', '2011', '2012', '2013', '2014', '3');
INSERT INTO `question` VALUES ('110', '“重邮第一蛋”多少钱？', '1元', '1.5元', '2元', '0.5元', '2');
INSERT INTO `question` VALUES ('111', '以下几个学院哪个不是重庆邮电大学的？', '法学院', '国际半导体学院', '公共管理学院', '生物信息学院', '3');
INSERT INTO `question` VALUES ('112', '新校门正对的的教学楼是几教？', '3教', '4教', '5教', '8教', '1');
INSERT INTO `question` VALUES ('113', '下面哪个学院不是重邮开设的?', '移动学院', '法学院', '光电学院', '体育学院', '1');
INSERT INTO `question` VALUES ('114', '学校在新生党员中成立的班级叫?', '长波班', '宜伦班', '红岩班', '雷锋班', '1');
INSERT INTO `question` VALUES ('115', '以下哪一个不是我校的学生组织（）?', '校学生会', '学生消防队', '校学生科技联合会', '校学生宿舍自我管理与服务委员会', '2');
INSERT INTO `question` VALUES ('116', '我校的社团活动有很多，那么请问哪一类的社团活动最多呢？', '理论学习', '实践技能', '体育竞技', '信息技术', '2');
INSERT INTO `question` VALUES ('117', '传说中的重邮天梯在什么地方？', '老校门  ', '五栋  ', '红高粱旁边   ', '三教门前', '3');
INSERT INTO `question` VALUES ('118', '我校现有几个一级学科博士授予点?', '2', '3', '4', '5', '1');
INSERT INTO `question` VALUES ('119', '学校地处于重庆主城南山风景区内，坐落在森林公园环抱之中,共占地（）亩？', '3600', '3000', '3800', '4600', '3');

-- ----------------------------
-- Table structure for `rank`
-- ----------------------------
DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank` (
  `rid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(8) NOT NULL,
  `count` int(2) unsigned NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rank
-- ----------------------------
INSERT INTO `rank` VALUES ('1', '哈哈`', '1');
INSERT INTO `rank` VALUES ('2', 'admin', '0');
INSERT INTO `rank` VALUES ('3', '战五渣', '1');
INSERT INTO `rank` VALUES ('4', 'BBB', '1');
INSERT INTO `rank` VALUES ('5', '石喵', '1');
INSERT INTO `rank` VALUES ('6', '咬碎', '2');
