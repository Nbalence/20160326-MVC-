//
//  ViewController.m
//  03-应用管理器（MVC）
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "QYAppModel.h"
#import "QYAppView.h"
#define QYScreenW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()
@property (nonatomic, strong) NSArray *apps;
@end

@implementation ViewController

-(NSArray *)apps{
    if (_apps == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        //把array中的dictionary转化成模型
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYAppModel *appModel = [QYAppModel appModelWithDictionary:dict];
            [models addObject:appModel];
        }
        _apps = models;
    }
    return _apps;
}
- (void)viewDidLoad {
    [super viewDidLoad];
 
#pragma mark - 九宫格布局
    int totalColumn = 4;
    //宽高
    CGFloat appViewW = 80;
    CGFloat appViewH = 90;
    //计算相邻 appView的间距
    CGFloat appViewSpaceX = (QYScreenW - appViewW * totalColumn) / (totalColumn + 1);
    CGFloat appViewSpaceY = 30;
    for (int i = 0; i < self.apps.count; i++) {
        //列数
        int column = i % totalColumn;
        //行数
        int row = i / totalColumn;
        //计算当前的appView的位置
        CGFloat appViewX = appViewW * column + appViewSpaceX * (column + 1);
        CGFloat appViewY = appViewH * row + appViewSpaceY * (row + 1);
        QYAppView *appView = [QYAppView appView];
        [self.view addSubview:appView];
        appView.frame = CGRectMake(appViewX, appViewY, appViewW, appViewH);
        
        QYAppModel *model = self.apps[i];
        appView.propertyForSubViews = model;
        
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
