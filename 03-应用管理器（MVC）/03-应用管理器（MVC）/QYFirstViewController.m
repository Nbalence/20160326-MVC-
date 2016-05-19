//
//  QYFirstViewController.m
//  03-应用管理器（MVC）
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYFirstViewController.h"
#import "QYAppView.h"
@interface QYFirstViewController ()

@end

@implementation QYFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    QYAppView *appView = [QYAppView appView];
    [self.view addSubview:appView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
