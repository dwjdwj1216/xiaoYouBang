//
//  CommentHelper.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CommentHelper.h"
#import "CommentItem.h"
@implementation CommentHelper
- (id) init
{
    if (self = [super init]) {
        self.listDate = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

-(void)p_initTestData{
    CommentItem *item0 = [CommentItem createMenuWithIconPath:nil name:nil content:nil time:nil];

    CommentItem *item1 = [CommentItem createMenuWithIconPath:@"avatar1" name:@"Gregory Arnold" content:@"说得对，架构是一门实践出真知的学科，实战经验是必不可少的" time:@"4:21"];
    CommentItem *item2 = [CommentItem createMenuWithIconPath:@"avatar2" name:@"Shirley Freeman" content:@"说得对，架构是一门实践出真知的学科，实战经验是必不可少的" time:@"4:21"];
    CommentItem *item3 = [CommentItem createMenuWithIconPath:@"avatar3" name:@"Charles Bowman" content:@"说得对，架构是一门实践出真知的学科，实战经验是必不可少的" time:@"4:21"];
    CommentItem *item4 = [CommentItem createMenuWithIconPath:@"avatar4" name:@"Doris Thompson" content:@"说得对，架构是一门实践出真知的学科，实战经验是必不可少的" time:@"4:21"];
    [self.listDate addObjectsFromArray:@[@[item0,item1,item2,item3,item4]]];
}
@end
