![image](./CoreFMDB/2.png)<br />


    Charlin出框架的目标：简单、易用、实用、高度封装、绝对解耦！<br/>
    The purpose of Charlin’s frame: simple, ease of use, practical, 
    highly packaged and absolute decoupling.



# CoreFMDB
   MJExtension续作之一：取代Core Data的利器，实现ios一键ORM的基石！
   
   One sequel for MJExtetnsion: a better tool to replace Core Data  
   and a cornerstone of achieving one key ORM for iOS.
<br /><br /><br />



致谢 THANKS
===============
#####1.感谢MJ    Thanks MJ!
![image](./CoreFMDB/3.png)<br />
感谢杰哥！致敬MJExtension！希望大家支持杰哥的事业！ <br />

小码哥IT教育：http://www.520it.com

 <br /> <br />
#####2.感谢小饭   Thanks XiaoFan!

![image](./CoreFMDB/4.png)<br />
 感谢小饭提供的英文翻译帮助，谢谢！
<br /> <br />


<br /><br /><br />


        正式开始！ Let's Go!





框架截图 IMAGES
===============
![image](./CoreFMDB/1.png)<br />
<br /><br />


框架系列申明 SERIES
===============

        不会写sql？别急！！！马上第二期为您解决一键全自动创表、一键CURD、
        全自动检查模型动态添加字段、模型级联CURD，这一切都是全自动的，您不需要写一句Sql！
        
        Doesn’t know how to write sql? No worries. Now the second part offers you one key 
        automatically create table, one key          CURD, automatically check model and 
        dynamically add field, model cascade CURD. All these things are automatic without          
        one sql code.
        
        
        
        
        由于本人时间有限，并且此系列框架使用简单，但有一套完整的理论，文档较多，开源周期较长。
        
        Due to my time constraints and ease of use these frames, the release cycle will be long.
        
        
        
        
        第二期全自动CURD开源时间：2015年6月21日，请关注或加群（163865401）获取最新情报，谢谢
        The second part  automatically CURD release date: 21/06/2015, so stay tuned or 
        
        join our qq group(163865401) to get the latest news, thanks a lot.
        
<br/><br/>
我是成都开发者，冯成林，开源是一种精神，一种分享，一种态度，或者是一种对传统模式的挑战，
这里没有炫耀，没有装逼，没有金钱，我付出的是一种精神，需要的是您的支持！<br/>
I am Charlin Feng, a developer from Chengdu, China. The true spirit of open source is 
an attitude and sharing even a challenge to the traditional way. There is no flaunt, 
pretentious or money but all my spirits which need your support.

  
此系列框架的核心目标是：取代Core Data，实现一键动态缓存！


  
这是第一个框架，后面还是3个，你要问我为什么写这么散？还有一些朋友批判我，很多项目结构非常“混乱”，
其实，这是因为我有一个宏大的框架在我的所有Frameworks中，最核心的目的是解耦，
因为我个人觉得，如果是功能模块，我会尽量独立出来，站在解耦的核心思想中，我受益太多。希望您能理解。谢谢！<br/><br/>
The core purpose of these series frames is replace to Core Data and implement one key Dynamic Cache. 
This is the first frame with other three followed.  You are gonna ask me why make these frame so separately.
Even some of my friends blame me at the “chaos” of my projects’ structure. Actually, 
it’s due to I got a magnificent frame in all my frameworks with a core purpose which is decoupling.
Because I believe that I will try my best to separate it if it’s a function module. 
I feel I benefit from the core idea of decoupling. I hope you guys could understand. Thank you very much.

<br/><br/>
   
   
此框架是取代Core Data系列框架的第一个框架，是向MJ的MJExtension的续作以及致敬！
主要是完成MJExtension的后续工作：任意模型的一键级联动态缓存。<br/><br/>
This frame is the first one of the series frame which replace to Core Data. It’s also the sequel of
MJ’s MJExtension and to MJ to pay tribute. This frame mostly finished the follow-up work of MJExtension:
any model’s one key Cascade Dynamic Cache.



<br /><br/>








框架依赖 DEPENDENCE
===============
.FMDB<br />



使用说明 USAGE
===============

本框架基于FMDB，静态封装，全类方法调用，同时是线程安全的。而且您无需创建数据库对象实例并记录，绿色、简单、好用。<br/><br/>
This frame is based on FMDB and it’s static package,  all classes method call, thread-safe at the same time. 
You don’t need to create datebase object, instance or record. It’s a green, simple and good frame.
<br/><br/>
#### 1. 引入头文件 Introduced header
      #import "CoreFMDB.h"
<br/>


#### 2. 执行更新语句的方法 the method of the update statement
        /**
         *  执行一个更新语句
         *
         *  @param sql 更新语句的sql
         *
         *  @return 更新语句的执行结果
         */
        +(BOOL)executeUpdate:(NSString *)sql;
<br/>


#### 3. 执行查询语句的方法 the method of search statement
        /**
         *  执行一个查询语句
         *
         *  @param sql              查询语句sql
         *  @param queryResBlock    查询语句的执行结果
         */
        +(void)executeQuery:(NSString *)sql queryResBlock:(void(^)(FMResultSet *set))queryResBlock;
<br/>


#### 4. 获取表的所有列 get all the rows of the table
        /**
         *  查询出指定表的列
         *
         *  @param table table
         *
         *  @return 查询出指定表的列的执行结果
         */
        +(NSArray *)executeQueryColumnsInTable:(NSString *)table;

<br/>

#### 5. 获取表的记录数 get the recored count of table
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
            NSLog(@"创表执行成功 create table succeed");
        }else{
            NSLog(@"创表执行失败 create table fails");
        }
    
        
        //添加数据
        BOOL res2= [CoreFMDB executeUpdate:@"insert into user (name,age) values('jack',27);"];
    
        if(res2){
            NSLog(@"添加数据成功 add data succeed");
        }else{
            NSLog(@"添加数据失败 add data fails");
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
    MJExtension续作之一：取代Core Data的利器，实现ios一键ORM的基石！<br/>
    One sequel for MJExtetnsion: a better tool to replace Core Data  
    and a cornerstone of achieving one key ORM for iOS.
-----

<br /><br />



关于Chariln INTRODUCE
===============
作者简介：Charlin Feng(冯成林)-成都iOS工程师！<br />
Introduce: I am Charlin Feng, a developer from Chengdu, China. 
<br />

友情提示 MENTION
===============
Charlin（成都-冯成林）更多原创项目（涵盖了方方面面，看看还有没有你需要的）：<br />
首页：https://github.com/nsdictionary<br />
列表：https://github.com/nsdictionary?tab=repositories<br />
成都iOS开发群：163865401（Charlin创建与维护，欢迎加群交流！）<br />
<br /><br />

