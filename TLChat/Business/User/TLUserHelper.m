//
//  TLUserHelper.m
//  TLChat
//
//  Created by 李伯坤 on 16/2/6.
//  Copyright © 2016年 李伯坤. All rights reserved.
//

#import "TLUserHelper.h"

static TLUserHelper *helper;

@implementation TLUserHelper

+ (TLUserHelper *) sharedHelper
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        helper = [[TLUserHelper alloc] init];
    });
    return helper;
}

- (NSString *)userID
{
    return self.user.userID;
}

- (id) init
{
    if (self = [super init]) {
        self.user = [[TLUser alloc] init];
        self.user.userID = @"1000";
        self.user.avatarPath = @"tim_avatar.png";
        self.user.nikeName = @"Tim";
        self.user.username = @"Tim";
        self.user.whenJoin = @"2016-03-03";
        self.user.attentions = 8;
        self.user.collections = 2;
        self.user.detailInfo.qqNumber = @"xxxxxx";
        self.user.detailInfo.email = @"xxxxx@xxx.com";
        self.user.detailInfo.location = @"浙江 杭州";
        self.user.detailInfo.sex = @"男";
        self.user.detailInfo.motto = @"Hello world!";
        self.user.detailInfo.momentsWallURL = @"http://www.jszhongzhu.com/img/aHR0cDovL2ltZy5wY29ubGluZS5jb20uY24vaW1hZ2VzL3VwbG9hZC91cGMvdHgvd2FsbHBhcGVyLzEzMDEvMDgvYzEvMTcyMjg4OThfMTM1NzYyNzQ2MDEwNl84MDB4NjAwLmpwZw==.jpg";
    }
    return self;
}

@end
