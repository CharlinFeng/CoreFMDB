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
    [CoreFMDB executeUpdate:@"create table if not exists user(id integer primary key autoIncrement,name text not null default '',age integer not null default 0);" updateResBlock:^(BOOL updateRes) {
        if(updateRes){
            NSLog(@"执行成功");
        }else{
            NSLog(@"执行失败");
        }
        NSLog(@"%@",[NSThread currentThread]);
    }];
    
    
    //添加数据
    [CoreFMDB executeUpdate:@"insert into user (name,age) values('jack',27);" updateResBlock:^(BOOL updateRes) {
        if(updateRes){
            NSLog(@"添加数据成功");
        }else{
            NSLog(@"添加数据失败");
        }
        NSLog(@"%@",[NSThread currentThread]);
    }];
    
    //查询数据
    [CoreFMDB executeQuery:@"select * from user;" queryResBlock:^(FMResultSet *set) {
        
        while ([set next]) {
            NSLog(@"%@-%@",[set stringForColumn:@"name"],[set stringForColumn:@"age"]);
        }
        
    }];
    
    //查询user表有哪些字段
    [CoreFMDB executeQueryForColumns:@"user" columnsResBlock:^(NSArray *columns) {
        NSLog(@"字段信息：%@",columns);
        NSLog(@"%@",[NSThread currentThread]);
    }];
    
}

@end
