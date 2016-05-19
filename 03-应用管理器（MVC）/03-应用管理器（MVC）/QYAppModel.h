//
//  QYAppModel.h
//  03-应用管理器（MVC）
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYAppModel : NSObject
//声明属性的时候需要注意的事项（1、属性的名称跟字典里面的键名一致、2属性的个数>=字典里面的键值对）
@property (nonatomic, strong) NSString *icon;//图标
@property (nonatomic, strong) NSString *name;//标题
@property (nonatomic, strong) NSString *link;//下载地址

-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)appModelWithDictionary:(NSDictionary *)dict;
@end
