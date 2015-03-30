//
//  ViewController.m
//  CoreFMDB
//
//  Created by muxi on 15/3/27.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "ViewController.h"
#import "CoreFMDB.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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
}

@end
