//
//  CompanyNewHelper.m
//  TLChat
//
//  Created by 戴王炯 on 4/27/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CompanyNewHelper.h"
#import "CompanyNew.h"

@implementation CompanyNewHelper

- (id) init
{
    if (self = [super init]) {
        self.companyNewData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}


- (void) p_initTestData
{
    CompanyNew *new1= [CompanyNew createMenuWithIconPath:@"dongtai_img0" title:@"阿里健康挫逾4%，阿里巴巴入主被裁定违反收购守则" time:@"4月26日"];
    CompanyNew *new2 = [CompanyNew createMenuWithIconPath:@"汽车" title:@"阿里如何用『大数据』解决购车难题" time:@"4月26日"];
    CompanyNew *new3 = [CompanyNew createMenuWithIconPath:@"招聘" title:@"阿里巴巴集团2016实习生招聘笔试公告" time:@"3月25日"];
    CompanyNew *new4 = [CompanyNew createMenuWithIconPath:@"招聘2" title:@"阿里集团2016实习生招聘FAQ" time:@"3月1日"];
    CompanyNew *new5 = [CompanyNew createMenuWithIconPath:@"迪士尼" title:@"传阿里与迪士尼合作被叫停 或因机顶盒『迪士尼视界』" time:@"4月26日"];
    
    [self.companyNewData addObjectsFromArray:@[@[new1,new2,new5,new3,new4]]];
    
    
}

@end
