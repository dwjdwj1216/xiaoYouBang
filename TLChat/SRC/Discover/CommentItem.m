//
//  CommentItem.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CommentItem.h"

@implementation CommentItem
+ (CommentItem *) createMenuWithIconPath:(NSString *)iconPath name:(NSString *)name content:(NSString *)content time:(NSString *)time{
    CommentItem *item = [[CommentItem alloc]init];
    item.iconPath = iconPath;
    item.name = name;
    item.content = content;
    item.time = time;
    return item;
}
@end
