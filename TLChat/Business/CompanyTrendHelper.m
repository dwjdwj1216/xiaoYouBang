//
//  CompanyTrendHelper.m
//  TLChat
//
//  Created by 戴王炯 on 4/28/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CompanyTrendHelper.h"
#import "TrendPic.h"
@implementation CompanyTrendHelper
- (id) init
{
    if (self = [super init]) {
        self.companyTrendData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    TrendPic *pic1 = [TrendPic createMenuWithPicPath:@"zonghequshi"];
    TrendPic *pic2 = [TrendPic createMenuWithPicPath:@"shixiqushi"];
    TrendPic *pic3 = [TrendPic createMenuWithPicPath:@"shixiqushi"];
    [self.companyTrendData addObjectsFromArray:@[@[pic1],@[pic2],@[pic3]]];
    
    
}

@end
