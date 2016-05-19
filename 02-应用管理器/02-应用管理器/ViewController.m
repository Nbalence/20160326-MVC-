//
//  ViewController.m
//  02-应用管理器
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "QYButton.h"
#define QYScreenW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()
@property (nonatomic, strong) NSArray *apps;
@end

@implementation ViewController

-(NSArray *)apps{
    if (_apps == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        _apps = [NSArray arrayWithContentsOfFile:path];
    }
    return _apps;
}
- (void)viewDidLoad {
    [super viewDidLoad];
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
        //从xib中加载布局appView
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"QYAppView" owner:self options:nil];
        UIView *appView = views.firstObject;
        [self.view addSubview:appView];
        appView.frame = CGRectMake(appViewX, appViewY, appViewW, appViewH);
        
        NSDictionary *dict = self.apps[i];
        //设置icon的图标
        UIImageView *iconView = [appView viewWithTag:101];
        NSString *imageName = dict[@"icon"];
        iconView.image = [UIImage imageNamed:imageName];
        //设置title的文本
        UILabel *titleLabel = [appView viewWithTag:102];
        titleLabel.text = dict[@"name"];
        //对下载btn添加点击事件
        QYButton *btn = [appView viewWithTag:103];
        
        [btn addTarget:self action:@selector(downLoad:) forControlEvents:UIControlEventTouchUpInside];
        btn.linkString = dict[@"link"];
        
    }
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)downLoad:(QYButton *)sender {
    NSURL *url = [NSURL URLWithString:sender.linkString];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
