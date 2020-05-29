-- 建表
-- 基本信息
DROP TABLE IF EXISTS table_yuqiang;
create table table_yuqiang(
  user_name varchar(4) NOT NULL COMMENT '姓名',
  city varchar(5) default null COMMENT '现居住城市',
  job_age int default null COMMENT '工作经验',
  sex varchar(1) default null COMMENT '性别',
  age int default null COMMENT '年龄',
  birthday varchar(10) default null COMMENT '出生日期',
  e_mail varchar(20) default null COMMENT '邮箱',
  phone_num varchar(11) default null COMMENT '联系方式',
  income_by_year int default null COMMENT '目前年收入',
  salary varchar(10) default null COMMENT '期望薪资',
  addr varchar(5) default null COMMENT '期望地点',
  position varchar(20) default null COMMENT '职位',
  tags varchar(200) default null COMMENT '个人标签',
  self_evaluation varchar(800) default null COMMENT '自我评价',
  arrive_time varchar(10) default null COMMENT '到岗时间',
  job_type varchar(2) default '全职' COMMENT '工作类型'
)engine = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8;
-- 新增记录
insert table_yuqiang values ('余强',
                             '南通',
                             1,
                             '男',
                             25,
                             '1994/10/14',
                             '2783487411@qq.com',
                             '18932203729',
                             7,
                             '6000-8000元',
                             '上海',
                             'java开发工程师',
                             'Javascript  jquery  oracle  spring  springmvc  mybatis  shiro  redis  swagger  GitHub',
                             '您好，本人2019年7月毕业于南昌工程学院计算机科学与技术专业，
                             在校期间热爱学习和钻研，自主研发过几个练习项目，
                             在大四期间参加了《江西思诚科技有限公司》为期5个月的Java工程师培训。
                             后来学习github，发现上面有很好的项目可以帮助自己理解相关技术和养成良好的编码规范，
                             了解spring boot和spring cloud。本人基础扎实，踏实肯干，乐于学习，喜欢专研技术。
                             希望贵公司抛出橄榄枝，我定当不遗余力，发挥自己的光和热',
                             '一周内',
                             '全职');

-- 新建存储过程
DROP PROCEDURE IF EXISTS my_resume;
create procedure my_resume()
  begin
    -- 查
    select user_name as '姓名',
           city as '现居住城市',
           job_age as '工作经验',
           sex as '性别',
           age as '年龄',
           birthday as '出生日期',
           e_mail as '邮箱',
           phone_num as '联系方式',
           income_by_year as '目前年收入',
           salary as '期望薪资',
           addr as '地点',
           position as '职位',
           tags as '个人标签',
           self_evaluation as '自我评价',
           arrive_time as '到岗时间',
           job_type as '工作类型'
        from table_yuqiang;
    -- 改
     update table_yuqiang set age = 18 where user_name = '余强';
    select user_name as '姓名',
           city as '现居住城市',
           job_age as '工作经验',
           sex as '性别',
           age as '年龄',
           birthday as '出生日期',
           e_mail as '邮箱',
           phone_num as '联系方式',
           income_by_year as '目前年收入',
           salary as '期望薪资',
           addr as '地点',
           position as '职位',
           tags as '个人标签',
           self_evaluation as '自我评价',
           arrive_time as '到岗时间',
           job_type as '工作类型'
    from table_yuqiang;
    -- 删
    delete from table_yuqiang where user_name = '余强';
    select user_name as '姓名',
           city as '现居住城市',
           job_age as '工作经验',
           sex as '性别',
           age as '年龄',
           birthday as '出生日期',
           e_mail as '邮箱',
           phone_num as '联系方式',
           income_by_year as '目前年收入',
           salary as '期望薪资',
           addr as '地点',
           position as '职位',
           tags as '个人标签',
           self_evaluation as '自我评价',
           arrive_time as '到岗时间',
           job_type as '工作类型'
    from table_yuqiang;
  end;














