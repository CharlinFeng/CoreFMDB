![image](./CoreFMDB/2.png)<br />


    Charlin出框架的目标：简单、易用、实用、高度封装、绝对解耦！



# CoreFMDB
   MJExtension续作之一：取代Core Data的利器，实现ios一键ORM的基石！
<br /><br />



致谢 THANKS
===============
1.感谢MJ <br />
感谢杰哥！致敬MJExtension！希望大家支持杰哥的事业！<br />
小码哥IT教育：http://www.520it.com
![image](./CoreFMDB/3.png)<br />

2.感谢小饭 <br />
感谢小饭提供的英文翻译帮助，谢谢！
<br />
![image](./CoreFMDB/4.png)<br />

<br /><br /><br />



框架截图 IMAGES
===============
![image](./CoreFMDB/1.png)<br />
<br /><br />


框架系列申明 SERIES
===============

        不会写sql？别急！！！马上第二期为您解决一键全自动创表、一键CURD、
        全自动检查模型动态添加字段、模型级联CURD，这一切都是全自动的，您不需要写一句Sql！
        由于本人时间有限，并且此系列框架使用简单，但有一套完整的理论，文档较多，开源周期较长。
        第二期全自动CURD开源时间：2015年6月21日，请关注或加群（163865401）获取最新情报，谢谢

我是成都开发者，冯成林，开源是一种精神，一种分享，一种态度，或者是一种对传统模式的挑战，
这里没有炫耀，没有装逼，没有金钱，我付出的是一种精神，需要的是您的支持！
  
此系列框架的核心目标是：取代Core Data，实现一键动态缓存！


  
这是第一个框架，后面还是3个，你要问我为什么写这么散？还有一些朋友批判我，很多项目结构非常“混乱”，
其实，这是因为我有一个宏大的框架在我的所有Frameworks中，最核心的目的是解耦，
因为我个人觉得，如果是功能模块，我会尽量独立出来，站在解耦的核心思想中，我受益太多。希望您能理解。谢谢！
   
此框架是取代Core Data系列框架的第一个框架，是向MJ的MJExtension的续作以及致敬！
主要是完成MJExtension的后续工作：任意模型的一键级联动态缓存。

<br />








框架依赖 DEPENDENCE
===============
.FMDB<br />



使用说明 USAGE
===============

本框架基于FMDB，静态封装，全类方法调用，同时是线程安全的。而且您无需创建数据库对象实例并记录，绿色、简单、好用。


#### 1. 引入头文件
      #import "CoreFMDB.h"
<br/>


#### 2. 执行更新语句的方法
        /**
         *  执行一个更新语句
         *
         *  @param sql 更新语句的sql
         *
         *  @return 更新语句的执行结果
         */
        +(BOOL)executeUpdate:(NSString *)sql;
<br/>


#### 3. 执行查询语句的方法
        /**
         *  执行一个查询语句
         *
         *  @param sql              查询语句sql
         *  @param queryResBlock    查询语句的执行结果
         */
        +(void)executeQuery:(NSString *)sql queryResBlock:(void(^)(FMResultSet *set))queryResBlock;
<br/>


#### 4. 获取表的所有列
        /**
         *  查询出指定表的列
         *
         *  @param table table
         *
         *  @return 查询出指定表的列的执行结果
         */
        +(NSArray *)executeQueryColumnsInTable:(NSString *)table;

<br/>

#### 5. 获取表的记录数
        /**
         *  表记录数计算
         *
         *  @param table 表
         *
         *  @return 记录数
         */
        +(NSUInteger)countTable:(NSString *)table;
<br/>
<br/>

具体使用示例 EXAMPLE
===============
    //创建表
        BOOL res =  [CoreFMDB executeUpdate:@"create table if not exists user(id integer primary key autoIncrement,name text not null default '',age integer not null default 0);"];
        
        if(res){
            NSLog(@"创表执行成功");
        }else{
            NSLog(@"创表执行失败");
        }
    
        
        //添加数据
        BOOL res2= [CoreFMDB executeUpdate:@"insert into user (name,age) values('jack',27);"];
    
        if(res2){
            NSLog(@"添加数据成功");
        }else{
            NSLog(@"添加数据失败");
        }
    
        
        //查询出表所有的列
        NSArray *columns = [CoreFMDB executeQueryColumnsInTable:@"user"];
        
        NSLog(@"列信息：%@",columns);
    
        //查询数据
        [CoreFMDB executeQuery:@"select * from user;" queryResBlock:^(FMResultSet *set) {
            
            while ([set next]) {
                NSLog(@"%@-%@",[set stringForColumn:@"name"],[set stringForColumn:@"age"]);
            }
            
        }];
        
        
        
        //计算记录数
        NSUInteger count = [CoreFMDB countTable:@"user"];
        
        NSLog(@"当前有%@条记录",@(count));



<br />
-----
    MJExtension续作之一：取代Core Data的利器，实现ios一键ORM的基石！
-----

<br /><br />



关于Chariln INTRODUCE
===============
作者简介：Charlin(冯成林)-成都iOS工程师！<br /><br />

友情提示 MENTION
===============
Charlin（成都-冯成林）更多原创项目（涵盖了方方面面，看看还有没有你需要的）：<br />
首页：https://github.com/nsdictionary<br />
列表：https://github.com/nsdictionary?tab=repositories<br />
成都iOS开发群：163865401（Charlin创建与维护，欢迎加群交流！）<br />
<br /><br />

