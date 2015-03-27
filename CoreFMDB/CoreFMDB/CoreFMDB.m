//
//  CoreFMDB.m
//  CoreFMDB
//
//  Created by muxi on 15/3/27.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "CoreFMDB.h"
#import "FMDB.h"
#import "NSString+CoreFMDB.h"

@interface CoreFMDB ()


/**
 *  具有线程安全的数据队列
 */
@property (nonatomic,strong) FMDatabaseQueue *queue;



@end





@implementation CoreFMDB
HMSingletonM(CoreFMDB)


/**
 *  数据库队列的初始化：本操作一个
 */
+(void)initialize{
    
    //取出实例
    CoreFMDB *coreFMDB=[CoreFMDB sharedCoreFMDB];
    
    //获取项目info文件
    NSDictionary *infoDict=[[NSBundle mainBundle] infoDictionary];
    
    //获取项目Bundle Name:英文(CFBundleName)
    NSString *key=(NSString *)kCFBundleNameKey;
    NSString *bundleName=infoDict[key];
    //拼接数据库名
    NSString *dbName=[NSString stringWithFormat:@"%@%@",bundleName,@".sql"];
    
    //在沙盒中存入数据库文件
    NSString *dbPath=[bundleName.documentsSubFolder stringByAppendingPathComponent:dbName];
    
    const BOOL needLogSqlFilePath=YES;
    
    if(needLogSqlFilePath) NSLog(@"dbPath:%@",dbPath);
    
    //创建队列
    FMDatabaseQueue *queue =[FMDatabaseQueue databaseQueueWithPath:dbPath];
    
    if(queue==nil)NSLog(@"code=1：创建数据库失败，请检查");
    
    coreFMDB.queue = queue;
}




/**
 *  执行一个更新语句
 *
 *  @param sql 更新语句的sql
 *  @param res 更新语句的执行结果
 */
+(void)executeUpdate:(NSString *)sql updateResBlock:(void(^)(BOOL updateRes))updateResBlock{
    
    //子线程处理
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CoreFMDB *coreFMDB=[CoreFMDB sharedCoreFMDB];

        [coreFMDB.queue inDatabase:^(FMDatabase *db) {
           
            BOOL updateRes = [db executeUpdate:sql];
        
            if(updateResBlock!=nil) updateResBlock(updateRes);
        }];
    });
}







/**
 *  执行一个查询语句
 *
 *  @param sql              查询语句sql
 *  @param queryResBlock    查询语句的执行结果
 */
+(void)executeQuery:(NSString *)sql queryResBlock:(void(^)(FMResultSet *set))queryResBlock{
    
    //子线程处理
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CoreFMDB *coreFMDB=[CoreFMDB sharedCoreFMDB];
        
        [coreFMDB.queue inDatabase:^(FMDatabase *db) {
            
            FMResultSet *set = [db executeQuery:sql];
            
            if(queryResBlock != nil) queryResBlock(set);
        }];
    });
 
}





/**
 *  查询出指定表的列
 *
 *  @param table           指定表
 *  @param columnsResBlock 查询出指定表的列的执行结果
 */
+(void)executeQueryForColumns:(NSString *)table columnsResBlock:(void(^)(NSArray *columns))columnsResBlock{
    
    NSString *sql=[NSString stringWithFormat:@"PRAGMA table_info (%@);",table];
    
    [self executeQuery:sql queryResBlock:^(FMResultSet *set) {
        
        NSMutableArray *columnsM=[NSMutableArray array];
        
        //循环取出数据
        while ([set next]) {
            NSString *column = [set stringForColumn:@"name"];
            [columnsM addObject:column];
        }
        
        if(columnsM.count==0) NSLog(@"code=2：您指定的表：%@,没有字段信息，可能是表尚未创建！",table);
        
        if(columnsResBlock != nil) columnsResBlock([columnsM copy]);
    }];
}



@end
