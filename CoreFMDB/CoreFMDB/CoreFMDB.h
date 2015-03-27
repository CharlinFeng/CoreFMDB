//
//  CoreFMDB.h
//  CoreFMDB
//
//  Created by muxi on 15/3/27.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreFMDBSingleton.h"
#import "FMResultSet.h"

@interface CoreFMDB : NSObject
HMSingletonH(CoreFMDB)


/**
 *  执行一个更新语句
 *
 *  @param sql              更新语句的sql
 *  @param updateResBlock   更新语句的执行结果
 */
+(void)executeUpdate:(NSString *)sql updateResBlock:(void(^)(BOOL updateRes))updateResBlock;




/**
 *  执行一个查询语句
 *
 *  @param sql              查询语句sql
 *  @param queryResBlock    查询语句的执行结果
 */
+(void)executeQuery:(NSString *)sql queryResBlock:(void(^)(FMResultSet *set))queryResBlock;




/**
 *  查询出指定表的列
 *
 *  @param table           指定表
 *  @param columnsResBlock 查询出指定表的列的执行结果
 */
+(void)executeQueryForColumns:(NSString *)table columnsResBlock:(void(^)(NSArray *columns))columnsResBlock;


@end
