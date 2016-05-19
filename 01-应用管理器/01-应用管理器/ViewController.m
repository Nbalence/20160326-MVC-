//
//  ViewController.m
//  01-应用管理器
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

//懒加载apps
-(NSArray *)apps{
    if (_apps == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        _apps = [NSArray arrayWithContentsOfFile:path];
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //总列数
    int totalColumn = 4;
    
    //appView的宽，高
    CGFloat appViewW = 80;
    CGFloat appViewH = 90;
    //计算出每两个appView间距
    CGFloat appViewSpaceX = (QYScreenW - appViewW * totalColumn) / (totalColumn + 1);
    CGFloat appViewSpaceY = 30;
    
    for (int i = 0; i < self.apps.count; i++) {
        //获取当前appview的列和行
        int appViewColumn = i % totalColumn;
        int appViewRow = i / totalColumn;
        
        //计算appView的X、Y
        CGFloat appViewX = appViewW * appViewColumn + appViewSpaceX * (appViewColumn + 1);
        CGFloat appViewY = appViewH * appViewRow + appViewSpaceY * (appViewRow + 1);
        
        UIView *appView = [[UIView alloc] initWithFrame:CGRectMake(appViewX, appViewY, appViewW, appViewH)];
        [self.view addSubview:appView];
        //appView.backgroundColor = [UIColor redColor];
        
        //添加appView的子视图
        
        //添加应用程序的图标icon
        CGFloat iconW = 40;
        CGFloat iconH = 40;
        CGFloat iconX = (appViewW - iconW) / 2.0;
        CGFloat iconY = 0;
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(iconX, iconY, iconW, iconH)];
        [appView addSubview:icon];
        
        NSDictionary *dict = self.apps[i];
        NSString *imageName = dict[@"icon"];
        icon.image = [UIImage imageNamed:imageName];
        //添加应用程序的标题 title
        CGFloat titleW = appViewW;
        CGFloat titleH = 20;
        CGFloat titleX = 0;
        CGFloat titleY = iconY + iconH;
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleX, titleY, titleW, titleH)];
        [appView addSubview:titleLabel];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = dict[@"name"];
        titleLabel.font = [UIFont systemFontOfSize:12.0];
        
        //添加下载应用程序的按钮 downLoadBtn
        CGFloat btnW = 60;
        CGFloat btnH = 20;
        CGFloat btnX = (appViewW - btnW) / 2.0;
        CGFloat btnY = titleY + titleH;
        
        QYButton *downLoadBtn = [QYButton buttonWithType:UIButtonTypeCustom];
        [appView addSubview:downLoadBtn];
        downLoadBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        [downLoadBtn setTitle:@"下载" forState:UIControlStateNormal];
        [downLoadBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [downLoadBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        downLoadBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        
        [downLoadBtn addTarget:self action:@selector(downLoad:) forControlEvents:UIControlEventTouchUpInside];
#if 0
        //downLoadBtn.tag = 100 + i;
#else
        downLoadBtn.linkString = dict[@"link"];
#endif
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)downLoad:(QYButton *)sender {
#if 0
    NSDictionary *dict = self.apps[sender.tag - 100];
    NSString *link = dict[@"link"];
    NSURL *url = [NSURL URLWithString:link];
#else
    NSURL *url = [NSURL URLWithString:sender.linkString];
#endif
    [[UIApplication sharedApplication ] openURL:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
