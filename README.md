![image](https://github.com/nsdictionary/Resource/blob/master/CoreFMDB/logo.jpg)<br />

####  OC收山之作： CoreModel Series
##CoreFMDB
<br/>
.Xcode 5.0, iOS 6.0
.OC,Swift
.Under the MIT License


<br /><br /><br />

SERIES
===============


        Doesn’t know how to write sql? No worries. Now the second part offers you one key 
        automatically create table, one key CURD, automatically check model and 
        dynamically add field, model cascade CURD. All these things are automatic without          
        one sql code.
        
        
        
        Due to my time constraints and ease of use these frames,
        the release cycle will be long.
        
        
        
        EN：The second part  automatically CURD release date: 21/06/2015, so stay tuned or 
        join our qq group(163865401) to get the latest news, thanks a lot.
        
<br/><br/>
EN：I am Charlin Feng, a developer from Chengdu, China. The true spirit of open source is 
an attitude and sharing even a challenge to the traditional way. There is no flaunt, 
pretentious or money but all my spirits which need your support.
<br/><br/><br />

The core purpose of these series frames is replace to Core Data and implement one key Dynamic Cache. 
This is the first frame with other three followed.  You are gonna ask me why make these frame so separately.
Even some of my friends blame me at the “chaos” of my projects’ structure. Actually, 
it’s due to I got a magnificent frame in all my frameworks with a core purpose which is decoupling.
Because I believe that I will try my best to separate it if it’s a function module. 
I feel I benefit from the core idea of decoupling. I hope you guys could understand. Thank you very much.

<br /><br/>








DEPENDENCE
===============
.FMDB<br />



USAGE
===============
This frame is based on FMDB and it’s static package,  all classes method call, thread-safe at the same time. 
You don’t need to create datebase object, instance or record. It’s a green, simple and good frame.
<br/><br/><br />

#### 1. Introduced header
      #import "CoreFMDB.h"
<br/>


#### 2. the method of the update statement
        /**
         *  执行一个更新语句
         *
         *  @param sql 更新语句的sql
         *
         *  @return 更新语句的执行结果
         */
        +(BOOL)executeUpdate:(NSString *)sql;
<br/>


#### 3. the method of search statement
        /**
         *  执行一个查询语句
         *
         *  @param sql              查询语句sql
         *  @param queryResBlock    查询语句的执行结果
         */
        +(void)executeQuery:(NSString *)sql queryResBlock:(void(^)(FMResultSet *set))queryResBlock;
<br/>


#### 5. Truncate your table

    /**
    *  清空表（但不清除表结构）
    *
    *  @param table 表名
    *
    *  @return 操作结果
    */
    +(BOOL)truncateTable:(NSString *)table;

<br/>



#### 5. get the recored count of table
        /**
         *  表记录数计算
         *
         *  @param table 表
         *
         *  @return 记录数
         */
        +(NSUInteger)countTable:(NSString *)table;
<br/>

#### 6. get all the rows of the table
        /**
         *  查询出指定表的列
         *
         *  @param table table
         *
         *  @return 查询出指定表的列的执行结果
         */
        +(NSArray *)executeQueryColumnsInTable:(NSString *)table;

<br/>
<br/>

EXAMPLE
===============

        BOOL res =  [CoreFMDB executeUpdate:@"create table if not exists user(id integer primary key autoIncrement,name text not null default '',age integer not null default 0);"];
        
        if(res){
            NSLog(@"创表执行成功 create table succeed");
        }else{
            NSLog(@"创表执行失败 create table fails");
        }
    
        

        BOOL res2= [CoreFMDB executeUpdate:@"insert into user (name,age) values('jack',27);"];
    
        if(res2){
            NSLog(@"添加数据成功 add data succeed");
        }else{
            NSLog(@"添加数据失败 add data fails");
        }
    
        

        NSArray *columns = [CoreFMDB executeQueryColumnsInTable:@"user"];
        
        NSLog(@"列信息：%@",columns);
    

        [CoreFMDB executeQuery:@"select * from user;" queryResBlock:^(FMResultSet *set) {
            
            while ([set next]) {
                NSLog(@"%@-%@",[set stringForColumn:@"name"],[set stringForColumn:@"age"]);
            }
            
        }];
        
        
        
        NSUInteger count = [CoreFMDB countTable:@"user"];
        
        NSLog(@"当前有%@条记录",@(count));

<br/><br/><br/>
Career
===============
#### Charlin's Career

WebSite：http://ios-android.cn <br/>
Sina WeiBo：http://weibo.com/charlin2015/<br/>
<br/><br/>

#### CoreModel Series

One：CoreFMDB
[https://github.com/nsdictionary/CoreFMDB](https://github.com/nsdictionary/CoreFMDB)

Two：CoreArchive
[https://github.com/nsdictionary/CoreArchive](https://github.com/nsdictionary/CoreArchive)

Three：CoreClass
[https://github.com/nsdictionary/CoreClass](https://github.com/nsdictionary/CoreClass)
<br /><br />

