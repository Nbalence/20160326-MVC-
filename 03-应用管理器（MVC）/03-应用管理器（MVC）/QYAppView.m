//
//  QYAppView.m
//  03-应用管理器（MVC）
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYAppView.h"
#import "QYAppModel.h"

@interface QYAppView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation QYAppView

+(instancetype)appView{
    NSArray *views = [[NSBundle mainBundle]loadNibNamed:@"QYAppView" owner:self options:nil];
    return views.firstObject;
}

-(void)setPropertyForSubViews:(QYAppModel *)model{
    //setter方法本身完成的事情
    _propertyForSubViews = model;
    //巧借setter方法对子视图进行属性设置
    _iconView.image = [UIImage imageNamed:model.icon];
    _titleLabel.text = model.name;
    NSLog(@"%@",self.propertyForSubViews);
}
- (IBAction)downLoad:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:self.propertyForSubViews.link];
    [[UIApplication sharedApplication] openURL:url];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
