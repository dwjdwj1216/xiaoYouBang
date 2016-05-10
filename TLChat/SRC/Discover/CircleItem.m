//
//  CircleItem.m
//  TLChat
//
//  Created by 戴王炯 on 4/30/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CircleItem.h"

@implementation CircleItem
+ (CircleItem *) createMenuWithIconPath:(NSString *)iconPath name:(NSString *)name title:(NSString *)title subTitle:(NSString *)subTitle time:(NSString *)time comNum:(NSString *)comNum{
    CircleItem *item = [[CircleItem alloc]init];
    item.iconPath = iconPath;
    item.name =name;
    item.title = title;
    item.subTitle = subTitle;
    item.time = time;
    item.comNum = comNum;
    return item;
}
@end
