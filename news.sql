/*
 Navicat Premium Data Transfer

 Source Server         : lijinghuan
 Source Server Type    : MySQL
 Source Server Version : 100110
 Source Host           : localhost
 Source Database       : news

 Target Server Type    : MySQL
 Target Server Version : 100110
 File Encoding         : utf-8

 Date: 03/16/2018 13:21:22 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_fire`
-- ----------------------------
DROP TABLE IF EXISTS `t_fire`;
CREATE TABLE `t_fire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newstitle` varchar(255) DEFAULT NULL,
  `img_src` varchar(255) DEFAULT NULL,
  `content` text,
  `newstime` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_fire`
-- ----------------------------
BEGIN;
INSERT INTO `t_fire` VALUES ('1', '张三考上了北大', null, '在偶尔有一个能够凭借着加分考上清北的学生就够全县人民茶余饭后谈论几年的山区小县城，唯一认识的考上清北的只有我们高中学校的门卫。高中门卫，九十年代清华毕业生，我们都叫他“叔”，据说当年他凭借着全市状元的身份考上清华轰动一时。最开始接触叔，是在操场上体育课的时候，经常可以看到叔翘着二郎腿、点着根烟坐在门卫室里，拿着一堆资料对着一些西装革履的年轻人指指点点。开始还以为门卫工资太低了，所以在兼职做做传销。。。后面和叔慢慢熟起来了，才知道那些都是来找他写稿子的，而叔也说自己是老师当腻了，才来做门卫的。 当时一群中二少年一脸敬仰的听着叔从费尔巴哈的唯物主义讲到泰罗的科学管理。。再后来知道了关于叔的一些传奇。叔，早年毕业于清华大学，在北京混了几年，据说曾显赫一时。后回县城高中当老师，但是叔到底是见过大世面的人，在上课的时候以批评学校、吐槽各级领导为己任，某次考试，叔负责监考，在开考的前二十分钟叔就翘着二郎腿坐在讲台上把试卷写完了，然后就刷刷刷把答案全写在了黑板上，还不忘说一句“这出题水平不行啊！”留下一脸错愕的同学    而后，校领导经过一番深思熟虑终于决定把学校有史以来唯一的清华毕业生调去看校门.\n\n作者：Gil\n链接：https://www.zhihu.com/question/47080172/answer/109375123\n来源：知乎\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '2018-03-12', '1'), ('2', '佛荫镇召开第七届人民代表大会第二次会议', null, '3月12日，四川省合江县佛荫镇召开第七届人民代表大会第二次会议，会议应到代表65人，实到代表63人，非代表的驻镇单位负责人、镇中层干部、非镇代表的各村（社区）干部等61人列席了会议。大会听取、审议并通过了政府工作报告、人大主席团工作报告、财政预决算报告。镇党委书记赖世强主持第一次大会，镇长罗光辉作政府工作报告，镇人大主席黄小兰作人大主席团工作报告，镇财政所所长刘泽红作财政预决算报告。\n会议指出，2017年，佛荫镇在合江县委、县政府和镇党委的正确领导下，在镇人大的监督支持下，主动适应经济发展新常态，及时调整工作重心，以凝心聚力的斗志和攻坚克难的信心，狠下功夫抓脱贫摘帽，下大力气保民生促发展，较好完成了全年目标任务。会议提出了我镇当前经济社会发展仍存在不少困难和问题，要求全镇上下进一步认清形势，采取有力措施认真加以解决。\n会议明确，2018年，镇政府将围绕全镇经济社会发展总体目标，重点抓好以下几个方面的工作：一是坚定不移抓经济建设；二是坚定不移抓农业发展；三是坚定不移抓脱贫攻坚；四是坚定不移抓民生事业；五是坚定不移抓安全稳定；六是坚定不移抓自身建设。\n会议号召，要紧密团结在以习总书记为核心的党中央周围，在镇党委的坚强领导下，以更加饱满的政治热情、更加强烈的责任意识、更加务实的担当精神，不忘初心，牢记使命，为全面建成小康佛荫作出新的更大贡献。\n（罗配东 杨池能）', '2018-03-14', '2'), ('3', '好消息！中国003型核航母与095核潜艇终于成真', null, '好消息！中国003型核航母与095核潜艇终于成真', '2018-03-15', '3'), ('4', '静态扫码每日限额为何是500元？', null, '根据央行规定，使用静态条码支付，同一客户单个银行账户或所有支付账户、快捷支付单日累计交易金额应不超过500元。看到这一规定，有些消费者第一反应就是抱怨额度太低：“以后每天扫码支付不能超过500元了，真不够用啊？”事实上，这是大家的误解。业内人士指出，受500元额度限制的主要是使用静态二维码的街边小商小贩，大部分的扫码支付特别是额度较大的消费还是用动态码多，也就是商家用扫码枪来扫消费者手机上的动态二维码。从以往消费数据来看，500元的限额也完全满足绝大部分消费者的需求。\n\n扫码支付从4月1日起将有章可循。去年年底，央行发布《中国人民银行关于印发〈条码支付业务规范（试行）〉的通知》，配套印发了《条码支付安全技术规范（试行）》和《条码支付受理终端技术规范（试行）》，自2018年4月1日起实施。', '2018-04-01', '4'), ('5', '美国军机“铺路鹰”在伊叙边境坠毁 机上7人恐全遇难', null, '环球网报道 记者 李德意】美国有线电视新闻网(CNN)3月16日称，美国国防部多名官员表示，一架美军HH-60“铺路鹰”直升机在伊拉克西部与叙利亚边界附近坠毁。\n\n　　一名美国国防官员表示，此次坠毁事件“可能导致致命伤亡”，救援队在一小时内已赶到现场。官方人员称，有报道说这架“铺路鹰”载有7人，但并不是执行战斗任务。', '2018-04-02', '5'), ('6', '深夜被喷“大台独” 范玮琪亲上线火速回应', null, '新浪娱乐讯 据台湾媒体报道 平时热心公益的范玮琪[微博]，常在社群网站分享自己生活点滴，不过也因为树大招风，不少一举一动都被网友放大检视，日前一篇关怀“台湾脊髓肌肉萎缩症病友”的发文中，被网友以简体字留言“台独”两字，范玮琪亲上火线回应网友！网友以简体字写下“台独”两两字，范玮琪亲上火线回应该名网友，“我不是台独”，而该名网友再次简体字响应“所以你是中国人？”这段对话引起网友关注，该名网友再次留言，“范玮琪是大台独，她都不敢承认自己是中国人，跑到中国去圈钱。”', '2018-04-13', '6'), ('7', '最强175再公开表态不打替补 湖人主帅这样回应', null, '北京时间3月16日，据《今日美国》报道，自从被交易到湖人队之后，伊赛亚-托马斯一直担任替补，但是他在近日接受采访时明确表示：“我不是第六人！”\n\n　　“我不是一个第六人。”托马斯表示，“今后，我不会成为一个第六人。我只想让每个人都知道这点，我是一位两届NBA全明星球员，以及一个NBA首发球员，当我获得机会的时候，我在场上做到了很多人都无法做到的事情。”\n\n　　“但是我被交易到这里，这是我无法控制的。我对卢克-沃顿和湖人队没有任何意见，我会抓住他们给我提供的每一个机会，然后我们会以很好的表现结束这个赛季。这是我能做到的。我来这里不会说：‘噢，我想要这个，或者这将会发生。’不，那不是我。我会在这里表现得职业。当我的名字被叫到时，我将会做好充分的准备。”\n\n　　自从全明星周末之后，托马斯场均得到18.4分和5.8次助攻，湖人在过去11场比赛里赢了8场，但直到昨天湖人客场打勇士，托马斯才担任首发，而那是因为库兹玛因伤缺阵。', '2018-04-15', '7');
COMMIT;

-- ----------------------------
--  Table structure for `t_news_list`
-- ----------------------------
DROP TABLE IF EXISTS `t_news_list`;
CREATE TABLE `t_news_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newstitle` varchar(255) DEFAULT NULL,
  `newstime` varchar(255) DEFAULT NULL,
  `newstype` varchar(255) DEFAULT NULL,
  `img_src` varchar(255) DEFAULT NULL,
  `comment_number` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_news_list`
-- ----------------------------
BEGIN;
INSERT INTO `t_news_list` VALUES ('1', '黑龙江大学', '2018-02-12', '1', null, '0', '黑龙江大学（Heilongjiang University），诞生于1941年，前身是在延安成立的中国人民抗日军政大学第三分校。教育部、国防科工局与黑龙江省全国重点建设大学[1]  ，全国首批“卓越法律与新闻人才教育培养计划”、“海外高层次人才引进计划”、“ 国家建设高水平大学公派研究生项目”、“教育部来华留学示范基地”入选高校。“世界翻译教育联盟”、“中俄新闻教育高校联盟”创始成员，“中俄大学联盟”、“上海合作组织大学(KHP)”主要成员、“一带一路”智库合作联盟理事单位。中国政府奖学金来华留学生接收院'), ('2', '哈尔滨', '2018-02-13', '1', null, '0', '哈尔滨，黑龙江省省会、副省级市、特大城市、中国东北地区中心城市之一，哈尔滨都市圈核心城市，是东北北部交通、政治、经济、文化、金融中心，也是中国省辖市中陆地管辖面积最大、户籍人口居第三位的特大城市，地处中国东北平原东北部地区、黑龙江省南部，国家重要的制造业基地[1]  。截至2015年，哈尔滨总面积5.31万平方公里，市辖区面积10198平方公里，辖9个市辖区、7个县，代管2个县级市，常住人口1066.5万人。\n哈尔滨地处东北亚中心地带，被誉为欧亚大陆桥的明珠，是第一条欧亚大陆桥和空中走廊的重要枢纽，也是中'), ('3', '东北三省', '2018-02-21', '1', null, '0', '东北三省又称“东三省”，为东北清朝末年以后的三个行政区，与地理文化上的东北地区没有关系，只是东北地区其中三个省级行政单位的总称不同时期，其名称和范围有所变化。在当代中国，东北三省为辽宁省、吉林省和黑龙江省。长期以来，其范围不等同于中国东北地区。'), ('4', '河北咋的了', '2018-03-12', '2', null, '0', '河北省，简称“冀”，因位于黄河以北而得名。地处华北平原，东临渤海、内环京津，西为太行山，北为燕山，燕山以北为张北高原。河北地处中原地区，文化博大精深，自古有“燕赵多有慷慨悲歌之士”之称，是英雄辈出的地方。[1] \n河北省下辖石家庄、唐山、秦皇岛、邯郸、邢台、保定、张家口、承德、沧州、廊坊、衡水等11个地级市，省会为石家庄。全省总人口7185万，总面积18.88万平方千米，是中国唯一兼有高原、山地、丘陵、盆地、平原、草原和海滨的省份，属温带季风气候。'), ('5', '河南丢井盖', '2018-03-02', '2', null, '0', '题主被河南人偷过，抑或是骗过？我希望一切以眼见为实，不要听别人去说，尤其是擅长地域攻击的人胡扯。天涯论坛里面一群争论光年是速度单位还是时间单位的智商捉急喷子们是最擅长讲这些无聊的话题的，所以少听为妙。以前以为东北人豪放，山东人义气，南方人刻薄等等，但是真正接触他们以后发现，天南海北除了口音不同，人的性格，行为都是形形色色的，完全感受不到有什么地域区分。所以我想说，看人，以人为准，以眼见为准，切莫以道听途说为评判标准（若如此，你还不如去研究星座呢）。你说的河南人是不是爱偷东西，作为一个河南人，我说河南的确有'), ('6', '马航坠机', '2017-09-21', '3', null, '0', '马航乘客死得惨呢'), ('7', '习近平讲话', '2017-07-09', '4', null, '0', '习大大厉害'), ('8', '这是毕业设计', '2018-02-11', '5', null, '0', '嗯，这是很牛逼的SPA单页面app技术'), ('9', '我在考公务员', '2018-03-15', '6', null, '0', '考公务员很累'), ('10', '我在写代码', '2018-03-19', '7', null, '0', '两天的挑灯夜战终于要做完了');
COMMIT;

-- ----------------------------
--  Table structure for `t_recommend`
-- ----------------------------
DROP TABLE IF EXISTS `t_recommend`;
CREATE TABLE `t_recommend` (
  `id` int(11) NOT NULL,
  `newstitle` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `img_src` varchar(255) DEFAULT NULL,
  `newstime` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_recommend`
-- ----------------------------
BEGIN;
INSERT INTO `t_recommend` VALUES ('1', '	这个行业人员需求1000万 仅有30万人具备从业资格', '截至2016年底，我国60岁以上的老年人口接近2.4亿。\n\n　　其中，失能、半失能老人约4063万人。??\n\n　　按国际惯例，每3位老人需要1名护理人员。??‍⚕️\n\n　　以我国4000万失能老人为基数测算，\n\n　　护理人员需求约在1000多万人，\n\n　　然而目前全国只有30万人取得护理员资格证！\n\n　　就我国养老护理员缺乏该如何破解\n\n　　提问全国政协委员李萌娇、陈德\n\n　　委员们如何看待这一问题？\n\n　　全国政协委员李萌娇、陈德认为国家应该统筹考虑，推进护工职业化建设。社会应该增加社区的服务功能、养老', null, '2018-03-15', '0'), ('2', '	315晚会刚结束 多家被曝光的企业就被查处', '就在刚刚，2018年“3·15”晚会结束，多家企业被曝光！央视财经记者与执法人员第一时间奔赴涉事企业现场，现已有多家企业被查封。此外，大众汽车已公开致歉。\n\n　　点赞！这就是3·15速度！', null, '2018-03-16', '0'), ('3', '	老人发现准女婿是亲生儿子 女儿鉴定结果更震惊', '神剧情！准女婿竟是自己亲生儿子，女儿的鉴定结果更震惊！\n\n　　独生女儿就要和\n\n　　邻村的小伙订婚了\n\n　　可在双方父母见面的时候，\n\n　　郭老汉发现亲家母\n\n　　竟然是自己的初恋女友\n\n　　而准女婿竟然跟年轻时的自己\n\n　　长得那么像…\n\n　　小编整理出了文字版\n\n　　郭大爷的独生女儿郭秀\n\n　　和邻村的小伙子王友志订婚\n\n　　孩子订婚，\n\n　　本是家里非常重要的一件喜事\n\n　　可谁知竟然出现了\n\n　　意想不到的事情\n\n　　在友志把妈妈介绍\n\n　　给郭秀父母的时候\n\n　　尽管20多年过去了 \n\n　　郭大', null, '2018-03-15', '0'), ('4', '这部目前中国最火的电影 干出一件惹怒美国人的事', '目前在中国的电影院里，6天前才刚上映的美国超级英雄电影《黑豹》无疑是此刻电影票房中最火爆的一部，在上映仅两天的时候就已经创下了3亿元的票房记录。而在美国，这部电影的表现更是因为“黑人超级英雄”的标签而获得了强大的政治加持，在票房上狂砍5亿美元，全球票房也已突破了10亿美元。', null, '2018-03-15', '0'), ('5', '	霍金一生回顾：1岁到75岁生命里的重要时刻', '霍金21岁时患上肌肉萎缩性侧索硬化症（渐冻人症），导致全身瘫痪，不能言语，手部只有三根手指可以活动，但他并没有屈服于病魔。其1979至2009年任卢卡斯数学教授，主要研究领域是宇宙论和黑洞。他证明了广义相对论的奇性定理和黑洞面积定理，提出了黑洞蒸发理论和无边界的霍金宇宙模型，在统一20世纪物理学的两大基础理论——爱因斯坦创立的相对论和普朗克创立的量子力学方面走出了重要一步。获得CH(英国荣誉勋爵)、CBE(大英帝国司令勋章)、FRS(英国皇家学会会员)、FRSA(英国皇家艺术协会会员)等荣誉。\n\n霍金21', null, '2018-03-17', '0');
COMMIT;

-- ----------------------------
--  Table structure for `t_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_type`
-- ----------------------------
BEGIN;
INSERT INTO `t_type` VALUES ('1', '生活'), ('2', '政治'), ('3', '军事'), ('4', '科技'), ('5', '国际'), ('6', '娱乐'), ('7', '体育');
COMMIT;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('1', '18745708406', 'lijinghuan'), ('2', '18745708400', 'lijinghuan'), ('3', '18745708401', 'lijinghuan');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;