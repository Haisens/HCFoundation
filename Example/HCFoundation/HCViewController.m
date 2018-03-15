//
//  HCViewController.m
//  HCFoundation
//
//  Created by haisens@163.com on 10/12/2017.
//  Copyright (c) 2017 haisens@163.com. All rights reserved.
//

#import "HCViewController.h"
#import "HCFoundation.h"


@interface HCViewController ()

@end

@implementation HCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *SERVICE_NAME = @"com.vrseen.uuid";//最好用程序的bundle id
    NSString * str =  [UIDevice getPasswordForUsername:@"UUID" andServiceName:SERVICE_NAME error:nil];  // 从keychain获取数据
    if ([str length]<=0)
    {
        str  = [[[UIDevice currentDevice] identifierForVendor] UUIDString];  // 保存UUID作为手机唯一标识符
        [UIDevice storeUsername:@"UUID"
                           andPassword:str
                        forServiceName:SERVICE_NAME
                        updateExisting:1
                                 error:nil];  // 往keychain添加数据
    }
    NSLog(@"%@", str);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
