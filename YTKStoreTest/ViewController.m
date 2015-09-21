//
//  ViewController.m
//  YTKStoreTest
//
//  Created by yurongde on 15/9/21.
//  Copyright © 2015年 yurongde. All rights reserved.
//

#import "ViewController.h"
#import "SDItem.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labe;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    id obj = [DBStore getObjectById:@"ssdd" fromTable:User_Table_Name];
    NSLog(@"%@",obj);

    NSString *key = @"ssdd";
    NSDictionary *user = @{@"id":@2,@"name":@"boby",@"age":@23};
    dispatch_queue_t queue = dispatch_queue_create("queueafter", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        [DBStore putObject:user withId:key intoTable:User_Table_Name];
    });
    id newObj = [DBStore getObjectById:@"ssdd" fromTable:User_Table_Name];

    NSLog(@"%@",newObj);
    
    NSLog(@"%@",[DBStore getAllItemsFromTable:User_Table_Name]);
    
    NSMutableArray *arr = [NSMutableArray array];
//    for (int i = 0; i<10; i++) {
//        SDItem *item = [[SDItem alloc]init];
//        item.name = [NSString stringWithFormat:@"%d_sd",i];
//        item.company = [NSString stringWithFormat:@"%d_work",i];
//        [arr addObject:item];
//    }
    for (int i = 0 ; i<10; i++) {
        [arr addObject:@(i)];
    }
    [DBStore putObject:arr withId:@"SDArray" intoTable:User_Table_Name];
    [DBStore clearTable:User_Table_Name];
//    [DBStore deleteObjectsByIdArray:@[@"SDArray",@"ssdd"] fromTable:User_Table_Name];
    NSArray *localArr = [DBStore getObjectById:@"SDArray" fromTable:User_Table_Name];
    
    NSLog(@"%@",localArr);
    NSLog(@"%@",[DBStore getAllItemsFromTable:User_Table_Name]);

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
