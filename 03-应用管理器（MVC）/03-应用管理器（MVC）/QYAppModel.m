//
//  QYAppModel.m
//  03-应用管理器（MVC）
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYAppModel.h"

@implementation QYAppModel

//在类方法中self指的是当前类，在实例方法中self指的是dangqian类的对象
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
#if 0
        _icon = dict[@"icon"];
        _name = dict[@"name"];
        _link = dict[@"link"];
#else
        [self setValuesForKeysWithDictionary:dict];
#endif
        
    }
    return self;
}

+(instancetype)appModelWithDictionary:(NSDictionary *)dict{
    return [[self alloc] initWithDictionary:dict];
}

@end
