//
//  ShareExperienceHelper.m
//  TLChat
//
//  Created by 戴王炯 on 4/29/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "ShareExperienceHelper.h"
#import "ShareExperienceItem.h"
@implementation ShareExperienceHelper
- (id) init
{
    if (self = [super init]) {
        self.ShareExperienceListData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    ShareExperienceItem *item1 = [ShareExperienceItem createMenuWithCompanyIcon:@"article" iconPath:@"user1" name:@"insomnium" info:@"分享了他的求职经历：我的阿里求职路" title:@"我的阿里求职路" subtitle:@"阿里杭州校招27号落下了帷幕，回想这六天的点点滴滴，感慨颇多，我并不是在这里炫耀拿到了阿里的offer，有多少开心，多少骄傲，只是感觉，真的是事在人为。阿里杭州校招27号落下了帷幕，回想这六天的点点滴滴，感慨颇多，我并不是在这里炫耀拿到了阿里的offer，有多少开心，多少骄傲，只是感觉，真的是事在人为。阿里杭州校招27号落下了帷幕，回想这六天的点点滴滴，感慨颇多，我并不是在这里炫耀拿到了阿里的offer，有多少开心，多少骄傲，只是感觉，真的是事在人为。阿里杭州校招27号落下了帷幕，回想这六天的点点滴滴，感慨颇多，我并不是在这里炫耀拿到了阿里的offer，有多少开心，多少骄傲，只是感觉，真的是事在人为。阿里杭州校招27号落下了帷幕，回想这六天的点点滴滴，感慨颇多，我并不是在这里炫耀拿到了阿里的offer，有多少开心，多少骄傲，只是感觉，真的是事在人为。阿里杭州校招27号落下了帷幕，回想这六天的点点滴滴，感慨颇多，我并不是在这里炫耀拿到了阿里的offer，有多少开心，多少骄傲，只是感觉，真的是事在人为。阿里杭州校招27号落下了帷幕，回想这六天的点点滴滴，感慨颇多，我并不是在这里炫耀拿到了阿里的offer，有多少开心，多少骄傲，只是感觉，真的是事在人为。阿里杭州校招27号落下了帷幕，回想这六天的点点滴滴，感慨颇多，我并不是在这里炫耀拿到了阿里的offer，有多少开心，多少骄傲，只是感觉，真的是事在人为。阿里杭州校招27号落下了帷幕，回想这六天的点点滴滴，感慨颇多，我并不是在这里炫耀拿到了阿里的offer，有多少开心，多少骄傲，只是感觉，真的是事在人为。" time:@"2016-4-22" type:@"求职经历" readNumber:@"235"];
    [self.ShareExperienceListData addObjectsFromArray:@[@[item1]]];
    
}
@end
