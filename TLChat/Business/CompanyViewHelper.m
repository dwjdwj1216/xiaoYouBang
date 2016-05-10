//
//  CompanyViewHelper.m
//  TLChat
//
//  Created by 戴王炯 on 4/26/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CompanyViewHelper.h"
#import "CompanyInfo.h"
#import "TLMenuItem.h"
@implementation CompanyViewHelper
- (id) init
{
    if (self = [super init]) {
        self.companyData = [[NSMutableArray alloc] init];
        self.funData = [[NSMutableArray alloc]init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    NSString *info = @"阿里巴巴集团是以马云为首的18人创立的，利用互联网浪潮让小企业通过穿心与科技扩展业务，并在参与国内或全球市场竞争时处于更有利的位置。";
    CompanyInfo *item1 = [CompanyInfo createMenuWithIconPath:@"qiye_avatar" name:@"阿里巴巴" info:info isAttention:NO score:@"8.6"];
    [self.companyData addObjectsFromArray:@[item1]];
    TLMenuItem *item7 = TLCreateMenuItem(nil, nil);
    TLMenuItem *item2 = TLCreateMenuItem(@"qiye_icon",@"企业动态");
    TLMenuItem *item3 = TLCreateMenuItem(@"qiye_trending",@"企业趋势");
    TLMenuItem *item4 = TLCreateMenuItem(@"zhiwei_icon",@"企业职位");
    TLMenuItem *item5 = TLCreateMenuItem(@"qiye_comment",@"评分评价");
    TLMenuItem *item6 = TLCreateMenuItem(@"qiye_expshare",@"经验分享");
    
    [self.funData addObjectsFromArray:@[@[item7],@[item2],@[item3],@[item4],@[item5],@[item6]]];


}


@end
