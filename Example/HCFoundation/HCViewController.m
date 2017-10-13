//
//  HCViewController.m
//  HCFoundation
//
//  Created by haisens@163.com on 10/12/2017.
//  Copyright (c) 2017 haisens@163.com. All rights reserved.
//

#import "HCViewController.h"
#import "HCFoundation.h"
#import "HCView.h"


@interface HCViewController ()

@end

@implementation HCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    HCView *view = [[HCView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
