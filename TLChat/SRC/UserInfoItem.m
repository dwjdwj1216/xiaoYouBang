//
//  UserInfoItem.m
//  TLChat
//
//  Created by 戴王炯 on 4/24/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "UserInfoItem.h"

@implementation UserInfoItem
+ (UserInfoItem *) createMenuWithIconPath:(NSString *)iconPath name:(NSString *)name fromAndType:(NSString *)fromAndType{
    UserInfoItem *item = [[UserInfoItem alloc]init];
    item.iconPath = iconPath;
    item.name = name;
    item.fromAndType = fromAndType;
    return item;
}

@end
