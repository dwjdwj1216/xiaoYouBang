//
//  ShareExperienceItem.m
//  TLChat
//
//  Created by 戴王炯 on 4/29/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "ShareExperienceItem.h"

@implementation ShareExperienceItem
+ (ShareExperienceItem *) createMenuWithCompanyIcon:(NSString *)companyIcon iconPath:(NSString *)iconPath name:(NSString *)name info:(NSString *)info title:(NSString *)title subtitle:(NSString *)subtitle time:(NSString *)time type:(NSString *)type readNumber:(NSString *)readNumber{
    ShareExperienceItem *item =[[ShareExperienceItem alloc]init];
    item.companyIcon = companyIcon;
    item.iconPath = iconPath;
    item.name = name;
    item.info = info;
    item.title = title;
    item.subtitle = subtitle;
    item.time = time;
    item.type = type;
    item.readNumber = readNumber;
    return item;
}
@end
