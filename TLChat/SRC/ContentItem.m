//
//  ContentItem.m
//  TLChat
//
//  Created by 戴王炯 on 4/28/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "ContentItem.h"

@implementation ContentItem

+ (ContentItem *) createMenuWithiconPath:(NSString *)iconPath name:(NSString *)name content:(NSString *)content time:(NSString *)time type:(NSString *)type{
    ContentItem *item  = [[ContentItem alloc]init];
    item.iconPath = iconPath;
    item.name = name;
    item.content = content;
    item.time = time;
    item.type = type;
    return item;
}

@end
