-- 您好，不好意思，我第一遍理解错误，后来又看了遍问卷才发现（一并发给您吧）

-- 删除已存在的存储过程
DROP PROCEDURE IF EXISTS resume_head;
-- 创建存储过程
create  procedure resume_head(IN user_name varchar(4),IN city varchar(5),IN job_age int,IN sex varchar(1),IN age int,IN birthday varchar(10),IN looking_job bool,IN e_mail varchar(20),IN phone_num varchar(11),IN household_addr varchar(5),IN marriage_state bool,IN league_member bool)
  COMMENT '简历头部'
  BEGIN
    declare look_str varchar(10) default '目前正在找工作';
    declare marriage_str varchar(2) default '未婚';
    declare league_str varchar(5) default '共青团员';
    if looking_job = false then
      set look_str = '已找到工作';
    end if;
    if marriage_state = true then
      set marriage_str = '已婚';
    end if;
    if league_member = false then
      set league_str = '群众';
    end if;
    select user_name as '姓名';
    select city as '现居住',concat(job_age,'年') as '工作经验',sex as '性别',concat(age,'岁') as '年龄',concat(birthday) as '出生日期',look_str as '是否在找工作';
    select e_mail as '邮箱',phone_num as '电话';
    select household_addr as '户口/国籍',marriage_str as '婚姻状态',league_str as '政治面貌';
  END;

DROP PROCEDURE IF EXISTS resume_income;
create procedure resume_income(IN total_salary int, in base_salary int,in subsidy int)
  COMMENT '目前年收入（单位：万元）'
  begin
    select concat(total_salary,'万元（包含基本工资、补贴、奖金、股权收益等）') as '目前年收入', concat(base_salary,'万元') as '基本工资',concat(subsidy,'万元') as '补贴/津贴';
  end;

DROP PROCEDURE IF EXISTS resume_intention;
create procedure resume_intention(in intention_salary_start FLOAT(1,1), in intention_salary_end FLOAT(1,1),in intention_addr varchar(5),in intention_position varchar(20),in trade varchar(15),in mytags varchar(200),in self_evaluation varchar(500),in arrival_time varchar(10),in job_type varchar(5))
  COMMENT '求职意向(薪资单位：万元)'
  begin
    select '求职意向';
    select concat((intention_salary_start*10000),'-',(intention_salary_end*10000),'元/月') as '期望薪资',intention_addr as '地点',intention_position as '职能/职位',trade as '行业';
    select mytags as '个人标签';
    select self_evaluation as '自我评价';
    select arrival_time as '到岗时间',job_type as '工作类型';
  end;

DROP PROCEDURE IF EXISTS resume_job_experience_item;
create procedure resume_job_experience_item(in job_time_start varchar(10),in job_time_end varchar(10),in company_name varchar(15),in job_position varchar(20),in company_desc varchar(150),in job_desc varchar(700))
  COMMENT '工作经验'
  begin
    select concat(job_time_start,'-',job_time_end) as '时间',company_name as '公司',company_desc as '公司描述',job_position as '职位',job_desc as '工作描述';
  end;

DROP PROCEDURE IF EXISTS resume_project_experience_item;
create procedure resume_project_experience_item(in project_time_start varchar(10),in project_time_end varchar(10),in project_name varchar(30),in project_desc varchar(1800),in duty_desc varchar(200))
  COMMENT '项目经验'
  begin
    select concat(project_time_start,'-',project_time_end) as '时间',project_name as '项目名称',project_desc as '项目描述',duty_desc as '责任描述';
  end;

DROP PROCEDURE IF EXISTS resume_education_experience_item;
create procedure resume_education_experience_item(in education_time_start varchar(10),in education_time_end varchar(10),in school_name varchar(15),in major varchar(15),in education_level varchar(2),in major_desc varchar(800))
  COMMENT '教育经历'
  begin
    select concat(education_time_start,'-',education_time_end) as '时间',school_name as '学校名称',major as '专业',education_level as '学历',major_desc as '专业描述';
  end;

DROP PROCEDURE IF EXISTS resume_education_condition_honor;
create procedure resume_education_condition_honor(in honor_time varchar(10),in honor_name varchar(30),in honor_level varchar(2))
  COMMENT '在校情况-- 校内荣誉'
  begin
    select honor_time as '时间',honor_name as '荣誉名称',honor_level as '级别';
  end;

DROP PROCEDURE IF EXISTS resume_education_condition_duty;
create procedure resume_education_condition_duty(in duty_time_start varchar(10),in duty_time_end varchar(10),in duty_name varchar(10),in duty_desc varchar(200))
  COMMENT '在校情况-- 校内职务'
  begin
    select concat(duty_time_start,'-',duty_time_end) as '时间',duty_name as '名称',duty_desc as '职务描述';
  end;

DROP PROCEDURE IF EXISTS resume_skill_item;
create procedure resume_skill_item(in skill_name varchar(20),in skill_degree varchar(5))
  COMMENT '技能特长-- 技能/语言'
  begin
    select skill_name as '技能名称',skill_degree as '掌握程度';
  end;

DROP PROCEDURE IF EXISTS resume_skill_certificate;
create procedure resume_skill_certificate(in certificate_time varchar(10),in certificate_name varchar(15),in certificate_score int)
  COMMENT '技能特长-- 证书'
  begin
    select certificate_time as '时间',certificate_name as '证书名称',certificate_score as '分数';
  end;

DROP PROCEDURE IF EXISTS resume_skill_train;
create procedure resume_skill_train(in train_time_start varchar(10),in train_time_end varchar(10),in train_target varchar(15),in train_organ varchar(15),in train_addr varchar(5),in train_desc varchar(700))
  COMMENT '技能特长-- 培训经历'
  begin
    select concat(train_time_start,'-',train_time_end) as '时间',train_target as '培训课程',train_organ as '地点',train_desc as '培训描述';
  end;

DROP PROCEDURE IF EXISTS resume_add_info;
create procedure resume_add_info(in add_name varchar(30),in add_link varchar(50),in add_desc varchar(500))
  COMMENT '附加信息'
  begin
    select add_name as '附件名称',add_link as '附件链接',add_desc as '附件描述';
  end;

-- 生成简历
DROP PROCEDURE IF EXISTS resume_test;
create procedure resume_test()
  COMMENT '生成简历'
  begin
    -- 简历头部
    declare  user_name varchar(4) default '余强';
    declare city varchar(5) default '南通';
    declare job_age int default 1;
    declare sex varchar(1) default '男';
    declare age int default 25;
    declare birthday varchar(10) default '1994/10/14';
    declare looking_job bool default true;
    declare e_mail varchar(20) default '2783487411@qq.com';
    declare phone_num varchar(11) default '18932203729';
    declare household_addr varchar(5) default '九江';
    declare marriage_state bool default false;
    declare league_member bool default true;

    -- 目前年收入
    declare total_salary int default 7;
    declare base_salary int default 6;
    declare subsidy int default 1;

    -- 求职意向
    declare intention_salary_start FLOAT(1,1) default 0.6;
    declare intention_salary_end FLOAT(1,1) default 0.8;
    declare intention_addr varchar(5) default '上海';
    declare intention_position varchar(20) default 'java开发工程师';
    declare trade varchar(15) default '计算机软件';
    declare mytags varchar(200) default 'Javascript  jquery  oracle  spring  springmvc  mybatis  shiro  redis  swagger  GitHub';
    declare self_evaluation varchar(500) default '您好，本人2019年7月毕业于南昌工程学院计算机科学与技术专业，在校期间热爱学习和钻研，
自主研发过几个练习项目，在大四期间参加了《江西思诚科技有限公司》为期5个月的Java工程师培训。
后来学习github，发现上面有很好的项目可以帮助自己理解相关技术和养成良好的编码规范，
了解spring boot和spring cloud。本人基础扎实，踏实肯干，乐于学习，喜欢专研技术。
希望贵公司抛出橄榄枝，我定当不遗余力，发挥自己的光和热';
    declare arrival_time varchar(10) default '一周内';
    declare job_type varchar(5) default '全职';

    -- 工作经验
    declare job_time_start varchar(10) default '2019/07';
    declare job_time_end varchar(10) default '至今';
    declare company_name varchar(15) default '通富微电子股份有限公司';
    declare job_position varchar(20) default 'EDI开发工程师';
    declare company_desc varchar(150) default '计算机软件 | 5000-10000人 | 民营公司 | 通富微电IT部';
    declare job_desc varchar(700) default '主要从事报表开发，EDI即无纸化办公，针对各个客户开发相应的报表，
                                            \t\t\t\t\t\t\t\t\t\t\t\t\t包括客户工单入库、材料入库等。应聘时找的是JAVA开发岗位，
                                            \t\t\t\t\t\t\t\t\t\t\t\t\t后来公司说C#岗位比较缺人，所以做了一年C#。在入职此岗位前一直定位于Java开发，
                                            \t\t\t\t\t\t\t\t\t\t\t\t\t具有良好的Java开发基础，在职期间勤奋学习，利用周末等业余时间掌握了shiro、Redis
                                            \t\t\t\t\t\t\t\t\t\t\t\t\t等主流Java开发框架';

    -- 项目经验一
    declare project_time_start varchar(10) default '2019/03';
    declare project_time_end varchar(10) default '2019/05';
    declare project_name varchar(30) default '基于Android的智能求职招聘系统';
    declare project_desc varchar(1800) default '一、该项目分为PC端和移动端。企业用户在PC端访问，个人用户在移动端访问
                                                \t\t二、主要分为十个模块：1、系统管理模块 2、展示首页，带条件搜索模块 3、创建、编辑基本信息模块
                                                  \t\t4、发布招聘信息模块
                                                  \t\t5、 收藏模块6、在线筛选简历模块 7、发送及收到留言模块8、在线创建及编辑简历模块
                                                  \t\t9、查看已收藏、已申请、已通过的招聘信息及来信模块
                                                  \t\t10、查看详细招聘信息、企业信息及投递简历模块
                                                \t\t三、（1）后台服务器采用mvc架构模式和SSM框架实现，各个servlet采用restfull格式的注解实现访问。
                                                          各个对象通过spring框架管理
                                                \t（2）移动端是基于SDK编写，每个页面就是一个activity，在activity之间用intent连接。
                                                  \t\t在Android App中不适合在UI线程中做访问网络，访问数据库、上传、下载等耗时操作，
                                                  \t\t因此需要使用AsyncTask异步任务和Handle消息队列机制，两者的区别是AsyncTask适合使用在频繁的短期耗时业务，
                                                  \t\tHandle消息队列机制适合使用在较少而长期进行的耗时业务。其实AsyncTask也是用handle消息对此机制实现的，
                                                  \t\t只是SDK在底层做了处理，可以在他的onPostExecute方法中操作UI。
                                                \t（3）PC和移动端通过restfull格式访问服务器获取数据
                                                \t 四、本项目采用IDEA、Android Studio、Oracle、Tomcat等工具实现';
    declare duty_desc varchar(200) default '\t\t\t\t\t\t此项目由我独自完成，
                                             \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t期间有通过看书、看视频、网上查阅方式学习，
                                             \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t历时两个月完成。同时它也是我的毕业设计';

    -- 教育经历
    declare education_time_start varchar(10) default '2013/09';
    declare education_time_end varchar(10) default '2019/07';
    declare school_name varchar(15) default '南昌工程学院';
    declare major varchar(15) default '软件工程';
    declare education_level varchar(2) default '本科';
    declare major_desc varchar(800) default '大一介绍了专业基本情况，主要课程有计算机导论、高等数学、数据结构、离散数学、c语言程序设计。大一结束后去部队服役两年
                                              \t\t\t大二主要课程有概率论与数理统计、线性代数、数据库、面向对象程序设计语言
                                              \t\t\t（Java）、电路与模拟电子技术、数字电子技术B、WEB程序设计、计算机组成原理
                                              \t\t\t大三主要课程有操作系统、软件工程、计算机网络、编译原理、软件设计与体系结构、JSP程序设计、微机原理与接口技术、软件质量保证与测试、
                                              \t\t\t软件项目管理。大四主要课程有移动应用系统开发、J2EE框架技术（ssm）、大型数据库系统技术与应用（oracle）
                                              \t\t\t本人的毕业设计是开发一个基于Android的智能求职招聘系统，基于oracle数据库，是一个典型的Javaweb项目，其中包括一部分移动开发';

    -- 在校情况 --> 在校荣誉
    declare honor_time varchar(10) default '2017/05';
    declare honor_name varchar(30) default '大学生计算机应用能力与信息素养大赛二等奖';
    declare honor_level varchar(2) default '校级';
    -- 技能特长 --> 培训经历
    declare train_time_start varchar(10) default '2018/07';
    declare train_time_end varchar(10) default '2018/12';
    declare train_target varchar(15) default 'Java软件工程师';
    declare train_organ varchar(15) default '江西思诚科技有限公司';
    declare train_addr varchar(5) default '南昌';
    declare train_desc varchar(700) default '一共分三个阶段：前端技术；Java基础；Java高级与框架技术
                                            \t\t\t\t\tJava软件工程师培训课程帮助学员对软件编程思想有充分的理解，并且可以熟练掌握JavaEE软件工程师需要的任职技能。
                                            \t\t\t\t\t1） 帮助学员熟练掌握Java编程语言，以及进行Java Web开发和相关前端技术。
                                            \t\t\t\t\t2）让学员熟练掌握java的流行框架技术：Struts2+Hibernate+Spring，springmvc+spring+mybatis
                                            \t\t\t\t\t3) 通过对软件开发企业规范和标准的了解，让学员掌握软件项目开发全过程的活动要求（立项、分析、 设计、编码、测试、部署、结项）。
                                            \t\t\t\t\t成熟的分阶段的实训模式熟练不仅帮助学员掌握了Java编程思想，还可以更好的应用到工作中';

    -- 附加信息
    declare add_name varchar(30) default '基于Android的智能求职招聘系统源码（移动端）';
    declare add_link varchar(50) default 'https://github.com/2013101942/project2.git';
    declare add_desc varchar(500) default  '基于Android的智能求职招聘系统移动端源码，可运行于手机和模拟器
                                            操作：同上';

    -- (开始调用)
    call resume_head(user_name,city,job_age,sex,age,birthday,looking_job,e_mail,phone_num,household_addr,marriage_state,league_member);
    call resume_income(total_salary,base_salary,subsidy);
    call resume_intention(intention_salary_start,intention_salary_end,intention_addr,intention_position,trade,mytags,self_evaluation,arrival_time,job_type);
    call resume_job_experience_item(job_time_start,job_time_end,company_name,job_position,company_desc,job_desc);
    select '项目经验';
    call resume_project_experience_item(project_time_start,project_time_end,project_name,project_desc,duty_desc);
     -- 项目经验二
    set project_time_start = '2018/10';
    set project_time_end = '2018/10';
    set project_name = '聊天交友模块';
    set project_desc = '本项目由团队开发，有考试、论坛、聊天交友等模块，本人负责聊天交友模块，
                        \t\t系统采用mvc模式，利用HTML、css、jQuery、jsp、servlet、jstl、jdbc、maven、SVN、IDEA、Oracle实现。
                        \t\t主要功能有陌生人信息网格显示，带条件查找、添加、删除、拉黑好友、与好友实时聊天并保存聊天信息，
                        \t\t发图片、震动提醒、建群、群聊等';
    set duty_desc = '此项目各个模块分配到个人，聊天交友模块从前端到后台由我独自完成';
    call resume_project_experience_item(project_time_start,project_time_end,project_name,project_desc,duty_desc);
    -- 项目经验三
    set project_time_start = '2018/08';
    set project_time_end = '2018/08';
    set project_name = '电信官网首页';
    set project_desc = '此项目利用HTML、css、JavaScript、jQuery、IDEA模仿电信官网效果（不与后台交互），
                        \t\t以做到和原网页几乎一模一样，
                        \t\t自己还加了一些小特效（一个小火箭，点击则回到页头；点击商品，则商品以逐渐变小的形式抛到右边的购物车）';
    set duty_desc = '\t\t\t\t\t\t\t\t\t\t\t本项目是由本人独自完成的';
    call resume_project_experience_item(project_time_start,project_time_end,project_name,project_desc,duty_desc);
    -- 项目经验四
    set project_time_start = '2017/10';
    set project_time_end = '2017/12';
    set project_name = '学生信息管理系统';
    set project_desc = '大三时期利用Java、SQL、myeclipse、oracle实现学生的基本信息的增、删、改、查、每个专业的课程编排、
                        \t\t\t不同角色的权限管理奖惩信息、学校发布通知等';
    set duty_desc = '此项目是由本人利用Javase+SQL+JDBC实现的，由本人独自完成';
    call resume_project_experience_item(project_time_start,project_time_end,project_name,project_desc,duty_desc);

    -- 教育经历
    call resume_education_experience_item(education_time_start,education_time_end,school_name,major,education_level,major_desc);

    -- 在校情况
    select '校内荣誉';
    call resume_education_condition_honor(honor_time,honor_name,honor_level);
    -- 校内荣誉二
    set honor_time = '2017/05';
    set honor_name = '南昌工程学院社区团工委拔河比赛三等奖';
    set honor_level = '校级';
    call resume_education_condition_honor(honor_time,honor_name,honor_level);
    -- 校内荣誉三
    set honor_time = '2016/10';
    set honor_name = '南昌工程学院第三十三届运动会5000米第四名';
    set honor_level = '校级';
    call resume_education_condition_honor(honor_time,honor_name,honor_level);
    -- 校内荣誉四
    set honor_time = '2014/05';
    set honor_name = '勤工助学优秀组员称号';
    set honor_level = '校级';
    call resume_education_condition_honor(honor_time,honor_name,honor_level);

    -- 技能特长 --> 培训经历
    call resume_skill_train(train_time_start,train_time_end,train_target,train_organ,train_addr,train_desc);
    select '附加信息';
    select '附件';
    call resume_add_info(add_name,add_link,add_desc);
    -- 附件二
    set add_name = '基于Android的智能招聘系统源码(后台)';
    set add_link = 'https://github.com/2013101942/project1.git';
    set add_desc = '基于Android的智能求职招聘系统后台PC端代码
                    \t\t\t\t\t\t\t\t\t\t操作：1、安装好git，找到Git安装位置，双击 Git Bash Here进入git控制台
                    \t\t\t\t\t\t\t\t\t\t2、进入想保存的文件夹路径
                    \t\t\t\t\t\t\t\t\t\t3、键入：git config --global user.name "你的github用户名"
                    \t\t\t\t\t\t\t\t\t\t4、键入：git config --global user.email "你的github邮箱地址"
                    \t\t\t\t\t\t\t\t\t\t5、键入：git clone 附件链接';
    call resume_add_info(add_name,add_link,add_desc);
  end;

-- 执行
call resume_test();