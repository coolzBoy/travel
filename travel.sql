-- phpMyAdmin SQL Dump
-- version 4.4.15.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-07-29 11:07:24
-- 服务器版本： 5.5.48-MariaDB
-- PHP Version: 7.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel`
--

-- --------------------------------------------------------

--
-- 表的结构 `tr_access`
--

CREATE TABLE IF NOT EXISTS `tr_access` (
  `aid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `name` char(32) NOT NULL,
  `idname` char(32) DEFAULT NULL,
  `icon` char(32) DEFAULT NULL,
  `url` text,
  `discription` text
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_access`
--

INSERT INTO `tr_access` (`aid`, `pid`, `name`, `idname`, `icon`, `url`, `discription`) VALUES
(1, 0, '资讯管理', 'menu-article', '&#xe616;', '', NULL),
(2, 0, '图片管理', 'menu-picture', '&#xe613;', '', NULL),
(3, 0, '景区管理', 'menu-product', '&#xe620;', '', NULL),
(4, 0, '特产管理', 'menu-product', '&#xe620;', '', NULL),
(5, 0, '订单管理', 'menu-comments', '&#xe622;', '', NULL),
(6, 0, '评论管理', 'menu-comments', '&#xe622;', '', NULL),
(7, 0, '会员管理', 'menu-member', '&#xe60d;', '', NULL),
(8, 0, '管理员管理', 'menu-admin', '&#xe62d;', '', NULL),
(9, 0, '系统统计', 'menu-tongji', '&#xe61a;', '', NULL),
(10, 0, '系统管理', 'menu-system', '&#xe62e;', '', NULL),
(11, 1, '资讯管理', NULL, NULL, '', NULL),
(12, 2, '图片管理', NULL, NULL, '/admin/picture/picture_list', NULL),
(13, 3, '分类管理', NULL, NULL, '/admin/scenery/scenery_category', NULL),
(14, 3, '景点管理', NULL, NULL, 'admin/scenery/scenery_list', NULL),
(15, 4, '分类管理', NULL, NULL, 'admin/goods/goods_category', NULL),
(16, 4, '产品管理', NULL, NULL, '\r\nadmin/goods/goods_list', NULL),
(17, 5, '订单列表', NULL, NULL, '/admin/order/order_list', NULL),
(18, 6, '文章评论', NULL, NULL, 'admin/comment/comment_list', NULL),
(19, 6, '商品评论', NULL, NULL, '', NULL),
(20, 7, '会员列表', NULL, NULL, '/admin/user/user_list', NULL),
(21, 7, '等级管理', NULL, NULL, '/admin/user/user_grade', NULL),
(22, 8, '角色管理', NULL, NULL, '/admin/users/admin_role', NULL),
(23, 8, '权限管理', NULL, NULL, '/admin/users/admin_permission', NULL),
(24, 8, '管理员列表', NULL, NULL, '\r\n/admin/users/admin_list', NULL),
(25, 9, '产品统计', NULL, NULL, '', NULL),
(26, 9, '销售统计', NULL, NULL, '', NULL),
(27, 10, '关闭站点', NULL, NULL, '', NULL),
(28, 10, '系统日志', NULL, NULL, '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tr_account`
--

CREATE TABLE IF NOT EXISTS `tr_account` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `money` int(32) NOT NULL COMMENT '消费金额',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消费时间',
  `shopinfo` text NOT NULL COMMENT '购买信息'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_account`
--

INSERT INTO `tr_account` (`id`, `uid`, `money`, `time`, `shopinfo`) VALUES
(1, 2, 160, '2017-07-13 13:19:29', '购买葡萄2斤，到天安门2日游');

-- --------------------------------------------------------

--
-- 表的结构 `tr_address`
--

CREATE TABLE IF NOT EXISTS `tr_address` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `address` text NOT NULL COMMENT '收货详细地址',
  `phone` text NOT NULL COMMENT '电话',
  `consignee` text NOT NULL COMMENT '收货人'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_address`
--

INSERT INTO `tr_address` (`id`, `uid`, `address`, `phone`, `consignee`) VALUES
(1, 3, '北京市海淀区天丰利', '13668666766', '小峰'),
(2, 1, '北京市海淀区宝盛里666', '13012341234', '小明');

-- --------------------------------------------------------

--
-- 表的结构 `tr_admin`
--

CREATE TABLE IF NOT EXISTS `tr_admin` (
  `uid` int(11) NOT NULL,
  `username` char(32) NOT NULL COMMENT '管理员名',
  `password` text NOT NULL COMMENT '密码',
  `phone` text COMMENT '手机号',
  `mail` text COMMENT '邮箱',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_admin`
--

INSERT INTO `tr_admin` (`uid`, `username`, `password`, `phone`, `mail`, `status`, `addtime`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '17610828959', '123@qq.com', 0, '2017-07-25 02:00:27'),
(3, 'admin2', 'e10adc3949ba59abbe56e057f20f883e', '18866886688', '68@68.com', 1, '2017-07-25 04:01:55'),
(7, 'admin666', 'e10adc3949ba59abbe56e057f20f883e', '13012341234', '123@66.com', 1, '2017-07-25 08:13:21'),
(8, 'cool', 'e10adc3949ba59abbe56e057f20f883e', '16868686688', '12@66.com', 1, '2017-07-25 10:57:50');

-- --------------------------------------------------------

--
-- 表的结构 `tr_admin_role`
--

CREATE TABLE IF NOT EXISTS `tr_admin_role` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_admin_role`
--

INSERT INTO `tr_admin_role` (`id`, `uid`, `rid`) VALUES
(1, 1, 1),
(3, 3, 3),
(7, 7, 2),
(8, 8, 2);

-- --------------------------------------------------------

--
-- 表的结构 `tr_artcle`
--

CREATE TABLE IF NOT EXISTS `tr_artcle` (
  `aid` int(11) NOT NULL,
  `title` text NOT NULL,
  `author` char(32) NOT NULL,
  `note` text NOT NULL,
  `content` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture` text
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_artcle`
--

INSERT INTO `tr_artcle` (`aid`, `title`, `author`, `note`, `content`, `time`, `picture`) VALUES
(8, '感大自然奇、游张家界景、自助游详细实用的旅游攻略+心情', 'tony', '做好一切出行准备，出发~~张家界', '<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; word-wrap: break-word;"><span style="font-size:16px">有一个地方，是梦中飘渺的仙境；&nbsp;<br/>有一个地方，远离城市喧嚣，遇见最初的自己；&nbsp;&nbsp;<br/>有一个地方，一直躺在旅行清单里，来到之后却说不出再见；&nbsp;&nbsp;<br/>这个地方，叫张家界&nbsp;<br/>提起张家界武陵源，景色之美我想不用多说了，独特地貌形成的绝美景观，别说是中国，在全世界都是独一无二的。在国内，没有人文历史，光凭景色就可以独步江湖的大景区，好像并不多。&nbsp;<br/><br/>出发前在网上翻看了N多的自助游，自由行等等不下100篇攻略，什么10块钱打的到森林公园门票站，什么50块钱一晚的住宿，什么门票折扣8折的……&nbsp;<br/><br/>到了张家界之后发现这一切都确确实实存在，但是这些全是骗人的！&nbsp;<img src="http://www.lgjzyx.com/editor/sysimage/emot/48.gif" style="border: 0px; vertical-align: middle;"/><br/><br/>要么大部分写游记的人就都尽量展现美好的一面，却忽略了一些负面的信息，其实这些信息对大家的帮助才是最大的。在此，我依然延续自己的风格，尽量还原一个真实的张家界之行。也是我写出这篇游记的初衷！&nbsp;&nbsp;<br/><br/>下面看我亲身经历的张家界自助游旅程攻略型游记吧！&nbsp;<br/>按照老规矩，先来几张张家界美图吸引一下看官们的眼球！<img src="http://www.lgjzyx.com/editor/sysimage/emot/38.gif" style="border: 0px; vertical-align: middle;"/><br/><img border="0" src="http://www.lgjzyx.com/editor/UploadFile/2017714161715385.jpg" style="border: 0px; vertical-align: middle;"/><br/><span style="font-family:Verdana">回家后女儿告诉我说，金鞭溪是最好玩的地方，因为可以玩水，晕！</span><br/><img border="0" src="http://www.lgjzyx.com/editor/UploadFile/2017714161620807.jpg" style="border: 0px; vertical-align: middle;"/><br/>天门山栈道<br/><img border="0" src="http://www.lgjzyx.com/editor/UploadFile/201771416184565.jpg" style="border: 0px; vertical-align: middle;"/><br/>天子山<br/><img border="0" src="http://www.lgjzyx.com/editor/UploadFile/2017714161848696.jpg" style="border: 0px; vertical-align: middle;"/><br/>大观台日出<br/><img border="0" src="http://www.lgjzyx.com/editor/UploadFile/201771416193739.jpg" style="border: 0px; vertical-align: middle;"/><br/>张家界森林公园</span></p><h2 class="t1" style="margin: 0px; padding: 0px; font-size: 22px; height: 86px; background-image: url(&quot;../images/t1.gif&quot;); background-position: 0px 0px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; overflow: hidden; color: rgb(68, 68, 68); font-weight: normal;"><span style="line-height: 95px; display: block;">费用简介&amp;行前计划</span></h2><p><span style="font-size:16px">为什么出行我们会选择张家界呢？<img src="http://www.lgjzyx.com/editor/sysimage/emot/23.gif" style="border: 0px; vertical-align: middle;"/><br/><br/>远离城市的喧闹，寻找心灵的净土。豪气一把来呼吸5美元一升的森林氧！这样一算还是赚着回去呢！BUT,看过不少攻略都说张家界武陵源风景区面积特别大，森林公园就有264平方公里，各种各样的小景点比较分散，路线稍微复杂，路线图看的头都晕掉。于是出发前想到网上找当地人给我们做个行程规划！因为假期只有三天的时间，不想浪费太多时间，也是因为上班没有时间去自己做太多的攻略！更不希望到张家界后被拉客骗客的所忽悠！经过几番查找和比较，最后我们选择了网上好评很多的张家界旅管家自由行的行程规划师——小梅。她根据我们的时间给我们安排了张家界最核心的景区，森林公园杨家界、天子山、袁家界+天门山玻璃栈道&nbsp;刺激三日游！从量身定制好我们的行程，到安排吃住行，全程一条龙服务的方式省心省事，全程纯玩无购物！&nbsp;<br/><br/></span><span style="font-size:16px"><span style="color:#f70938">温馨提示：<img src="http://www.lgjzyx.com/editor/sysimage/emot/21.gif" style="border: 0px; vertical-align: middle;"/><img src="http://www.lgjzyx.com/editor/sysimage/emot/21.gif" style="border: 0px; vertical-align: middle;"/>&nbsp;<br/><br/>去张家界的火车上以就会有很多非法拉客人员，很多拉客者一眼就能辨别你是否是一位来张家界的旅游者，以低价旅游的诱惑，极尽宣传吹嘘自己，好像本事通天，张家界的所有东西由他们买都巨便宜。最后把客转交到旅行社，游玩行程中的景点少，推荐的景点多，强制自费进店购物，丧失出来旅行的真正乐！<img src="http://www.lgjzyx.com/editor/sysimage/emot/49.gif" style="border: 0px; vertical-align: middle;"/>特别是自驾车的朋友应该深有体会，路上经常遇到很多各色样式的人向你招手，有的甚至穿成交警制服。最好提前在网上预订好，我们选择的旅管家自由行就很不错。三天两晚豪华享受1130元/人，（包含了森林公园门票248元/人、天门山玻璃栈道门票258元/人，两晚的住宿，用餐，张家界的交通，导游保险等服务费用。）价格透明，收费合理，服务特别好，提供免费接送站，我们在旅途中遇到的问题联系他们都得到了及时的解决。&nbsp;<img src="http://www.lgjzyx.com/editor/sysimage/emot/26.gif" style="border: 0px; vertical-align: middle;"/><br/></span><br/>由于我们在第三天行程结束之后还在张家界休息了一晚才返程，当天晚上去观看了大型的实景演出：天门狐仙。表演票+接送本来每个人是238元。，<span style="font-family:Verdana">但是导游阿哥190就帮我们搞定了。<img src="http://www.lgjzyx.com/editor/sysimage/emot/17.gif" style="border: 0px; vertical-align: middle;"/><img src="http://www.lgjzyx.com/editor/sysimage/emot/19.gif" style="border: 0px; vertical-align: middle;"/></span><br/><br/><br/>关于住宿&nbsp;&nbsp;<br/><br/>（这个是行程中的亮点）&nbsp;<br/><img border="0" src="http://www.lgjzyx.com/editor/UploadFile/201771416247583.jpg" style="border: 0px; vertical-align: middle;"/><br/>说到这里，忍不住先秀秀小梅给我们安排的景区霸气吊脚楼！离看日出的地方也非常近哦！&nbsp;<img src="http://www.lgjzyx.com/editor/sysimage/emot/18.gif" style="border: 0px; vertical-align: middle;"/><img src="http://www.lgjzyx.com/editor/sysimage/emot/21.gif" style="border: 0px; vertical-align: middle;"/><img src="http://www.lgjzyx.com/editor/sysimage/emot/17.gif" style="border: 0px; vertical-align: middle;"/><br/>全程住宿都是包含在套餐之内的，第一晚住景区特色客栈（看日出、日落实在是非常方便）；第二晚入住张家界市区酒店（可以逛逛大张家界的夜市，横扫小吃一条街哦！）；最后一天行程结束要导游阿哥给我们在张家界市区酒店续住了一个晚上，标间150RMB&nbsp;<br/><br/><br/>关于吃饭<img src="http://www.lgjzyx.com/editor/sysimage/emot/25.gif" style="border: 0px; vertical-align: middle;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>张家界旅管家自由行套餐以包含2早3正餐，导游阿哥介绍我们吃了一次张家界当地特色的——胡师傅三下锅100元左右&nbsp;价格还是比较实惠，味道也蛮好！三下锅：腊肉、豆腐、萝卜一锅炖，叫作“合菜”，吃了好上路。这道菜以后演变成“三下锅”。&nbsp;<br/>导游阿哥介绍的是这个意思，但我们吃的其实是由猪的内脏组合而成的菜。&nbsp;<img src="http://www.lgjzyx.com/editor/sysimage/emot/50.gif" style="border: 0px; vertical-align: middle;"/><br/><img border="0" src="http://www.lgjzyx.com/editor/UploadFile/2017714162510628.jpg" style="border: 0px; vertical-align: middle;"/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<br/>一起是三天两晚：全程人均约花费1000RMB左右&nbsp;还真是性价比高啊&nbsp;<img src="http://www.lgjzyx.com/editor/sysimage/emot/09.gif" style="border: 0px; vertical-align: middle;"/>&nbsp;&nbsp;<br/><br/>&nbsp;回来之后很多朋友一直在问我张家界旅管家自由行的联系方式，这里我把当时给我做行程规划小梅美女的微信二维码添加上，大家可以直接扫一扫哦！~~~(善良、贴心的土家妹子一枚）当然公布之前也已经通过了小梅的同意！<img src="http://www.lgjzyx.com/editor/sysimage/emot/18.gif" style="border: 0px; vertical-align: middle;"/>（希望能够帮助到像我一样工作忙，没有太多时间做攻略的人或者是懒得做攻略的人！）&nbsp;<br/><br/></span><span style="color:#dd226d;font-size:16px">如果你也跟我一样不会规划，又想要一场性价比最高最嗨的旅行赶紧联系张家界旅管家自由行金牌行程规划师小梅吧！<span style="color:#2222dd">电话\\微信：17397265181</span>（ps：当然已经取得了小梅的同意才公布的，当时我就是联系她规划的，吃住行订票全程安排好，你只负责玩嗨就行，幽默实在、土家妹子一枚！~）<br/><img border="0" src="http://www.lgjzyx.com/editor/UploadFile/2017714163211820.jpg" style="border: 0px; vertical-align: middle;"/></span></p><h2 class="t1" style="margin: 0px; padding: 0px; font-size: 22px; height: 86px; background-image: url(&quot;../images/t1.gif&quot;); background-position: 0px 0px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; overflow: hidden; color: rgb(68, 68, 68); font-weight: normal;"><span style="line-height: 95px; display: block;">正文开始啦</span></h2><p><br/></p>', '2017-07-28 04:54:03', '20170728/e4b0cdae29088fd098274a8ccc753d25.jpg'),
(13, '去甘肃寻求丝绸之路的历史文化', 'Tony', '品读那充满了神奇传说般的月牙泉、阳关遗址和张掖丹霞山风貌', '<p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">【印象甘肃】</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">在我小的时候，我认为甘肃就是一座沙漠荒野之城；</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">当我念书的时候，我认为甘肃就是一座千年古地；</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">在今天的时候，我认为甘肃就是充满了神奇般色彩的丝绸之路历史古邑。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">这一次的青海、甘肃自驾游之旅，让我领略到这西北的特度魅力，同时感受到“江南才子北方将，黄土高原埋皇上”的那份浓厚的帝王君权历史与繁华的丝绸之路的过去。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">这一次的甘肃之行选择了与青海较近的地方的敦煌和张掖，去品读那充满了神奇传说般的月牙泉、阳关遗址和张掖丹霞山风貌。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">这一次，收获颇多，很值得一来。作为夏都的旅游相辅相成的甘肃，是非常值得到此一游的。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">【旅行行程】</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">第1天：敦煌市-阳关遗址-阳关博物馆-月牙泉小镇：</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">千年丝绸之路的繁华积淀出来一批历史文化名城，同时也造就了非同寻常的历史文化古城。而作为连接华夏到西域乃至古欧洲其他文明古国的贸易往来与文化交流的重要节点城市的敦煌以其自身深厚的历史文化积淀与遗产文化的完美保存至今，而散发出令人向往的敦煌文化。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">所以，从青海来到了甘肃境内的第一站就选择了敦煌来进行一次大西北文化之旅的体验。这次来到了体验到不同的历史文化古迹、佛法博大精深的传承以及岁月沉淀的气息。这一切也许是属于敦煌特有的气质与底蕴。夜晚到达敦煌，去了敦煌的夜市随便逛了下，体验真正的沧桑的文明古城的气息。</p><p><img src="/ueditor/php/upload/image/20170728/1501257126832494.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/56/E4/Cii_JVl221mISHEiAAC8y5CO2AAAAE_ywP_NKcAALzj561.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">千年丝绸之路的繁华积淀出来一批历史文化名城，同时也造就了非同寻常的历史文化古城。这里就是千年古文明历史文化名城的敦煌。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">作为连接华夏到西域乃至古欧洲其他文明古国的贸易往来与文化交流的重要节点城市的敦煌以其自身深厚的历史文化积淀与遗产文化的完美保存至今，而散发出令人向往的敦煌文化。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">所以，从青海来到了甘肃境内的第一站就选择了敦煌来进行一次大西北文化之旅的体验。这次来到了体验到不同的历史文化古迹、佛法博大精深的传承以及岁月沉淀的气息。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">这一切也许是属于敦煌特有的气质与底蕴。我们是夜晚到达敦煌市的，感觉很不错，与想象中的敦煌几乎是一样的感觉。</p><p><img src="/ueditor/php/upload/image/20170728/1501257127918397.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/56/E5/Cii_Lll221mIW-0TAAD8T8dKRYQAAE_zAONOb8AAPxn941.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">夜晚到达敦煌，去了敦煌的夜市随便逛了下，体验真正的沧桑的文明古城的气息。</p><p><img src="/ueditor/php/upload/image/20170728/1501257127124720.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/56/E5/Cii_Nll221qIDgb3AAEiHiSoKVMAAE_zAOONiYAASI2577.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">充满了历史文化气息的敦煌夜市，你喜欢吗？</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">渭城朝雨浥轻尘，客舍青青柳色新。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">劝君更尽一杯酒，西出阳关无故人。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">还记得这一首诗词吗？这是唐朝著名诗人王维写的一首诗，正是表达了故人即将离开长安城去西北边疆的悲壮感情。而这里的阳关遗址就是位于今天的敦煌市南湖乡南工村西1公里。现在就跟随山野君一起来阳关遗址来走走看看吧。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">如果对于唐朝鼎盛时期的历史文化以及军事方面有兴趣的，可以来阳关遗址看看这里的整体布局，通过实地的参观，或多或少的可以了解到一些。不过呢，来到甘肃境内特别要注意的是防晒，尤其这个炎热的夏季来这里，除了防晒工作之外，还有就是准备更多的饮用水。因为阳关遗址都是隔壁与沙漠组合而成的，晴朗的太阳之下的遗址显得更加的高温闷热。全身出发的速率比平常更加高了，而且口干的频繁度异常。所以来阳关无比要做好防晒与备用饮用水两大工作。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">景区的门票价格是50元，网络售价40元。整个景区不大，步行游玩2个小时完全足够了，不是很建议购买景区观光车。当然了，如果是想走马观花式的看看整个遗址，可以骑马和乘坐观赏，都是不错的选择。</p><p><img src="/ueditor/php/upload/image/20170728/1501257127100592.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/56/E5/Cii_JVl221mIYMIQAAEvrpksDtIAAE_zAORMN4AAS_G076.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">渭城朝雨浥轻尘，客舍青青柳色新。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">劝君更尽一杯酒，西出阳关无故人。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">还记得这一首诗词吗？这是唐朝著名诗人王维写的一首诗，正是表达了故人即将离开长安城去西北边疆的悲壮感情。</p><p><img src="/ueditor/php/upload/image/20170728/1501257127494322.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/56/E5/Cii_Lll221mICWcAAAEjF0ZtaqEAAE_zAOSYKQAASMv980.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">这里的阳关遗址就是位于今天的敦煌市南湖乡南工村西1公里。现在就跟随山野君一起来阳关遗址来走走看看吧。</p><p><img src="/ueditor/php/upload/image/20170728/1501257127734029.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/56/E5/Cii_JVl221mION_hAAD3j-cafMIAAE_zAOUpxUAAPen494.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">如果对于唐朝鼎盛时期的历史文化以及军事方面有兴趣的，可以来阳关遗址看看这里的整体布局，通过实地的参观，或多或少的可以了解到一些。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">从这里看得出来几千年前的敦煌文化了。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">来到甘肃境内特别要注意的是防晒，尤其这个炎热的夏季来这里，除了防晒工作之外，还有就是准备更多的饮用水。因为阳关遗址都是隔壁与沙漠组合而成的，晴朗的太阳之下的遗址显得更加的高温闷热。</p><p><img src="/ueditor/php/upload/image/20170728/1501257127434428.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/56/E5/Cii_Lll221mIeOXBAAHbArkFue8AAE_zAOVnrwAAdsa068.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">景区的门票价格是50元，网络售价40元。整个景区不大，步行游玩2个小时完全足够了，不是很建议购买景区观光车。当然了，如果是想走马观花式的看看整个遗址，可以骑马和乘坐观赏，都是不错的选择。</p><p><img src="/ueditor/php/upload/image/20170728/1501257127552208.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/56/E5/Cii_JVl221qIeUgyAAFgICzZgeUAAE_zAOXedYAAWA4212.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">阳关遗址位于敦煌市南湖乡南工村西1公里。俗名“古董滩”。面积约550万平方米。暴露有黄土夯筑房屋残基以及窑址、墓葬。</p><p><img src="/ueditor/php/upload/image/20170728/1501257128496314.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/56/E5/Cii_Nll221uIJ7rjAADL2OkP9EwAAE_zAOY2g4AAMvw461.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">地表采集有五铢钱币、铁农具等。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">墓葬分布于南湖乡北工村东8公里，面积约20万平方米。地面封土为3--6座一组不等的排列次序，应为家族墓地。已暴露的墓道，多数东向。</p><p><br/></p>', '2017-07-28 15:52:12', '20170728/c5d54eed865f595a532567b36fb175e6.jpg'),
(14, '张家界，奇妙大自然探秘之行', 'Tony', '天子山：有“不游天子山，枉到武陵源”，“看了天子山，不看天下山”的说法', '<p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">【序】</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">愿你我都能把日子过成自己内心的欢喜，无论何样的年纪和遭遇，可以想走就走。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">能牵挂，能放下，可热闹，也不害怕独行，</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">也许此刻的你还在努力之中，那是你正在为自由而努力，</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">努力终会创造自由。</p><p><img src="/ueditor/php/upload/image/20170728/1501257241249450.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/56/C1/Cii_Nll20auIfLd_AAFWtQ_E7A0AAE_ZAERV-AAAVbN019_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">这一站，来到了张家界，这里的奇山秀水被誉为“中国山水画的原本”，刀劈斧削的奇石幽闭是大自然的鬼斧神工之作，把张家界的山石雕刻成唯美的艺术品，如同缩小的盆景，镶嵌在湘西的山水之间。</p><p><img src="/ueditor/php/upload/image/20170728/1501257241226311.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/56/C1/Cii_Lll20ayIN1rDAAF4Pj3Wy_sAAE_ZAEV3RgAAXhW111_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">【预告片】</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">1、金鞭溪：“人在峡谷走，山从两边过”，峡谷两边都是绝美的景色。</p><p><img src="/ueditor/php/upload/image/20170728/1501257242672584.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/56/C1/Cii_Nll20ayILCYZAAFk7IOrIosAAE_ZAHVH4MAAWUE746_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">2、天子山：有“不游天子山，枉到武陵源”，“看了天子山，不看天下山”的说法。&nbsp;</p><p><img src="/ueditor/php/upload/image/20170728/1501257242590096.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/55/76/Cii_JVl17zaISjJLAAE4J4l2Ip0AAE5sAGLum0AATg_471.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">3、黄石寨：远近诸般奇景尽收眼底,有“不上黄石寨，枉到张家界”之说。</p><p><img src="/ueditor/php/upload/image/20170728/1501257242867276.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/55/76/Cii_Lll17zaIYLakAAQ4-Ruwy1wAAE5sAGM8qwABDkR536.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">4、杨家界：关隘险绝，四面悬崖，仅有一道上下，地势险要</p><p><img src="/ueditor/php/upload/image/20170728/1501257242597872.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/55/76/Cii_Nll17zeIWFCSAAHCVzZO570AAE5sAGRK70AAcJv530.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">5、御笔峰：山谷中数十座错落有致的秀峰突起，遥冲蓝天，靠右的石峰像倒插的御笔，靠左的石峰似搁笔的“江山”。</p><p><img src="/ueditor/php/upload/image/20170728/1501257242330553.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/55/76/Cii_JVl17zeIBa2cAAHhF9y6CuAAAE5sAGS7iwAAeEv745.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">6、百龙天梯：这是&quot;世界上最高的全暴露户外观光电梯、世界上载重量最大、世界上运行速度最快的观光电梯&quot;，这三项桂冠也让它独步世界，被载入吉尼斯世界纪录</p><p><img src="/ueditor/php/upload/image/20170728/1501257242832689.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/55/76/Cii_Nll17zeIAO8hAAIPka4oAI0AAE5sAGUz1sAAg-p806.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">7、悬浮山：《阿凡达》取景地，传说中的哈利路亚山</p><p><img src="/ueditor/php/upload/image/20170728/1501257243552569.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/56/C1/Cii_Lll20a2ILaBrAAMwTtKeLt8AAE_ZAIAnuIAAzBm613_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">8：魅力湘西：演员阵容与舞台美术都十分讲究，并且有室内场和室外场两种风格的两个场次。</p><p><br/></p>', '2017-07-28 15:54:16', '20170728/b8130c1ff7a81e953036d175546ed9fe.jpg'),
(15, '全国入烧烤模式时，我却到夏都避暑了', 'Tony', '赞叹的、唯美的是，这里不仅仅是幅员辽阔，更有丰富的自然资源', '<p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">【印象青海】</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">对于生长并生活在江南地区的山野君而言，也许是绝大部分的国人而言西北的印象就是非常的荒凉、落后、萧条，甚至是不知道西北是什么一样的地方。由于对于大西北的不了解，所以就造成了不曾想到这里看一看、走一走的冲动。然而，这一次不知道是什么缘故让我有了一次去西北“撒野”的念头。大概这个念头早在几个月前就有了，至于这个念头的形成原因我也不清楚，这仿佛就是冥冥中一种神秘的力量驱使着我来西北走一走并看一看的思想冲动了吧？</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">这一次来到西北的青海和甘肃，给我带来意想不到的收获，简直有一种不可思议的唯美与赞叹！</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">赞叹的、唯美的是，这里不仅仅是幅员辽阔，更有丰富的自然资源！</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">赞叹的、唯美的是，这里不仅仅有中国最为丰富的地形地貌，更有异国风情的独特景观！</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">赞叹的、唯美的是，这里不仅仅有古代丝绸之路的历史文化积淀，更有现代保存完好的淳朴民风！</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">赞叹的、唯美的是，这里不仅仅一年四季如春的气候，更有常年骄阳似火的盛夏！</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">赞叹的、唯美的是，这里不仅仅有自然风光的绚丽，更有丰富多彩的宗教文化的百花齐放！</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">在这里能够感受到西北特有的阳刚般野性气息，更有历史文化的阴柔般默默情思。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">这才是真正的大西北，来了这里才知道大西北才是中国人旅游度假的胜地，更是值得去“撒野”一回的地方。那么，接下来就跟着山野君我一起来“撒野”吧！从“撒野”的旅行方式来感受大西北的韵味，以真正的解读大西北的气质！</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">这一次，山野君我就选择了自驾游与当地游有机结合的方式来一次青海和甘肃两地3500公里的大环线之旅。</p><p><img src="/ueditor/php/upload/image/20170728/1501257398352074.jpg" data-src="https://img1.qunarzz.com/travel/d7/1707/cc/947316e5ab6c6b5.jpg_r_680x450x95_b090713d.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">祁连山大草原不仅仅是一片草原，更是一方人间天堂。山顶之上的白雪、山腰上的云雾、山坡上绿地以及山脚下的草坪，宛如是一片梦中才有有的景致。</p><p><img src="/ueditor/php/upload/image/20170728/1501257398977015.jpg" data-src="https://img1.qunarzz.com/travel/d9/1707/dd/22915c8ef22646b5.jpg_r_680x450x95_0b760236.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">在这个全国进入烧烤模式的炎热夏季，青海依旧如此清凉。看到这远方的雪山与地下的油菜花以及那冷色基调的云雾就能够感受到一阵阵的清凉。</p><p><img src="/ueditor/php/upload/image/20170728/1501257398131785.jpg" data-src="https://img1.qunarzz.com/travel/d4/1707/5c/19a38489c0c1c6b5.jpg_r_680x450x95_e6b63400.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">在世界最大的门源油菜花基地，这里的景色更是美的惊艳、美的炫丽、美的名不虚传！门源也属于祁连山区域，走在这油菜花基地可以清清楚楚的看得到更为清爽的油菜花与雪山共存的景色。这样的景色不醉人，人也自醉了吧？</p><p><img src="/ueditor/php/upload/image/20170728/1501257398562941.jpg" data-src="https://img1.qunarzz.com/travel/d7/1707/9c/1294d3d36b6f1ab5.jpg_r_680x450x95_a2837cfc.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">此时已经是晚上20:39分了，一趟由兰州开往乌鲁木齐的高铁途径西北最美的高铁线—兰新高铁客运专线之上，一种大美中华、大美西北的别样景致令人回味无穷。可喜的是，山野君运气如此之好，能够刚好看到高铁列车途径门源油菜花之上雪山之下的景象。</p><p><img src="/ueditor/php/upload/image/20170728/1501257399719714.jpg" data-src="https://img1.qunarzz.com/travel/d0/1707/22/dde1d784b0428cb5.jpg_r_680x450x95_4fd07982.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">青海水上雅丹风貌是大自然给予大西北特有的自然风光恩惠，看似是泥土般的土堆子在幽深的湖面上，实际上这是已经经过几千万年风化而成的雅丹风貌。是中国乃至世界罕见的水上魔鬼城。</p><p><img src="/ueditor/php/upload/image/20170728/1501257399726756.jpg" data-src="https://img1.qunarzz.com/travel/d7/1707/1f/30d590e4e78a82b5.jpg_r_680x450x95_b21803ec.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">如此美丽的景色暂时是不收费的哦，地处无人区的地方。不过，在今年的8月份就要开始收费了，趁着不收费的机会赶紧来青海水上雅丹见识一次吧。</p><p><br/></p>', '2017-07-28 15:56:42', '20170728/349f72ebccb64f36d38569bb8950df9d.jpg');
INSERT INTO `tr_artcle` (`aid`, `title`, `author`, `note`, `content`, `time`, `picture`) VALUES
(16, '去风下之乡，享一个悠然假期', 'Tony', '海岛游就是可是放肆的不做攻略说走就走', '<p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">因为妹妹突如其来的惊喜假期</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">促成了我们这次任性的旅行</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">海岛游就是可是放肆的不做攻略说走就走</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">而马来西亚的签证简单易行</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">出国度假也变的so easy</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">那就放飞自我</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">去风下之乡</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">享一个悠然假期吧</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">解锁我们自己的度假style！</p><p><img src="/ueditor/php/upload/image/20170729/1501257925570022.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/0E/Cii_LllytjmIIdixAAXpBL9DHjgAAEoxAOZBY4ABekc528_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p><img src="/ueditor/php/upload/image/20170729/1501257925656637.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/0F/Cii_NllytmWIaVLGAARaSwjrQvcAAEoxgPiDzgABFpj283_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">这次图省事，直接从牛牛家跟团，反正也是海岛游，抵达后也是自由活动，报团应该更省心些，所以毫不犹豫的选了一个高端无购物团，出发~</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">所以这次就开门见山的来美图和游记了，哈哈。但是在文章的最后，我还是会推荐给大家一些注意事项哒~</p><p class="section-tit index4" id="tit0" style="margin-top: 0px; margin-bottom: 30px; padding: 0px 0px 0px 20px; background: url(&quot;//img3.tuniucdn.com/site/images/yj_2016/titlebg.png&quot;) 0px -365px no-repeat rgb(255, 255, 255); color: rgb(0, 189, 195); font-size: 20px; line-height: 50px; font-weight: bold; font-family: 微软雅黑; white-space: normal;">day1~猝不及防的头等舱，在惊喜中飞抵海岛</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: 微软雅黑; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">今天这一天其实就是在路上度过的，深圳集结，然后从邮轮中心搭乘快船到香港机场，从香港飞沙巴亚庇。平平淡淡的一天却因为有了个意外的头等舱而变的惊喜，快船竟然意外的给我们分到了头等舱的船票，这趟旅行，是个好开端~</p><p><img src="/ueditor/php/upload/image/20170729/1501257925876833.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/14/Cii_JVlyuQWIIWEEAARggL_OiTcAAEo2wHPLoQABGCY727.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p><img src="/ueditor/php/upload/image/20170729/1501257926966282.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/14/Cii_JVlyuQaIa-eMAAVmZQV2o5gAAEo2wHh6WoABWZ9865_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">头等舱的待遇就是不一样，赶紧拍张照装一把，哈哈</p><p><img src="/ueditor/php/upload/image/20170729/1501257926845305.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/14/Cii_LllyuQSINX4KAAPg3LTIzywAAEo2wHLTZAAA-D0552.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">船慢慢驶入港口，在船舱内，已看到了往来的飞机，好想感慨一句~香港！我又来了！但这次我又要匆匆的走！</p><p><img src="/ueditor/php/upload/image/20170729/1501257926629348.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/13/Cii_NllyuMmIJLLhAAeGXPHy6Y8AAEo2QOs7AgAB4Z0523_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">候机中。。。。。香港机场不算大，但可以逛的店铺真心不算少，早来几个小时也完全不会无聊。尤其是香港机场离境大厅还有香港迪士尼的店铺哦，没买够的可以继续补货，而我这次，答应儿子的礼物也早早在这里备齐交差了。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">登机口还有这样的儿童休闲区，小朋友在这里看看卡通片啊、玩玩游戏啊，也完全不会觉得无聊，真的是很贴心呢</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">抵达亚庇的时候已经是深夜，所以一夜无话，期待着第二天满满的行程吧~</p><p class="section-tit index4" id="tit1" style="margin-top: 0px; margin-bottom: 30px; padding: 0px 0px 0px 20px; background: url(&quot;//img3.tuniucdn.com/site/images/yj_2016/titlebg.png&quot;) 0px -365px no-repeat rgb(255, 255, 255); color: rgb(0, 189, 195); font-size: 20px; line-height: 50px; font-weight: bold; font-family: 微软雅黑; white-space: normal;">day2~无限畅饮水果下午茶&amp;追寻长鼻猴萤火虫的浪漫之夜</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: 微软雅黑; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">一觉睡到自然醒，我们的集合时间竟然定在11点，真的不敢相信，我确定是在跟团游吗？哈哈！完全颠覆了我对传统跟团游每天起早贪黑赶景点的印象。所以我们今天的一天是从午餐开始的~</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">午餐选在避风塘餐厅，是吃沙巴当地特色海鲜餐。</p><p><img src="/ueditor/php/upload/image/20170729/1501257926353143.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/3E/Cii_JVlyzWSIUAYbAASkPHcr7gAAAEpOgEo_QoABKRU879_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">虾子的个头很大，做的是奶油口味的，很有当地的特色。</p><p><img src="/ueditor/php/upload/image/20170729/1501257926419532.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/3E/Cii_LllyzWWIMRFQAAR1mBK7FcwAAEpOgEtoV4ABHWw433_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">感觉跟海南鸡饭里的那个烤鸡差不多，覆盖在上面的虾片很好吃。</p><p><img src="/ueditor/php/upload/image/20170729/1501257927121292.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/3E/Cii_NllyzWaIR5MGAAPO-QKelc0AAEpOgE5fLkAA88R943_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">这个是当地的特色菜，虽然看着黏糊糊的一坨，但是很好吃呢，尤其是那个好像是炸豆腐泡一样的东西，非常可口。</p><p><img src="/ueditor/php/upload/image/20170729/1501257927887269.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/3E/Cii_JVlyzWeIX4RQAAQUVXkKJE8AAEpOgE9S8oABBRt844_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p><img src="/ueditor/php/upload/image/20170729/1501257927169849.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/3E/Cii_JVlyzWiIdGE1AASPFNlFFwwAAEpOgFBYDcABI8s668_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p><img src="/ueditor/php/upload/image/20170729/1501257927611684.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/3E/Cii_LllyzWiIaa8dAARDNIDgbLUAAEpOgFF72MABENM390_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">叫不上来做法，但都是当地的特色，味道不错，值得一试。</p><p><img src="/ueditor/php/upload/image/20170729/1501257927502154.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/3E/Cii_LllyzWmIHB5vAAW8bA48PuoAAEpOgFVmoMABbyE789_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">最最期待的一道，就是避风塘的馒头辣子蟹，蟹子是辣炒并裹上一层当地特色的辣椒酱，非常香，再配以焦炸的奶油小馒头，吃起来那叫一个过瘾，大家都大呼好吃。</p><p><img src="/ueditor/php/upload/image/20170729/1501257928612518.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/3E/Cii_NllyzWOIY4z-AAQkBYUQlQgAAEpOgEk2O0ABCQd763_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">青菜一定是每一次必不可少的，这边广东人、客家人比较多，所以青菜的做法也以白灼为主，清淡入味，非常爽口。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">这顿午餐吃的有够满足的，再一次颠覆了我对团餐的印象，反而对接下来的行程越发期待了呢~</p><p class="section-tit index2" id="tit2" style="margin-top: 0px; margin-bottom: 30px; padding: 0px 0px 0px 20px; background: url(&quot;//img3.tuniucdn.com/site/images/yj_2016/titlebg.png&quot;) 0px -45px no-repeat rgb(255, 255, 255); color: rgb(51, 51, 51); font-size: 20px; line-height: 50px; font-weight: bold; font-family: 微软雅黑; white-space: normal;">热带水果王国的盛宴</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: 微软雅黑; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">沙巴是马来西亚的一个州，位于加里曼丹岛（旧称婆罗洲）东北部，它的位置在饱受台风肆虐的菲律宾之南，但台风不会经过这里。因此沙巴也有着风下之乡的美誉。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">地处热带的沙巴州，全年都是夏季，这里盛产各种热带水果，尤其以榴莲闻名，可以说，这里是热带水果的王国。所以来到了沙巴，不来一顿丰盛的水果大餐，还真是有些说不过去了。</p><p><img src="/ueditor/php/upload/image/20170729/1501257928831691.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/4E/Cii_Nlly1_KIGObNAAbBRsmF9dgAAEpWAMTj9YABsFe230_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">亚庇是沙巴的首都，我们来的水果园就是亚庇近郊的一处农场。大巴车把我们送抵到主干道，由于果园在山上，我们是需要徒步前往的。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">得来不易才觉得珍贵，想象着有满满一大桌丰盛的热带水果等着我们，即使天气炎热，每个人走起路来也是足底生风，迫不及待的想要一睹水果大餐的真容了。</p><p><img src="/ueditor/php/upload/image/20170729/1501257928670245.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/4E/Cii_JVly1_KIQIAsAAiFkdaqEIMAAEpWAMdskQACIWp954_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">来到农场主的家里，每人先收获的是一杯冰凉新鲜的橘子水作为欢迎礼，冰凉爽口，一解暑气。然后我们就看到这满满一桌热带水果，品种丰富，只要是我们叫的上名字来的热带水果，甚至还有我们不认识的。</p><p><img src="/ueditor/php/upload/image/20170729/1501257928487219.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/4E/Cii_Nlly1_KIMMzTAANg-INPVo4AAEpWAMaUTQAA2EQ132_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">榴莲是水果之王，都道是马来西亚的榴莲是最好吃的，所以它也是我们此行最最期待的。这里的榴莲吃起来果然比我们国内的要好很多，口感爽滑绵软，甜甜的，那一股清甜是直沁心脾的，让你吃下一口就忍不住的想再来一口，早已忘记了它闻起来的味道。</p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">老板豪爽的给我们劈开一个又一个，让我们放开了肚子吃。而这里的每一个不分好坏，都是蜜一般的香甜可口，据说新加坡的榴莲也都是从马来西亚进口的哦，可见马来西亚的榴莲有多好吃，我们这一行，可吃了个过瘾。</p><p><img src="/ueditor/php/upload/image/20170729/1501257928269996.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/4E/Cii_JVly1_WIZH3cAAVgbmyFsPEAAEpWAMmN-0ABWCG831_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">并且，逗比老板还给我们示范了和榴莲合影的正确打开方式---咬住榴莲皮内心，一！二！三！走一个！哈哈</p><p><img src="/ueditor/php/upload/image/20170729/1501257928120304.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/4E/Cii_Llly1_eIbrw9AAh-zqs9aecAAEpWAMrmHMACH7m190_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">来，我也有模有样的学起来！</p><p><img src="/ueditor/php/upload/image/20170729/1501257929358314.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/50/4E/Cii_JVly1_eIAJnlAAQ5unu2HgsAAEpWAM8TSAABDnS869_w700_h0_c0_t0.jpg" style="border: 0px; width: 750px; display: inline;"/></p><p class="section-img-intr" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; color: rgb(128, 128, 128); white-space: pre-wrap;"><br/></p><p class="section-des" style="margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;; line-height: 26px; word-break: break-all; white-space: normal; background-color: rgb(255, 255, 255);">这个叫沙巴果，是只有沙巴才特有的一种水果，英文叫Langgsat Tarap。样子和榴莲有点像，口感却不一样，吃起来是劲道的，没榴莲那么绵密，香甜软糯，非常好吃。</p><p><br/></p>', '2017-07-28 16:05:58', '20170729/72a76294014ec6a0a21864d18843104a.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `tr_banner`
--

CREATE TABLE IF NOT EXISTS `tr_banner` (
  `id` int(11) NOT NULL,
  `icon` text NOT NULL COMMENT '图片地址',
  `description` text NOT NULL COMMENT '描述',
  `is_show` int(11) NOT NULL DEFAULT '1' COMMENT '是否展示',
  `link` text COMMENT '链接地址'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_banner`
--

INSERT INTO `tr_banner` (`id`, `icon`, `description`, `is_show`, `link`) VALUES
(6, '20170729/05c215961ba1c5302dad22d5f89ae1b3.jpg', '二', 1, '二'),
(7, '20170729/0ea9b9d6a2defcfafbfcfca77d6094ae.jpg', '三', 1, '三'),
(9, '20170729/c9406fefe9a342e4313346dd5a58a8dc.jpg', '五', 1, '五'),
(10, '20170729/9843d4abcb2291ef9f80e03398f2b990.jpg', '六', 1, '六'),
(12, '20170729/76efa15ac032e161142b9ed33b7cd411.jpg', '四', 1, '四'),
(13, '20170729/44eec3a62e63bd6f3cb2c1e173b6d5a2.jpg', '七', 1, '七');

-- --------------------------------------------------------

--
-- 表的结构 `tr_collect`
--

CREATE TABLE IF NOT EXISTS `tr_collect` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `cid` int(11) NOT NULL COMMENT '文章ID',
  `gid` int(11) NOT NULL COMMENT '商品ID',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_collect`
--

INSERT INTO `tr_collect` (`id`, `uid`, `cid`, `gid`, `time`) VALUES
(1, 2, 3, 0, '2017-07-13 13:33:34');

-- --------------------------------------------------------

--
-- 表的结构 `tr_comment`
--

CREATE TABLE IF NOT EXISTS `tr_comment` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID ',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `cid` int(11) NOT NULL COMMENT '文章ID',
  `content` text NOT NULL COMMENT '评论内容',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_comment`
--

INSERT INTO `tr_comment` (`id`, `uid`, `gid`, `cid`, `content`, `time`) VALUES
(1, 2, 3, 4, '可以的！', '2017-07-13 13:37:29');

-- --------------------------------------------------------

--
-- 表的结构 `tr_goods`
--

CREATE TABLE IF NOT EXISTS `tr_goods` (
  `gid` int(11) NOT NULL COMMENT '特产ID',
  `name` text NOT NULL COMMENT '名称',
  `typeid` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL COMMENT '单价',
  `pic1` text,
  `pic2` text,
  `picture` char(32) DEFAULT NULL COMMENT '小图片',
  `buys` int(11) DEFAULT NULL COMMENT '月销量',
  `stock` int(11) DEFAULT NULL COMMENT '库存量',
  `posts` int(11) DEFAULT '0' COMMENT '运费',
  `recommend` int(11) DEFAULT '0' COMMENT '是否推荐',
  `place` text COMMENT '产地',
  `content` text COMMENT '内容',
  `note` text COMMENT '描述',
  `detail1` text NOT NULL,
  `detail2` text NOT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `picmax` char(32) DEFAULT NULL COMMENT '大图'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_goods`
--

INSERT INTO `tr_goods` (`gid`, `name`, `typeid`, `price`, `pic1`, `pic2`, `picture`, `buys`, `stock`, `posts`, `recommend`, `place`, `content`, `note`, `detail1`, `detail2`, `addtime`, `picmax`) VALUES
(1, '精品葡萄', 1, 25, '/static/index/images/x6.jpg', NULL, '/static/index/images/t3.jpg', 66, 100, 5, 0, '新疆吐鲁番', '葡萄很好吃，很甜', '丝路宝典 果肉鲜美', '/static/index/images/pd2.jpg', '/static/index/images/pd1.jpg', '2017-07-17 01:46:09', '/static/index/images/t3.jpg'),
(2, '东北特色皇冠梨', 1, 36, '/static/index/images/x51.jpg', NULL, '/static/index/images/t2.jpg', 32, 20, 0, 0, '东北', '皇冠梨贼甜', '果肉鲜美，味道极好', '/static/index/images/x52.jpg', '', '2017-07-21 14:50:38', '/static/index/images/t2.jpg'),
(3, '阳光金奇异果', 1, 40, '/static/index/images/x11.jpg', '/static/index/images/x12.jpg', '/static/index/images/x1.jpg', 120, 300, 10, 1, '陕西', '高甜度，高营养', '果味甜蜜清爽', '/static/index/images/xd1.jpg', '/static/index/images/xd2.jpg', '2017-07-28 04:17:25', '/static/index/images/x1.jpg'),
(4, '农产品无硫雪莲子250克', 2, 120, '/static/index/images/x21.jpg', '/static/index/images/x22.jpg', '/static/index/images/x2.jpg', 36, 150, 0, 0, '云南', NULL, '色泽通透，质地晶莹', '/static/index/images/x2d1.jpg', '/static/index/images/x2d2.jpg', '2017-07-28 05:26:07', '/static/index/images/x2.jpg'),
(5, '玉至峰和田玉观音佛吊坠', 3, 200, '/static/index/images/x41.jpg', '/static/index/images/x42.jpg', '/static/index/images/x4.jpg', 20, 100, 10, 0, '河南', NULL, NULL, '/static/index/images/x4d2.jpg', '/static/index/images/x4d1.jpg', '2017-07-28 06:19:29', NULL),
(6, '湘西腊肉农家自制腌肉熏肉', 2, 30, '/static/index/images/x31.jpg', '/static/index/images/x32.jpg', '/static/index/images/x3.jpg', 56, 300, 0, 0, '湖南', NULL, NULL, '/static/index/images/x3d1.jpg', '/static/index/images/x3d2.jpg', '2017-07-28 06:24:20', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tr_goods_category`
--

CREATE TABLE IF NOT EXISTS `tr_goods_category` (
  `typeid` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_goods_category`
--

INSERT INTO `tr_goods_category` (`typeid`, `name`) VALUES
(1, '水果'),
(2, '农产品'),
(3, '工艺品');

-- --------------------------------------------------------

--
-- 表的结构 `tr_goods_order`
--

CREATE TABLE IF NOT EXISTS `tr_goods_order` (
  `id` int(11) NOT NULL,
  `gid` text NOT NULL COMMENT '商品ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `oid` text NOT NULL COMMENT '订单编号',
  `num` text NOT NULL COMMENT '数量',
  `pst` int(11) NOT NULL COMMENT '总运费',
  `sum` int(11) NOT NULL COMMENT '总价',
  `score` int(11) NOT NULL COMMENT '可得积分',
  `discount` int(11) NOT NULL COMMENT '积分折扣',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '是否付款',
  `post` int(11) NOT NULL DEFAULT '0' COMMENT '是否发货，默认0未发货',
  `consignee` char(32) NOT NULL COMMENT '收货人',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_goods_order`
--

INSERT INTO `tr_goods_order` (`id`, `gid`, `uid`, `oid`, `num`, `pst`, `sum`, `score`, `discount`, `status`, `post`, `consignee`, `time`) VALUES
(3, '2,1', 3, '20170724140821', '5,3', 5, 248, 127, 12, 1, 0, '小天', '2017-07-24 06:08:21'),
(15, '2,1', 3, '20170725081551', '7,2', 5, 292, 151, 15, 1, 1, '小天', '2017-07-25 00:15:51'),
(19, '1,2', 3, '20170726165230', '2,1', 5, 87, 43, 4, 1, 0, '小天', '2017-07-26 08:52:30'),
(21, '1,2', 3, '20170727135546', '5,6', 5, 329, 170, 17, 1, 1, '小天', '2017-07-27 05:55:46'),
(24, '2', 3, '20170727141512', '6', 0, 206, 108, 10, 0, 0, '小天', '2017-07-27 06:15:12'),
(25, '1,2', 3, '20170727141616', '6,1', 5, 182, 93, 9, 1, 1, '小天', '2017-07-27 06:16:16'),
(26, '1,2', 3, '20170727142010', '4,1', 5, 135, 68, 6, 0, 0, '小天', '2017-07-27 06:20:10'),
(27, '2,1', 1, '20170727151714', '2,3', 5, 145, 73, 7, 1, 0, '小明', '2017-07-27 07:17:14'),
(28, '2', 1, '20170727152113', '2', 0, 69, 36, 3, 0, 0, '小明', '2017-07-27 07:21:13'),
(29, '2,1', 1, '20170727152803', '2,3', 5, 145, 73, 7, 1, 0, '小明', '2017-07-27 07:28:03'),
(31, '1', 1, '20170727153643', '2', 5, 53, 25, 2, 1, 0, '小明', '2017-07-27 07:36:43'),
(35, '2,1', 1, '20170727161818', '3,6', 5, 251, 129, 12, 1, 0, '小明', '2017-07-27 08:18:18'),
(38, '2', 1, '20170727162531', '4', 0, 137, 72, 7, 1, 0, '小明', '2017-07-27 08:25:31'),
(39, '1,2', 1, '20170727162821', '2,2', 5, 121, 61, 6, 1, 1, '小明', '2017-07-27 08:28:21'),
(40, '1,2', 1, '20170727162836', '2,2', 5, 121, 61, 6, 0, 0, '小明', '2017-07-27 08:28:36'),
(41, '2', 1, '20170727162902', '2', 0, 69, 36, 3, 0, 0, '小明', '2017-07-27 08:29:02'),
(43, '1', 3, '20170727220244', '4', 5, 100, 50, 5, 1, 0, '小天', '2017-07-27 14:02:44'),
(45, '5', 3, '20170728144009', '1', 10, 200, 100, 10, 1, 0, '小峰', '2017-07-28 06:40:09'),
(46, '4', 3, '20170728144752', '2', 0, 228, 120, 12, 0, 0, '小峰', '2017-07-28 06:47:52'),
(47, '2,3', 3, '20170728193604', '3,2', 10, 189, 94, 9, 1, 0, '小峰', '2017-07-28 11:36:04'),
(48, '1', 3, '20170728222424', '1', 5, 29, 13, 1, 1, 0, '小峰', '2017-07-28 14:24:24'),
(49, '4', 3, '20170729083538', '4', 0, 456, 240, 24, 0, 0, '小峰', '2017-07-29 00:35:38'),
(50, '4,2', 3, '20170729104728', '2,2', 0, 297, 156, 15, 1, 0, '小峰', '2017-07-29 02:47:28');

-- --------------------------------------------------------

--
-- 表的结构 `tr_log`
--

CREATE TABLE IF NOT EXISTS `tr_log` (
  `id` int(11) NOT NULL,
  `username` char(32) NOT NULL,
  `content` text,
  `ip` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_log`
--

INSERT INTO `tr_log` (`id`, `username`, `content`, `ip`, `time`) VALUES
(2, 'admin', '登录成功！', '2130706433', '2017-07-28 01:06:03'),
(4, 'admin', '登录成功！', '2130706433', '2017-07-28 06:40:40'),
(5, 'admin', '登录成功！', '1928469057', '2017-07-28 11:22:46'),
(6, 'admin', '登录成功！', '1928469057', '2017-07-28 11:35:29'),
(7, 'admin1', '登录成功！', '1928469057', '2017-07-28 13:15:54'),
(12, 'admin', '登录成功！', '1928469057', '2017-07-29 00:55:25'),
(13, 'admin', '登录成功！', '1928469057', '2017-07-29 00:57:04'),
(14, 'admin', '登录成功！', '1928469057', '2017-07-29 01:01:40'),
(15, 'admin', '登录成功！', '1786332543', '2017-07-29 02:48:36');

-- --------------------------------------------------------

--
-- 表的结构 `tr_place`
--

CREATE TABLE IF NOT EXISTS `tr_place` (
  `pid` int(11) NOT NULL,
  `province` text NOT NULL,
  `city` text
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_place`
--

INSERT INTO `tr_place` (`pid`, `province`, `city`) VALUES
(1, '北京', '北京'),
(2, '海南', '三亚'),
(3, '河南', NULL),
(4, '安徽', NULL),
(5, '西藏', NULL),
(6, '台湾', NULL),
(7, '云南', NULL),
(8, '青海', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tr_role`
--

CREATE TABLE IF NOT EXISTS `tr_role` (
  `rid` int(11) NOT NULL COMMENT '角色ID',
  `name` char(32) NOT NULL COMMENT '角色名',
  `discription` text COMMENT '角色描述'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_role`
--

INSERT INTO `tr_role` (`rid`, `name`, `discription`) VALUES
(1, '超级管理员', '拥有至高无上的权利'),
(2, '总编', '对景区和特产信息的增删改查'),
(3, '后勤', '对评论和订单信息进行管理');

-- --------------------------------------------------------

--
-- 表的结构 `tr_role_access`
--

CREATE TABLE IF NOT EXISTS `tr_role_access` (
  `id` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `aid` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_role_access`
--

INSERT INTO `tr_role_access` (`id`, `rid`, `aid`) VALUES
(1, 1, '1,2,3,4,5,6,7,8,9,10'),
(2, 2, '1,2,3,4,7,9,10'),
(3, 3, '1,2,5,6,7,9,10');

-- --------------------------------------------------------

--
-- 表的结构 `tr_scenery`
--

CREATE TABLE IF NOT EXISTS `tr_scenery` (
  `sid` int(11) NOT NULL,
  `placeid` int(11) DEFAULT NULL,
  `name` char(32) NOT NULL,
  `type` char(32) NOT NULL,
  `price` int(11) NOT NULL,
  `picture` text NOT NULL,
  `keywords` char(32) NOT NULL,
  `stock` int(11) NOT NULL,
  `style` text,
  `content` text NOT NULL,
  `note` text NOT NULL,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picmax` text NOT NULL,
  `remend` char(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_scenery`
--

INSERT INTO `tr_scenery` (`sid`, `placeid`, `name`, `type`, `price`, `picture`, `keywords`, `stock`, `style`, `content`, `note`, `addtime`, `picmax`, `remend`) VALUES
(13, 1, '雅丹玉门关-鸣沙山双飞8日游', '一A景区', 4156, '20170728/54f99e38addd17e7f5526656e4a80d75.jpg', '宿青海湖畔观日出，风味烤全羊', 23, '人文风景', '<h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">产品概要</h3><p>行程天数：<span style="color: rgb(51, 51, 51);">8天7晚</span></p><p>成团地点：<span style="color: rgb(51, 51, 51);">兰州成团</span></p><p>目的地：<span style="color: rgb(51, 51, 51);">海西</span></p><p>往返交通：<span style="color: rgb(51, 51, 51);">飞机/飞机</span></p><p>报名截止时间：<span style="color: rgb(51, 51, 51);">团期前2天18点</span>&nbsp;<a class="J_DetailFeatureDeadline" mm="点击_详情区_产品特色_产品概要_查看报名截止时间" style="color: rgb(34, 194, 51); position: relative; margin-left: 10px;">查看全部报名截止时间<span class="icon" style="margin: 8px 0px 0px 3px; vertical-align: text-top; background-image: url(&quot;/static/img/2017/dist/tour/group-tour/icons-s2687b87363.png&quot;); background-position: -21px -70px; background-repeat: no-repeat; overflow: hidden; display: inline-block; height: 4px; width: 7px;"></span></a></p><p>组团形式：&nbsp;<span style="color: rgb(51, 51, 51);">联合发团；本产品与其他旅行社联合发团。</span></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">产品特色</h3><p><strong>产品特色详情</strong><br/><span style="color:#ff9703">★【产品升级体验】:</span><br/><span style="color:#ff9703">(1)优选当地高好评舒适型酒店，为您的钱包着想。</span><br/><span style="color:#ff9703">(2)舌尖上的西北：兰州牛肉面套餐、敦煌驴肉黄面，敦煌烤全羊大餐让你的身体、心灵、味蕾同时在路上！</span><br/><span style="color:#ff9703">(3)甘青环线，经典景点全含，纯玩0购物，让旅途更省心。</span><br/><span style="color:#ff9703">(4)遇上最幽蓝的高原湖泊，赤足天空之境的茶卡盐湖。爬行浩瀚沙漠的鸣沙山，驻足千年文明的莫高窟。</span></p><p><img src="http://m.tuniucdn.com/fb2/t1/G3/M00/12/F6/Cii_NllM5fmIfgYiAC2xhpDKOxcAABX8wHX5ekALbGe156_w1536_h0_c0_t0.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/12/F6/Cii_NllM5fmIfgYiAC2xhpDKOxcAABX8wHX5ekALbGe156_w1536_h0_c0_t0.jpg" style="border: 0px; width: 1018px; height: auto;"/></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">接待标准</h3><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>用餐安排：</strong>早餐为酒店早餐，含6早7正,正餐35元/正（中式餐或自助餐或特色餐，自由活动期间用餐请自理；如因自身原因放弃用餐，则餐费不退）</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>住宿安排：</strong>兰州:兰莓精品酒店、时代经典大酒店、宜必思酒店，兰博粱山酒店，兰州宏远宾馆，兰州瑞达精品酒店，兰州和颐酒店，兰州艺海大酒店<br/>青海湖：青海湖格桑梅朵、西南大酒店、天合酒店、蓝天宾馆、青海湖三峡宾馆、青海湖天府大酒店、、青海湖川北大酒店、青海湖格日大酒店<br/>西宁：西宁君澜博瑞 西宁雅荷宾馆 西宁东福源宾馆 西宁景江酒店 青海兴鼎安大酒店 西宁旺和大酒店 西宁都市花园酒店 西宁旺和大酒店<br/>嘉峪关：嘉峪关观礼公寓、嘉峪关国际大酒店、嘉峪关东瑚明珠大酒店、嘉峪关星程大酒店、嘉峪关瑞景酒店&nbsp;<br/>敦煌：敦煌润泽大酒店、敦煌西湖公馆、敦煌星程宾馆、敦煌兰新大酒店、敦煌天河湾商务、敦煌天河精品酒店、敦煌隆丰大酒店、敦煌凯盛大酒店</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>行程安排：</strong>当地空调旅游大巴，区间段兰新动车，免去疲劳</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>游玩安排：</strong>【塔尔寺】——黄教六大寺院之一、藏传佛教黄教创始人宗喀巴大师诞生地<br/>【青海湖】——中国最大的咸水湖<br/>【张掖丹霞地质公园】——&quot;中国最美的七大丹霞&quot;之一<br/>【莫高窟】——中国四大石窟之一<br/>【鸣沙山、月牙泉】——“山泉共处，沙水共生”的奇妙景观，被誉为“塞外风光之一绝”<br/>【茶卡盐湖】——中国的“天空之镜”<br/>【敦煌雅丹地质公园】又称敦煌魔鬼城<br/>【玉门关故址】西北小方盘城</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>购物安排：</strong>纯玩无购物，超值出行，尽享旅行乐趣</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>娱乐安排：</strong>推荐自费参观大型沙漠实景演出——&quot;又见敦煌“、&quot;敦煌盛典”</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>贴心赠送：</strong>西北线专享“贴心大礼包” 摄影丝巾，全程照亮你的美</p><p><br/></p>', '宿青海湖畔观日出，风味烤全羊，摄影游，嗨玩大西北，优质住宿，可升级兰新高铁', '2017-07-28 02:27:39', '20170728/54f99e38addd17e7f5526656e4a80d75.jpg', '是'),
(14, 5, '-青海湖-茶卡盐湖-祁连草原', '一A景区', 3571, '20170728/d83ca4005cbefa9da5c0790fd505901b.jpg', '鸣沙山月牙泉双飞', 23, '自然风光', '<h3 style=";padding: 0px 0px 0px 10px;font-size: 16px;height: 20px;border-left: 4px solid rgb(34, 194, 51);line-height: 20px">产品概要</h3><p>行程天数：<span style="color: rgb(51, 51, 51)">7天6晚</span>成团地点：<span style="color: rgb(51, 51, 51)">兰州成团</span>目的地：<span style="color: rgb(51, 51, 51)">酒泉</span>往返交通：<span style="color: rgb(51, 51, 51)">飞机/飞机</span>报名截止时间：<span style="color: rgb(51, 51, 51)">团期前2天18点</span>&nbsp;<a mm="点击_详情区_产品特色_产品概要_查看报名截止时间" style="color: rgb(34, 194, 51);position: relative;margin-left: 10px">查看全部报名截止时间</a>组团形式：&nbsp;<span style="color: rgb(51, 51, 51)">联合发团；本产品与其他旅行社联合发团。</span></p><h3 style=";padding: 0px 0px 0px 10px;font-size: 16px;height: 20px;border-left: 4px solid rgb(34, 194, 51);line-height: 20px">产品特色</h3><p><strong>产品描述</strong><br/><span style="color:#ff9703">★设计理念：环线出行，不走回头路，集结了河西走廊+丝绸之路之文化，涵盖了湖泊、草原、沙漠、雪山、戈壁之众多自然景观，10年之经验，助于精华；</span><br/><span style="color:#ff9703">★行程安排：当地空调旅游大巴，提供免费接送站，全程专业导游服务，8人以下不安排导游，由司机负责全程衔接工作。</span><br/><span style="color:#ff9703">★服务标准：一次旅行，走遍甘肃青海两省精华，舒适住宿，晚餐自理；</span><br/><span style="color:#ff9703">★大美青海：青海湖、茶卡盐湖、祁连大草原……</span><br/><span style="color:#ff9703">★多彩甘肃：七彩丹霞、敦煌莫高窟、鸣沙山、月牙泉、戈壁滩……</span><br/><span style="color:#ff9703">★翻山越岭：山中景更美，翻越日月山、橡皮山、大冬树山、祁连达坂……</span><br/><span style="color:#ff9703">★关于用餐：途中午餐由我社安排，晚餐供您自由品尝当地美食；</span><br/><span style="color:#ff9703">★产品特色1：纯玩0购物，把您宝贵的时间留给美丽的景区；</span><br/><span style="color:#ff9703">★产品特色2：入住青海湖畔，欣赏青海湖日暮晚霞，拍摄日出晨曦；</span><br/><span style="color:#ff9703">★产品特色3：行程集自然风光、人文古迹、世界遗产、戈壁草原于一线；</span><br/><span style="color:#ff9703">★产品特色4：茶卡至祁连，沿最美环湖路前行，翻越大冬树山垭口；</span><br/><span style="color:#ff9703">★贴心赠送：赠送接送机服务，户外必备百变魔巾，矿泉水/天人；</span><img src="http://m.tuniucdn.com/fb2/t1/G3/M00/5F/8D/Cii_Lll60I2IapfqAC_W6BVBY4QAAFbEAKGh5YAL9cA404_w1536_h0_c0_t0.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/5F/8D/Cii_Lll60I2IapfqAC_W6BVBY4QAAFbEAKGh5YAL9cA404_w1536_h0_c0_t0.jpg" style="border: 0px;width: 1018px;height: auto"/></p><h3 style=";padding: 0px 0px 0px 10px;font-size: 16px;height: 20px;border-left: 4px solid rgb(34, 194, 51);line-height: 20px">特别优惠</h3><p style="margin-top: 0px;margin-bottom: 0px;padding: 0px"><strong><span style="color: rgb(255, 0, 0) !important">问：含有军官证、军残证、老年证、记者证等证件的客人有无退费？</span></strong></p><p style="margin-top: 0px;margin-bottom: 0px;padding: 0px"><strong><span style="color: rgb(0, 0, 255) !important">答：持证游客可享受景区门票优惠政策，具体以出行当日景区公布政策为准。请将相关证件提前交给导游，届时导游将按旅行社结算价与证件优惠价之间的差额，现场退还差价。</span></strong><br/></p><h3 style=";padding: 0px 0px 0px 10px;font-size: 16px;height: 20px;border-left: 4px solid rgb(34, 194, 51);line-height: 20px">重要提示</h3><p><span style="color: rgb(255, 0, 0) !important;font-weight: bold">莫高窟重要提示：</span><br/>敦煌莫高窟景区自2015年6月起实行数字展示中心数字洞窟展示和莫高窟实体洞窟体验的预约参观模式，每天限6000人参观，团队参观时间严格按照莫高窟预约场次进行，此天团队参观景点顺序会根据莫高窟时间进行调整或同团客人安排不同时间游览，敬请配合。<strong><br/><span style="color: rgb(255, 0, 0) !important">1、莫高窟门票为正常票和应急票两种</span></strong><br/>A.常规预约参观流程：莫高窟停车场-数字展示中心观影-换乘摆渡车赴窟区（约8个实体洞窟）-九层楼拍照留念-换乘摆渡车-返回停车场<br/>B.应急通道参观流程：莫高窟停车场-换乘摆渡车赴窟区（4个实体洞窟）-院史陈列馆（常书鸿故居）-九层楼留影&nbsp;-文物保护陈列中心（1:1临摹洞窟）-换乘摆渡车-停车场<br/>(应急预案不含数字中心，我们会安排导游现退门票差价100元/人)<br/><span style="color: rgb(255, 0, 0) !important"><strong>2、莫高窟正常票为网上预约，我们会根据下单时间分批次预约门票。7月-10月期间会出现以下几种情况；</strong></span><br/>A.同团不同场次情况，如出现此情况，我们会派小车送至莫高窟进行游览。<br/>B.同团队有的客人是正常票，有的客人安排应急模式参观（只参观4个洞窟，参观时间缩短为1个小时左右，导游现退门票差价100元/人），有的客人由于报名过晚无法游览莫高窟。<br/><span style="color: rgb(255, 0, 0) !important"><strong>3、&nbsp;对于莫高窟常规票和应急票都无法安排的客人，可如下方案二选一:</strong></span><br/>(一)、退莫高窟门票全价200元/人，敦煌市自由活动；<br/>(二)、安排游览西千佛洞，西千佛洞被称之为莫高窟的姊妹窟，位于敦煌城西35公里处。两者门票差价160元，故除去车费外退您100元/人差价。<br/><span style="color: rgb(255, 0, 0) !important"><strong>4、莫高窟2017年实行实名制网上购票制度，如若取消预订则具体损失如下：</strong></span><br/>如距预订参观时间15日以内（含15日）如退票收取票价的5%，距预订参观时间48小时以内（含48小时）24小时以上退票的，收取票价的10%的损失，距预订参观时间24小时以内（含24小时）退票的，收取票价的20%的损失，预订参观时间过期退票的，收取票<strong>价的50%的损失。<br/><span style="color: rgb(255, 0, 0) !important">5、7月-10月期间为西北旅游旺季，会根据莫高窟预约时间，前后景点会有所调整，给您带来不变敬请谅解！</span></strong><br/><span style="color: rgb(0, 0, 255) !important"><strong>备注:莫高窟预约按照下单前后顺序进行，为了保证游览请尽早报名！</strong></span></p><p><br/></p>', '宿湖畔赏日出日落，摄影游，玩嗨篝火，可升兰新高铁 ', '2017-07-28 02:30:51', '20170728/d83ca4005cbefa9da5c0790fd505901b.jpg', '是'),
(15, 8, '张掖+嘉峪关+敦煌莫高窟', '一A景区', 5780, '20170728/0490cdbb40cec9e011b4b0d27c8458af.jpg', '暑期指定团期住1晚敦煌山庄', 23, '自然风光', '<h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">产品概要</h3><p>行程天数：<span style="color: rgb(51, 51, 51);">7天6晚</span></p><p>成团地点：<span style="color: rgb(51, 51, 51);">西宁成团</span></p><p>目的地：<span style="color: rgb(51, 51, 51);">张掖</span></p><p>往返交通：<span style="color: rgb(51, 51, 51);">飞机/飞机</span></p><p>报名截止时间：<span style="color: rgb(51, 51, 51);">团期前2天18点</span></p><p>组团形式：&nbsp;<span style="color: rgb(51, 51, 51);">联合发团；本产品与其他旅行社联合发团。 根据发团需要，本产品在部分行程段发生团友的变化，请您谅解。拼团次数约为1次，具体次数及行程段视线路收客情况而定。本产品在游玩过程中会有当地参团的团友中途加入。</span></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">产品特色</h3><p><strong>产品特色详情</strong><br/><br/></p><p><img src="http://m.tuniucdn.com/fb2/t1/G3/M00/04/B1/Cii_NllDWwCIds0xABISmOQisIkAAAeCQPbmrIAEhKw540_w1536_h0_c0_t0.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/04/B1/Cii_NllDWwCIds0xABISmOQisIkAAAeCQPbmrIAEhKw540_w1536_h0_c0_t0.jpg" style="border: 0px; width: 1018px; height: auto;"/></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">特别优惠</h3><p>赠送一：塔尔寺专业讲解；<br/>赠送二：张掖丹霞景区内环保车；<br/>赠送三：敦煌莫高窟景区内区间车；<br/>赠送四：每人每天1瓶矿泉水；<br/><span style="line-height: 1.2;">旅游归来写好评可返现哦！详情请咨询途牛客服；</span></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">重要提示</h3><p><strong><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">❤<span class="_000000" style="color: rgb(0, 0, 0) !important;">常见问题</span>❤</span></strong><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">问：这个产品是涵盖精华景点了吗？</span><br/><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">答：是的，您的一次出游，涵盖了甘肃、青海两个目的地，精华景点都涵盖了~</span><br/><span style="color:#ff0000"><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">问：外宾可以报名吗？</span></span><br/><span style="color:#ff0000">答：外宾可以接受预定~</span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">问：吃的条件怎么样？</span><br/><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">答：全程都是40元/人餐标，顿顿都有特色美食，产品经理亲自定制哦~</span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">问：全程会有强行消费吗？</span><br/><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">答：这个您不必担心，咱们这个团的标准是美食美宿，高标操作，没有任何隐形消费呢~</span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">问：多人报名出现单人或单人出行是否可以拼住？</span><br/><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">答：酒店有少量加床服务，我社会尽量安排，如确实无法满足请当地现补房差</span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">问：当地海拔高吗？会有高原反应吗？</span><br/><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">答：这个不用担心，西宁海拔约2200米，青海湖3300米，敦煌海拔约1100米；</span><br/><span style="color:#ff0000"><br/>特别提醒<br/></span><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">★★★【关于敦煌山庄】<br/></span><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">除部分团期外，行程均安排1晚入住敦煌山庄，体验鸣沙山下古堡酒店，让您的旅行更有特色。如您需入住敦煌山庄，请择期出行！</span><br/><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">（6.11/7.2/7.15/7.16/7.25/7.27/7.29/7.30/8.12/8.13，以上团期默认安排敦煌入住华夏国际大酒店或富丽华国际大酒店）</span></p><p><br/></p>', '甘青环线，暑期指定团期住1晚敦煌山庄，40元高餐标，3晚主题酒店，0购物，双动车衔接', '2017-07-28 02:33:50', '20170728/0490cdbb40cec9e011b4b0d27c8458af.jpg', '是'),
(16, 2, '海南三亚-蜈支洲-亚龙湾6日游', '二A景区', 3553, '20170728/650c31f46052dc92207eeee84fa5f63d.jpg', '180海景连住', 422, '自然风光', '<h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">产品概要</h3><p>行程天数：<span style="color: rgb(51, 51, 51);">6天5晚</span></p><p>成团地点：<span style="color: rgb(51, 51, 51);">三亚成团</span></p><p>目的地：<span style="color: rgb(51, 51, 51);">三亚</span></p><p>往返交通：<span style="color: rgb(51, 51, 51);">飞机/飞机</span></p><p>报名截止时间：<span style="color: rgb(51, 51, 51);">团期前1天11点</span></p><p>组团形式：&nbsp;<span style="color: rgb(51, 51, 51);">途牛独家发团；本产品为途牛独家发团产品，只接受途牛客人参团。</span></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">产品特色</h3><p><img src="http://m.tuniucdn.com/fb2/t1/G3/M00/3C/14/Cii_JVlnY7iIT0dnACsrzdHv_4gAADiMwMnWlsAKyvl316_w1536_h0_c0_t0.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/3C/14/Cii_JVlnY7iIT0dnACsrzdHv_4gAADiMwMnWlsAKyvl316_w1536_h0_c0_t0.jpg" style="border: 0px; width: 1018px; height: auto;"/></p><p><strong>为什么选择我们？</strong><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ff9703">&nbsp; 牛人产品团队精益求精，成功服务10万人出游，高达96%满意度，你值得拥有。</span><br/><span style="color:#ff9703">《品牌价值》：</span>本产品为途牛独家品牌牛人专线，基于途牛数百万游客反馈精心设计，牛人专线，只做高品质跟团游。<br/><span style="color:#ff9703">《住宿升级》：</span>全程连住精选180海景房，旅游体验师亲自入住体验，浪漫氛围（大卫传奇）、空中泳池（半山锦江）、热带园林（明申高尔夫）等等满足多样喜好。<br/><span style="color:#ff9703">《吃货专享》：</span>全程指定餐厅用餐，严格把控餐饮质量，让你安心享用每一餐，尽情尝特色美食，让味蕾行走在路上。舌尖上的海南 。<br/><span style="color:#ff9703">《行程更优》：</span>只安排三亚高知名度和值得玩的5大黄金景点，每天不超过2个景点，充足时间游玩、凹造型，随心玩，享自由。<br/><span style="color:#ff9703">《专注细节》：</span>提供三亚凤凰机场专车接机服务（一般为5座小轿车或商务车），区别传统散客大巴拼车，再也不用苦苦等待接机。<br/><span style="color:#ff9703">《走心导游》：</span>客人出游归来好评如潮。无需背导游词，每位都是行走的海南百科全书，既是导游，还是朋友。做导游，我们走心。<br/><span style="color:#ff9703">《我们承诺》：绝不擅自增加购物店（包含景区自营的特产或经营性质的店铺坚决不去）</span>。如有违反，牛牛请你免费重玩。</p><p><strong>——牛人品质承诺——</strong><br/>我们用心做品质产品，不在出游前说的天花乱坠，只为您出游中的一个微笑，和归来后的口口相传；<br/>1. 绝不赠送价格低廉的自费项目，看似占了便宜，实则0体验感，还占用你自由活动的宝贵时间。<br/><span style="color:#ff6600"><span style="color:#666">2.&nbsp;<span style="color:#ff9703">关于购物店</span>：途牛行程严格按照行程单来执行，不会擅自增加购物店（绝对不会加景区自营的特产或经营性质的店铺）</span></span><br/><span style="color:#ff9703">100%0购物</span><span style="color:#ff9703">：</span><span style="color:#ff9703">承诺不去景点内购物店：南山尼泊尔馆、天堂公园的茶叶店、天涯海角的水晶、百姓厨房的美丽汇、大树公馆的美丽商城等。</span></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">接待标准</h3><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>游玩安排：</strong>景点只去精华的，只安排三亚高知名度和值得玩的5大黄金景点（亚龙湾沙滩 、亚龙湾热带天堂森林公园、蜈支洲岛纯玩海一整天、南山大小洞天、天涯海角）&nbsp;<br/>每天不超过2个景点，行程轻松不赶路</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>用餐安排：</strong>全程安排指定餐厅用餐，30元/人/餐的标准，围桌餐保证十菜一汤或自助餐</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>贴心赠送：</strong>跟团期间每成人每天赠送一瓶矿泉水350ml</p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">特别优惠</h3><p><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">只住180°海景房半自助</span>、5晚连住180°海景房+赠送免税店一日游，新玩法，你的旅行你做主。请点击下方线路链接，移动端可搜索线路编号。<br/>（210456814）<a href="http://www.tuniu.com/tour/210456814" style="text-decoration-line: none; color: rgb(34, 194, 51);">&lt;三亚半自助6日游&gt;自由假期，180度海景房推窗看海，24H专车接机，1单1团热门景点DIY</a><br/><span style="color:#ff0000">只住180°海景房半跟团6日游</span>、2天跟团+自由活动<br/>（<span style="color:#0000ff">210478418</span>）<a href="http://www.tuniu.com/tour/www.tuniu.com/tour/210478418" style="text-decoration-line: none; color: rgb(34, 194, 51);">&lt;三亚半跟团6日游&gt;纯玩假期，只住180海景，国际五星酒店任选，2天跟团热门景点，专属美食锦囊</a><br/><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">全年爆单同款7日游</span>、3天跟团热门景点，2天自由活动，享自由，轻度假。请点击下方线路链接，移动端可搜索线路编号。<br/>（<span class="_0000FF" style="color: rgb(0, 0, 255) !important;">210189398</span>）<a href="http://www.tuniu.com/tour/210189398" target="_blank" style="text-decoration-line: none; color: rgb(34, 194, 51);">&lt;海南三亚-蜈支洲-天堂-大小洞天-天涯7日游&gt;全年爆单，纯玩0购物，宿180海景不挪窝，24H专车接机，10万人出游</a></p><p><br/></p>', '180海景连住，可升挂五一线海景天通，24H专车接机，爆款8万人出游', '2017-07-28 02:36:42', '20170728/650c31f46052dc92207eeee84fa5f63d.jpg', '是'),
(17, 1, '北京双飞5日游', '三A景区', 2079, '20170728/1e763cb9a6f4b2926ac067d3a4768609.jpg', '探秘中国科技馆', 4324, '人文风景', '<h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">产品概要</h3><p>行程天数：<span style="color: rgb(51, 51, 51);">5天4晚</span></p><p>成团地点：<span style="color: rgb(51, 51, 51);">北京成团</span></p><p>目的地：<span style="color: rgb(51, 51, 51);">北京</span></p><p>往返交通：<span style="color: rgb(51, 51, 51);">飞机/飞机</span></p><p>报名截止时间：<span style="color: rgb(51, 51, 51);">团期前1天15点</span></p><p>组团形式：&nbsp;<span style="color: rgb(51, 51, 51);">途牛独家发团；本产品为途牛独家发团产品，只接受途牛客人参团。</span></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">产品特色</h3><p><strong>牛人专线商务爆款热销</strong><br/><br/></p><p><img src="http://m.tuniucdn.com/fb2/t1/G3/M00/47/1B/Cii_Lllt0GeIac3eABtKmYep1RcAAEItwBKY3wAG0qx476_w1536_h0_c0_t0.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/47/1B/Cii_Lllt0GeIac3eABtKmYep1RcAAEItwBKY3wAG0qx476_w1536_h0_c0_t0.jpg" style="border: 0px; width: 1018px; height: auto;"/></p><p><strong>牛人爆款，超值赠礼</strong><br/>什么是牛人专线？<br/><span style="color:#ff6600">答：牛人专线是途牛旅游网独家推出的产品系列，行程自主研发、安排透明，精选品牌接待社，提供优质服务，只接受途牛客人参团，独立成团，拒绝任何形式的散拼，滚班，服务贴心周到。</span><br/><span style="color:#ff6600">【简单出游，惠心享受】每天每人一瓶矿泉水；每人一张天安门集体彩照</span><br/><span style="color:#ff6600">【牛人专享，贴心服务】全程一车一导，精选牛人优质导游</span>，旅途安心<br/><span style="color:#ff6600">【美食之旅，暖心赠送】两顿高标用餐</span>，直隶官府宴，不一样的享受，<span style="color:#ff6600">赠送一餐北京老字号全聚德烤鸭或者便宜房烤鸭</span><br/><span style="color:#ff6600">【精华景点，一网打尽】</span>畅游故宫，勇攀长城，<span style="color:#ff6600">暑期7月1号开始特别赠送升旗仪式、探秘中国科技馆，7月15号-8月20号团期更可内观清华/北大</span><br/>★用车保证：10人-20人：21座小金龙；21人-37人：33座以上中型车；38人及以上：49座旅游车&nbsp;</p><p><strong>航班特别说明</strong><br/>关于特价中联航（KN）和西部航空（PN）航班特别说明，请在预订前仔细阅读：<br/>★行李服务（本机票内未含行李费，请按航空公司要求支付费用）<br/>1、自2015年3月29日起（以实际乘机日期为准），除机票产品本身包含或者旅客个人意愿单独购买之外，中联航和西部航空的普通机票将不再提供免费托运行李服务。<br/>2、免费随身携带行李不能超过10KG<br/>指可以随身带入客舱内的行李，每件重量不能超过10千克且体积不超过20×30×40厘米，如公文包、旅行包；每人可随身携带1件随身行李。超过上述标准行李应作为托运行李运输。<br/>3、付费托运行李<br/>不能带入客舱内的随飞机托运至目的地的行李，重量每件不能超过50千克且体积不超过40×60×100厘米，超过上述标准的行李，须现场咨询工作人员同意后方能托运。&nbsp;</p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">接待标准</h3><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>用餐安排：</strong>4早酒店中西自助早餐4正餐：2正餐餐标30元/人【包含1餐饺子宴30元/人，7月份团期开始改为品尝老北京特色炸酱面30元/人】，2正餐餐标50元/人【包含1正餐北京烤鸭50元/人】</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>住宿安排：</strong>参考酒店：和颐品牌酒店、丽枫品牌酒店、行者居酒店、中认泰华酒店、温特莱品牌酒店，北京松越大酒店，北京龙威时尚酒店，华沿酒店、北京龙爪树宾馆、西荣阁酒店、咭啡品牌酒店、锦江都城大酒店</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>行程安排：</strong>全程一车一导，让您旅途安心（没有意外情况全程不会更换导游和车）</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>游玩安排：</strong>老字号云集地——前门商业大街 &nbsp;<br/>鸟巢回忆2008年奥运盛事&nbsp;<br/>外观中国高等学府感受学子气息——清华大学和北京大学&nbsp;<br/>内九外七皇城四九门八典一口钟——鼓楼：晨钟暮鼓，敲钟纳福&nbsp;<br/>经典行程：八达岭长城、天安门广场、故宫、天坛、颐和园、圆明园、毛主席纪念堂、王府井步行街 、奥林匹克公园、鸟巢、水立方、7月份团期开始升旗仪式、探秘科技馆</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>贴心赠送：</strong>每天每人一瓶水；每人一张天安门集体彩照；赠送一餐北京老字号全聚德烤鸭或者便宜房烤鸭；暑期7月1号开始特别赠送升旗仪式、探秘中国科技馆；7月15号-8月20号团期更可内观清华/北大</p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">特别优惠</h3><p><strong><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">（4月-10月）旺季门票老年人优惠：60周岁以上凭身份证按旅行社协议价退半价门票50元、年满70周岁客人凭身份证按旅行社协议价退半价门票70元</span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">（11月-次年3月）淡季门票老年人优惠：60周岁以上凭身份证按旅行社协议价退半价门票40元、年满70周岁客人凭身份证按旅行社协议价退半价门票50元</span></strong><br/><span class="_FF0000" style="color: rgb(255, 0, 0) !important;"><strong>*门票退款领取方式：团期结束后，请联系客服领取*</strong></span></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">重要提示</h3><p><span class="_0000FF" style="color: rgb(0, 0, 255) !important;"><strong><span class="_FF0000" style="color: rgb(255, 0, 0) !important;"><span class="_FF0000">1．我该如</span><span class="_FF0000">何取机票？</span></span></strong></span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">答：机票需提前2小时抵达机场凭本人二代身份证原件根据订票信息到机场窗口换取登机牌安检登机。</span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;"><strong><span class="_FF0000" style="color: rgb(255, 0, 0) !important;"><span class="_FF0000">2.如三人出游可以三个人睡一间</span><span class="_FF0000">房？酒店可以加床吗？</span></span></strong></span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">答：酒店可以3个人住一个标间，会退第三人单房差，也可以补齐单房差住2个标间，也可以选择三人间或者加床服务，小部分酒店无加床服务。1.5米以上儿童请直接选择报名成人价格</span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;"><strong><span class="_FF0000" style="color: rgb(255, 0, 0) !important;"><span class="_FF0000">3.一人出游，</span><span class="_FF0000">可以拼房吗？</span></span></strong></span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">答：如您是只有一人出游请您在出游前补齐单房差，当地拼房成功，单房差当地现退给您。</span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;"><strong><span class="_FF0000" style="color: rgb(255, 0, 0) !important;"><span class="_FF0000">4.酒店入住的儿童</span><span class="_FF0000">含早餐吗？</span></span></strong></span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">答：不占床儿童和不占床成人需自行前台购买早餐，途牛及导游无法为您代买。</span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;"><strong><span class="_FF0000" style="color: rgb(255, 0, 0) !important;"><span class="_FF0000">5.如坐飞机来可</span><span class="_FF0000">以提供接机服务吗？</span></span></strong></span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">答：尽量安排接送服务，如无法安排请自行打车至酒店，保存好打车凭证，找导游进行现金报销。</span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;"><strong><span class="_FF0000" style="color: rgb(255, 0, 0) !important;"><span class="_FF0000">6.儿童价标准是什么？</span><span class="_FF0000">费用包含哪些？</span></span></strong></span><br/><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">答：身高1.2米（含）以下，不占床，仅含往返机票，当地旅游车车位，半价正餐、导游服务费，其他请自理（门票超高自理）。</span><br/><strong><span style="color:#ff0000">7.关于儿童故宫门票问题</span></strong><br/><span style="color:#0000ff">答：因故宫实行实名制，需要提前预约，避免出游不便。下单时儿童身高超过1.2米需选择产品升级在线购买半价故宫门票。超过1.4米的儿童可直接选择成人价，学生等优惠可退差价</span><br/><span style="color:#ff0000"><strong>毛主席纪念堂一年一度设备检修，3月1日-8月30日关闭，届时改为外观，敬请谅解。</strong></span></p><p><br/></p>', '观升旗仪式，探秘中国科技馆，品老北京特色美食，体验老炮儿生活', '2017-07-28 02:40:23', '20170728/1e763cb9a6f4b2926ac067d3a4768609.jpg', '是'),
(18, 1, '北京-故宫-中国科学技术馆-孔庙国子监4日游', '一A景区', 1173, '20170728/2ca20342bf13ec9e93f1463adff47ecf.jpg', '亲子阖家欢', 432, '人文风景', '<h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">产品概要</h3><p>行程天数：<span style="color: rgb(51, 51, 51);">4天3晚</span></p><p>成团地点：<span style="color: rgb(51, 51, 51);">北京成团</span></p><p>目的地：<span style="color: rgb(51, 51, 51);">北京</span></p><p>往返交通：<span style="color: rgb(51, 51, 51);">自行安排/自行安排</span></p><p>报名截止时间：<span style="color: rgb(51, 51, 51);">团期前2天18点</span></p><p>组团形式：&nbsp;<span style="color: rgb(51, 51, 51);">联合发团；本产品与其他旅行社联合发团。 根据发团需要，本产品在部分行程段发生团友的变化，请您谅解。拼团次数约为2次，具体次数及行程段视线路收客情况而定。</span></p><p>附加说明：&nbsp;<span style="color: rgb(51, 51, 51);">本行程与其他团队客人拼往返用车。根据发团需要。行程中将换当地用车或换当地导游。可根据需要选择某段行程或升级行程，在该行程段分开安排或统一协调行程。</span></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">产品特色</h3><p><strong>产品特色详情</strong><br/>-------------------------------------------------------★亲子新品●用心设计●全面升级★------------------------------------------------<br/>这就是我们的2017“圆梦北京”亲子欢乐游，欢乐在哪里？圆梦在哪里？放心在哪里？博物馆在哪里？——来吧，到我们的首都北京来吧：<br/>此行程专为合家欢亲子游设计，是孩子们的“圆梦之旅”。到伟大祖国的首都北京，在天安门广场唱起“东方红太阳升”，登上雄伟的万里长城，在壮丽辉煌的紫禁城—故宫博物院信步漫游，走进梦想中的大学：北京大学、清华大学……带上您的孩子一起来北京吧，完成自己和孩子的“圆梦之旅”。<br/>★<span style="color:#ff9703">【亲子行动】</span>：这个假期，请放下工作，放松心情，带上你家的宝贝儿，参加我们的亲子旅行吧！我们为您挑选有文化底蕴和教育意义的景点，策划安全、舒适的亲子行程，让您和孩子在同吃、同住、同游的旅行中，加深感情，凝聚家庭亲和力，加深和谐的亲子关系。<br/>★<span style="color:#ff9703">【圆梦北京】</span>：到伟大祖国的首都北京，在天安门广场唱起“东方红太阳升”，登上雄伟的万里长城、走进壮丽辉煌的紫禁城—故宫博物院……带上您的孩子一起来北京吧，完成自己和孩子的“圆梦之旅”，棒棒哒<br/>★<span style="color:#ff9703">【艺术之旅】</span>：北京是中国的文化、科学和艺术之都，我们将安排您和孩子参观国家博物馆、中国科学技术馆等，为孩子们开阔视野，提高人文素质，陶冶情操大有帮助哒<br/>★<span style="color:#ff9703">【欢乐之旅】</span>：沉重的书包，上不完的补习班，做不完的作业，幼小的孩子或许比您还疲累。这个假期，把TA带入缤纷的欢乐旅程吧，和宝贝儿一起，登上快乐巅峰，嗨翻这个假期吧。<br/>★<span style="color:#ff9703">【独具匠心】</span>：观赏大型情景剧经典【儿童舞台剧】价值180元/人。由北京奥运会开闭幕式制作团队打造，将中国功夫同音乐、舞蹈、京剧、杂技、民俗有机融合，舞台运用高科技新手段变化多端、绚丽夺目。<br/>★<span style="color:#ff9703">【温文尔雅】</span>：游览 【孔庙国子监博物馆】价值70元/人，历代皇帝曾在此讲学。参天古树下三代进士提名碑静静矗立。不管您的宝贝儿是参加小考、中考还是高考，都可以走一走 “状元桥”，在崇圣祠的孔子像前挂一个“金榜题名”的许愿牌，这种心理上的安慰，或许真可以让宝贝儿在考场上有神奇的发挥哦。<br/>★<span style="color:#ff9703">【专家策划】</span>：北京亲子修学游行程，安全舒适，阖家同游，其乐融融，孩子们的圆梦之旅，新体验!新体会!新感触，标新立异的大北京我们来了。<br/>★<span style="color:#ff9703">【书香门第】</span>：参观清华大学或北京大学两所大学中的一所，你想读哪一所？选其一进行拍照，留下永恒的回忆。<br/>★<span style="color:#ff9703">【精心设计】</span>：修学行程，全程不安排购物商店，没有购物的困扰，轻轻松松，快乐旅行。<br/>★<span style="color:#ff9703">【舒适之旅】</span>：优选锦江集团旗下锦江之星连锁酒店或华住集团旗下的汉庭连锁酒店，轻松舒适；<br/>★<span style="color:#ff9703">【私家行程】</span>：质量保证，真正自由自在的旅行，全程没有任何强制或者诱导消费，行程时间、游览顺序等，可按照大部分游客的需求做适当调整，确保行程宽松舒适。</p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">接待标准</h3><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>行程安排：</strong>行程专为家庭亲子游设计，减少可有可无的景点，游览时间相对比较宽裕，行程比较轻松。</p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">特别优惠</h3><ul style="list-style-type: none;" class=" list-paddingleft-2"><li><p>★1、<strong style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;"><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">本线路产品无法加床，不接受拼住，如果您是单人或三人同行，需补单房差，敬请知晓。</span></strong><br style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;"/><span style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;">★2、</span><strong style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;"><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">入住时需要出示政府核发的身份证件(带照片)。请携带信用卡和现金用以支付押金或额外费用，退房时予以退还。</span></strong><br style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;"/><span style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;">★3、持有学生证、残疾人、老年证等有效证件，按照国家规定及景点相关政策享受优惠价。</span><br style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;"/><span style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;">❤您还可以选择不同出游方式，敬请点击以下线路。</span><br style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;"/><span style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;">★【京味美食悠游帝都】来试试看吧。</span><br style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;"/><span style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;">★如果您想选择当地参团四日游 四星住宿，请选择</span><a href="http://www.tuniu.com/tour/210074575" target="_blank" style="text-decoration-line: none; color: rgb(34, 194, 51); font-family: &quot;microsoft yahei&quot;; font-size: 13px;">&lt;故宫-八达岭长城-颐和园-雍和宫-天坛4日游&gt;品味皇城，故宫3小时深度游，品全聚德，雍和宫祈福（动动手指哦）</a><br style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;"/><span style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;">★如果您想选择当地参团四日游 五星住宿，请选择</span><a href="http://www.tuniu.com/tour/210042285" target="_blank" style="text-decoration-line: none; color: rgb(34, 194, 51); font-family: &quot;microsoft yahei&quot;; font-size: 13px;">&lt;故宫-八达岭长城-颐和园-雍和宫-天坛4日游&gt;故宫皇宫深度游，住挂5酒店，品全聚德，仿膳宫廷菜（动动手指哦）</a><br style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;"/><strong style="font-family: &quot;microsoft yahei&quot;; font-size: 13px;"><span style="line-height: 15.6px;">★如果您想选择当地参团四日游 连锁酒店产品，请选择<a href="http://www.tuniu.com/tour/210056509" target="_blank" style="text-decoration-line: none; color: rgb(34, 194, 51);">&lt;故宫-八达岭长城-颐和园-雍和宫4日游&gt;地道京味之选，玩转老北京，优选商务连锁锦江汉庭，探秘恭王府，品庆丰包子</a><br/>★如果您想选择当地参团三日游 连锁酒店产品，请选择<a href="http://www.tuniu.com/tour/210039983" target="_blank" style="text-decoration-line: none; color: rgb(34, 194, 51);">&lt;天安门-故宫-颐和园-八达岭-雍和宫3日游&gt;观升旗仪式，玩转老北京，住锦江汉庭酒店，信步胡同游，地道京味儿，接送火车站</a></span></strong><br/></p></li></ul><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">重要提示</h3><p><span style="line-height: 15.6px;"><strong><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">重要提示：如您成人携带一名儿童为1.2米以上-1.5米儿童且儿童不占床，包含学生门票（凭学生证），当地车位，半价正餐费（不含早），请选择升级方案——【儿童不占床方案】<br/></span></strong></span><br/><span style="line-height: 15.6px;"><strong><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">★1、<span class="_0000FF" style="color: rgb(0, 0, 255) !important;"><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">天安门广场、故宫博物院预约需要提供身份证号码，请下单时完整填写<span class="_0000FF" style="color: rgb(0, 0, 255) !important;">身份证号码和姓名（无身份证可供护照号码及出生年月）</span></span>。</span></span></strong></span><br style="line-height: 15.6px;"/><span style="line-height: 15.6px;"><strong><span class="_FF0000" style="color: rgb(255, 0, 0) !important;"><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">尤其是故宫博物院规定旅行社参团客人网上实名制预约，如有特殊证件报名时必须提供扫描件，未提供者按照正常程序购票，预约完毕后持优惠证件的游客不予退任何费用，额外产生其他费用现付景区售票处！</span></span></strong></span><br style="line-height: 15.6px;"/><span style="line-height: 15.6px;"><strong><span class="_FF0000" style="color: rgb(255, 0, 0) !important;"><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">2、如儿童身高超1.2米.团队预约故宫需要购买儿童票,故宫博物院实施实名制预约，请参团游客出游时务必携带有效身份证件，否则因个人原因未能入园损失自付。</span></span></strong></span></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">交通信息</h3><p><span style="line-height: 15.6px;"><strong><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">★</span></strong></span><strong style="line-height: 15.6px;"><span class="_0000FF" style="color: rgb(0, 0, 255) !important;">请下单产品时告知抵京/离京：车次/班次信息及时间。</span></strong><br style="line-height: 15.6px;"/><strong style="line-height: 15.6px;"><span class="_0000FF" style="color: rgb(0, 0, 255) !important;"><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">接站：</span>无需接站的游客朋友请自行前往酒店，导游将在提前一天晚上与您约定具体集合地点，敬请保持手机畅通！</span></strong><br style="line-height: 15.6px;"/><strong style="line-height: 15.6px;"><span class="_0000FF" style="color: rgb(0, 0, 255) !important;"><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">送站：</span>如您需安排送火车站请您在订单中备注车次信息，无备注视为行程结束自动散团，我社无法安排送站，敬请知晓！</span></strong><br/><strong style="line-height: 15.6px;"><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">*本线路行程导游在不减少景点数量、游览时间及用餐次数的基础上，会对游览景点的前后顺序进行调整，给您带来的不便，敬请谅解。</span></strong><br style="line-height: 15.6px;"/><strong style="line-height: 15.6px;"><span class="_FF0000" style="color: rgb(255, 0, 0) !important;">*北京常年交通拥挤，可能会通往景区道路都较为拥堵，导游会根据实际情况错开时间，有可能起床时间较早，还请谅解。</span></strong></p><p><br/></p>', '亲子阖家欢，嗨翻一夏无购物，观精彩儿童舞台剧，品味国学文化，探索科技馆', '2017-07-28 02:52:24', '20170728/2ca20342bf13ec9e93f1463adff47ecf.jpg', '是'),
(19, 7, '成都-九寨沟-黄龙-卧龙熊猫-都江堰双飞6日游', '一A景区', 7039, '20170728/a463a28eec5a6b719a5ae152402147f9.jpg', '轻奢主义', 4333, '人文风景', '<h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">产品概要</h3><p>行程天数：<span style="color: rgb(51, 51, 51);">6天5晚</span></p><p>成团地点：<span style="color: rgb(51, 51, 51);">成都成团</span></p><p>目的地：<span style="color: rgb(51, 51, 51);">成都</span></p><p>往返交通：<span style="color: rgb(51, 51, 51);">飞机/飞机</span></p><p>报名截止时间：<span style="color: rgb(51, 51, 51);">团期前1天18点</span></p><p>组团形式：&nbsp;<span style="color: rgb(51, 51, 51);">联合发团；本产品与其他旅行社联合发团。</span></p><p>附加说明：&nbsp;<span style="color: rgb(51, 51, 51);">本行程与其他团队客人拼往返用车。</span></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">产品特色</h3><p><img src="http://m.tuniucdn.com/fb2/t1/G3/M00/48/63/Cii_LlluwNaILeMbABGX9TL7V4YAAEOcgLgHiIAEZgN876_w1536_h0_c0_t0.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G3/M00/48/63/Cii_LlluwNaILeMbABGX9TL7V4YAAEOcgLgHiIAEZgN876_w1536_h0_c0_t0.jpg" style="border: 0px; width: 1018px; height: auto;"/></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">接待标准</h3><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>购物安排：</strong>自愿消费</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>住宿安排：</strong>成 都：二晚指定尊悦豪生酒店，位置地段好，设施新（房间内设wifi），详见行程！&nbsp;<br/>川主寺：当地性价比较高的酒店，入住绝不后悔！（房间内设wifi）&nbsp;<br/>九寨沟：特别升级天源豪生酒店，详见行程！</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>用餐安排：</strong>包含二次特色用餐（导游根据行程安排、都江堰特色小吃）</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>游玩安排：</strong>★把沿途美景一网打尽，让牛人们每天的游程都精彩！<br/>九寨沟风景区 黄龙景区 都江堰风景区 卧龙大熊猫保护基地 高原藏寨</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>行程安排：</strong>正规旅游车、专职导游、旅游组合险为您保驾护航，以保障行程的合理、安全，让您驻足每一处蕴育高原美景、文化之地&nbsp;<br/>★牛人入住酒店定点发车（完团），免去象常规团一样舟车劳顿前往集合地（入住地）的颠簸劳苦★</p><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>贴心赠送：</strong>1次九寨天源豪生温泉体验</p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">特别优惠</h3><p><span style="color:#0000ff"><span style="color:#ff0000"><span style="color:#000">&gt;&gt;&gt;&gt;品质出行，牛牛推荐您0购物线路&lt;&lt;&lt;&lt;</span><br/><span style="color:#000">详情点击：</span></span><span style="color:#0000ff"><a href="http://www.tuniu.com/tour/210318782" style="text-decoration-line: none; color: rgb(34, 194, 51);">&lt;成都-九寨沟-黄龙-卧龙熊猫-都江堰双飞6日游&gt;牛人0购物，缘起都江堰，情定九寨沟，约看卧龙熊猫</a></span><br/></span>&gt;&gt;&gt;&gt;省时省心玩九寨，牛牛推荐您三飞线路，飞机出九寨&lt;&lt;&lt;&lt;<br/>详情点击：<a href="http://www.tuniu.com/tour/210409619" style="text-decoration-line: none; color: rgb(34, 194, 51);">&lt;成都-都江堰-卧龙熊猫基地-黄龙-九寨沟三飞6日游&gt;飞机出九寨，叹九寨黄龙惊奇，去卧龙看熊猫，吃特色熊猫餐</a></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">重要提示</h3><p><span style="color:#0000ff">温馨提示：</span><br/>2016年11月16号起，九寨沟开通实行二代身份证识别进入景区。出游期间请携带本人有效第二代身份证或个人有效身份证件（护照、户口簿等），如有遗失请及时到当地公安机关办理临时身份证明文件。报名时请确认相关信息的准确性，如有不便，请谅解！</p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">交通信息</h3><p><strong><span style="color:#ff0000">【航班信息为“KN”请特别注意】&nbsp;</span></strong><br/><span style="color:#0000ff">1、联航机票为特价机票，一经开出不得签转、更改，退票将全部损失，仅退还单程50元/人机场建设税（根据国家规定调整另行通知）。&nbsp;</span><br/><span style="color:#ff0000">2、联航从2015年3月转成廉价航空，机票不含免费行李托运服务；不含免费餐饮服务；不含网上选座服务；航班延误或取消不提供经济补偿，但因航司或天气等不可抗力原因取消航班可在机场柜台或拨打客服电话95530（或4 00-102 -6666）进行改签或在购买机票单位进行机票金额全退处理，不再提供经济补偿。</span>&nbsp;<br/><span style="color:#0000ff">3、目前可提供服务：免费随身携带一件不超过10千克且体积不超过20*30*4 0厘米的行李；您可以在中联航新版官网上购买您需要的托运行李额和航空延误保险；您也可以在中联航官网或航班飞行中向乘务员购买您需要的餐食。</span></p><p><br/></p>', '轻奢主义，酷暑九寨好清凉，4晚豪生酒店，1次温泉体验，标配航空座椅大巴，享记忆棉U型枕', '2017-07-28 02:55:23', '20170728/a463a28eec5a6b719a5ae152402147f9.jpg', '是'),
(20, 7, '成都-九寨沟-黄龙-峨眉山-乐山双飞7日游', '四A景区', 6079, '20170728/911852011b9318009269702cf6d3d305.jpg', '一览巴蜀', 432, '人文风景', '<h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">产品概要</h3><p>行程天数：<span style="color: rgb(51, 51, 51);">7天6晚</span></p><p>成团地点：<span style="color: rgb(51, 51, 51);">成都成团</span></p><p>目的地：<span style="color: rgb(51, 51, 51);">乐山</span></p><p>往返交通：<span style="color: rgb(51, 51, 51);">飞机/飞机</span></p><p>报名截止时间：<span style="color: rgb(51, 51, 51);">团期前1天18点</span></p><p>组团形式：&nbsp;<span style="color: rgb(51, 51, 51);">联合发团；本产品与其他旅行社联合发团。 根据发团需要，本产品在部分行程段发生团友的变化，请您谅解。拼团次数约为3次，具体次数及行程段视线路收客情况而定。</span></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">产品特色</h3><p><strong>吃住行娱购</strong><br/><span style="color:#ff9703">九黄娥乐，川蜀景点一览无余，语言太贫瘠，不能表达出九黄的唯美和娥乐的霸气，跟随着途牛去看一看吧~~</span><br/>【<span style="color:#ff9703">用餐</span>】因九寨沟地处高原，物品稀缺，用餐比较艰苦，您可根据自身情况适带干粮。但是我们还是为您精心准备了当地特色中餐。<br/>【<span style="color:#ff9703">住宿</span>】3晚成都商务标间住宿（靠近市中心），2晚九寨沟沿线标准间住宿，1晚峨眉山舒适酒店住宿，确保酒店干净卫生舒适。<br/>【<span style="color:#ff9703">行程</span>】根据实际人数选用空调旅游车，保证一人一个正座；（散客接送服务为出租面包车，接车不配导游）。<br/>【<span style="color:#ff9703">活动</span>】根据您的需求，自愿选择自费项目，丰富您的行程。</p><p><strong>温馨提示</strong><br/></p><p><img src="/ueditor/php/upload/image/20170728/1501253841957537.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G2/M00/2F/A9/Cii-T1g9PQCIPnJvAB6JxEzs9q0AAE9rQCEmjIAHonc118_w1536_h0_c0_t0.jpg" style="border: 0px; width: 1018px; height: auto;"/></p><p><img src="/ueditor/php/upload/image/20170728/1501253841822815.jpg" data-src="http://m.tuniucdn.com/fb2/t1/G2/M00/2F/A9/Cii-Tlg9PTeIMj6CABh-fv0L4tcAAE9rQNYYeYAGH6W159_w1536_h0_c0_t0.jpg" style="border: 0px; width: 1018px; height: auto;"/></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">接待标准</h3><p class="item-label" style="margin-top: 0px; margin-bottom: 0px; margin-left: -10px; padding: 0px 0px 0px 110px; position: relative;"><strong style="position: absolute; left: 0px; top: 0px;"><span class="dot" style="padding: 0px 20px 0px 10px;">•</span>娱乐安排：</strong>自愿参加</p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">重要提示</h3><p><span style="color:#ff0000">1、如三人出游可以三个人睡一间房？酒店可以加床吗？</span><br/><span style="color:#0000ff">答：全程可安排三人间或者加床，无需补差价。</span><br/><span style="color:#ff0000">2、一人出游，可以拼房吗？</span><br/><span style="color:#0000ff">答：如您是只有一人出游请您在出游前补齐单房差，当地拼房成功，单房差当地现退给您。</span><br/><span style="color:#ff0000">3、如果提前一晚/延后一晚入住酒店是否可以？是否安排接送机？</span><br/><span style="color:#0000ff">答：可以安排接送机。提前住/延住一晚酒店160/间（行程参考酒店），国庆等节假日另询。</span><br/><span style="color:#ff0000">4、自己订飞机来可以提供接机服务吗？</span><br/><span style="color:#0000ff">答：可以安排。请将航班时间告知客服，我们将为您安排。</span></p><h3 style="margin: 0px; padding: 0px 0px 0px 10px; font-size: 16px; height: 20px; border-left: 4px solid rgb(34, 194, 51); line-height: 20px;">交通信息</h3><p><span style="color:#ff0000">此线路支持在线自选机票，具体查询方法如下：</span><br/>点击“<span style="color:#0000ff">日历牌</span>”上相应“<span style="color:#0000ff">出发日期</span>”—“<span style="color:#0000ff">立即预订</span>”—“<span style="color:#0000ff">机票信息</span>”处显示目前价格对应的航班号及航班时间。如您需要更改航班时间，可以点击“<span style="color:#0000ff">更改机票</span>”，可以查询其他航班时间及相应差价。<br/>前台起价为<span style="color:#0000ff">实时计价</span>，以当天查询到的最低航班价格计算，您可以根据自己的选择更换航班补足相应差价。不同出发团期价格可能会因航班价格而浮动，并非固定不变，每团期特价票有限，建议您尽快下单。</p><p><br/></p>', '一览巴蜀，3大特色中餐，峨眉上金顶，乐山进景区', '2017-07-28 02:57:23', '20170728/911852011b9318009269702cf6d3d305.jpg', '是');

-- --------------------------------------------------------

--
-- 表的结构 `tr_shopcar`
--

CREATE TABLE IF NOT EXISTS `tr_shopcar` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `gid` int(11) NOT NULL COMMENT '商品ID',
  `picture` text NOT NULL COMMENT '产品图片地址',
  `info` text NOT NULL COMMENT '商品信息',
  `price` int(11) NOT NULL COMMENT '单价',
  `num` int(11) NOT NULL COMMENT '数量',
  `posts` int(11) NOT NULL COMMENT '运费',
  `stock` int(11) NOT NULL,
  `status` char(32) NOT NULL DEFAULT '在售' COMMENT '状态',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tr_user`
--

CREATE TABLE IF NOT EXISTS `tr_user` (
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `username` char(32) NOT NULL COMMENT '用户名',
  `password` text COMMENT '密码',
  `email` text COMMENT '邮箱',
  `sex` char(32) DEFAULT NULL COMMENT '性别',
  `birthday` text COMMENT '生日',
  `phone` text COMMENT '电话',
  `city` text COMMENT '城市',
  `regTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `level` char(32) NOT NULL DEFAULT '普通会员' COMMENT '用户等级',
  `regIP` int(32) DEFAULT NULL COMMENT '注册IP',
  `logIP` int(32) DEFAULT NULL COMMENT '登录IP',
  `score` int(11) DEFAULT '0' COMMENT '积分',
  `icon` text COMMENT '头像地址'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tr_user`
--

INSERT INTO `tr_user` (`uid`, `username`, `password`, `email`, `sex`, `birthday`, `phone`, `city`, `regTime`, `level`, `regIP`, `logIP`, `score`, `icon`) VALUES
(1, 'aa', '46f94c8de14fb36680850768ff1b7f2a', '12@qq.com', '男', '2017-06-06', '13668666866', '北京', '2017-07-13 13:13:02', '普通用户', 12345678, 123445, 298, '/uploads/20170728/f63dd860e8df62ec0d7a78bd996a40bf.jpg'),
(2, 'test01', '46f94c8de14fb36680850768ff1b7f2a', '123@66.com', NULL, NULL, '13012341234', '上海', '2017-07-19 10:40:03', '普通用户', NULL, NULL, 20, NULL),
(3, 'admin66', '46f94c8de14fb36680850768ff1b7f2a', '456@163.com', NULL, NULL, '17610828959', '北京', '2017-07-19 13:46:09', '普通用户', NULL, NULL, 653, '/uploads/1.jpg'),
(5, 'Tony', NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-28 11:19:06', '普通会员', NULL, NULL, 0, '/uploads/20170728/a64a2632c5945a62c8cc6b8c4a7d15e0.jpg'),
(6, '炫酷舞杰', NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-28 13:53:28', '普通会员', NULL, NULL, 0, 'http://q.qlogo.cn/qqapp/100378832/2BAD0E587DF8A068F1D04588756B43D3/100');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tr_access`
--
ALTER TABLE `tr_access`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `tr_account`
--
ALTER TABLE `tr_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_address`
--
ALTER TABLE `tr_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_admin`
--
ALTER TABLE `tr_admin`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `tr_admin_role`
--
ALTER TABLE `tr_admin_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_artcle`
--
ALTER TABLE `tr_artcle`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `tr_banner`
--
ALTER TABLE `tr_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_collect`
--
ALTER TABLE `tr_collect`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_comment`
--
ALTER TABLE `tr_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_goods`
--
ALTER TABLE `tr_goods`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `tr_goods_category`
--
ALTER TABLE `tr_goods_category`
  ADD PRIMARY KEY (`typeid`);

--
-- Indexes for table `tr_goods_order`
--
ALTER TABLE `tr_goods_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_log`
--
ALTER TABLE `tr_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_place`
--
ALTER TABLE `tr_place`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `tr_role`
--
ALTER TABLE `tr_role`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `tr_role_access`
--
ALTER TABLE `tr_role_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_scenery`
--
ALTER TABLE `tr_scenery`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `tr_shopcar`
--
ALTER TABLE `tr_shopcar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_user`
--
ALTER TABLE `tr_user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tr_access`
--
ALTER TABLE `tr_access`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tr_account`
--
ALTER TABLE `tr_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tr_address`
--
ALTER TABLE `tr_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tr_admin`
--
ALTER TABLE `tr_admin`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tr_admin_role`
--
ALTER TABLE `tr_admin_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tr_artcle`
--
ALTER TABLE `tr_artcle`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tr_banner`
--
ALTER TABLE `tr_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tr_collect`
--
ALTER TABLE `tr_collect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tr_comment`
--
ALTER TABLE `tr_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tr_goods`
--
ALTER TABLE `tr_goods`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '特产ID',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tr_goods_category`
--
ALTER TABLE `tr_goods_category`
  MODIFY `typeid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tr_goods_order`
--
ALTER TABLE `tr_goods_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `tr_log`
--
ALTER TABLE `tr_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tr_place`
--
ALTER TABLE `tr_place`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tr_role`
--
ALTER TABLE `tr_role`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tr_role_access`
--
ALTER TABLE `tr_role_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tr_scenery`
--
ALTER TABLE `tr_scenery`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tr_shopcar`
--
ALTER TABLE `tr_shopcar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tr_user`
--
ALTER TABLE `tr_user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
