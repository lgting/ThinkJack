-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2018 at 03:39 AM
-- Server version: 5.5.53
-- PHP Version: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cosmetics`
--

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE IF NOT EXISTS `carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `display` tinyint(1) unsigned DEFAULT '1',
  `sort` smallint(5) unsigned DEFAULT '0',
  `path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '父分类ID',
  `name` varchar(20) DEFAULT NULL COMMENT '分类别名',
  `title` varchar(100) DEFAULT NULL COMMENT '分类标题',
  `keywords` varchar(255) DEFAULT NULL COMMENT '分类关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '分类描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `pid`, `name`, `title`, `keywords`, `description`) VALUES
(1, 0, 'default', '默认分类', '默认分类', '默认分类描述'),
(2, 0, 'biancheng', '编程技术', '', ''),
(3, 0, 'system', '操作系统', '', ''),
(4, 0, 'news', '业界新闻', '', ''),
(5, 0, 'jianzhan', '建站教程', '', ''),
(6, 2, 'html', 'HTML', '', ''),
(7, 2, 'css', 'CSS', '', ''),
(8, 2, 'php', 'PHP', '', ''),
(9, 5, 'discuz', 'Discuz', '', ''),
(10, 5, 'wordpress', 'wordpress', '', ''),
(11, 3, 'macos', 'Mac OS', '', ''),
(12, 3, 'linux', 'Linux', '', ''),
(13, 7, 'css2', 'CSS2', '', ''),
(14, 7, 'css3', 'CSS3', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `sort` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `title`, `url`, `sort`) VALUES
(1, '安全者', 'http://www.cnsecer.com', 100);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `create_at` varchar(11) DEFAULT '0',
  `update_at` varchar(11) DEFAULT '0',
  `login_ip` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '0:禁止登陆 1:正常',
  `type` tinyint(1) DEFAULT '1' COMMENT '1:前台用户 2:管理员 ',
  PRIMARY KEY (`id`),
  KEY `username` (`username`) USING BTREE,
  KEY `password` (`password`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `username`, `email`, `password`, `create_at`, `update_at`, `login_ip`, `status`, `type`) VALUES
(1, 'admin', '15500785170@qq.com', '21232f297a57a5a743894a0e4a801fc3', '1436679338', '1540521678', '127.0.0.1', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `nav`
--

CREATE TABLE IF NOT EXISTS `nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) DEFAULT NULL,
  `pid` smallint(5) unsigned DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `sort` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `nav`
--

INSERT INTO `nav` (`id`, `title`, `pid`, `link`, `sort`) VALUES
(1, '首页', NULL, 'http://baidu,com', 1),
(5, '电器', 0, 'http://baidu,com', 2),
(6, '冰箱', 5, 'http://baidu,coma', 3),
(7, '衣帽', 0, 'http://baidu,com', 4),
(8, '袜子', 7, 'http://baidu,com', 5);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `title`, `name`, `content`) VALUES
(1, '关于我们', 'about', '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;关于我们&lt;/p&gt;&lt;p&gt;关于我们&lt;/p&gt;&lt;p&gt;关于我们&lt;/p&gt;'),
(2, '联系我们', 'contact', '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `time` varchar(11) DEFAULT '0',
  `cate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '1:普通,2:置顶,3:热门,4:推荐',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'text',
  PRIMARY KEY (`id`),
  KEY `key` (`item`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `item`, `value`, `description`, `type`) VALUES
(1, 'site-name', '安全者', '站点名', 'text'),
(2, 'site-keywords', '关键词1,关键词2', '关键词', 'text'),
(3, 'site-description', '站点描述信息', '站点描述', 'text'),
(4, 'site-tongji', '&lt;script&gt; console.log(&quot;统计代码&quot;)&lt;/script&gt;', '统计代码', 'text'),
(5, 'site-icp', '123456', 'ICP备案号', 'text'),
(6, 'site-url', 'http://www.cnsecer.com', '站点地址', 'text');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
