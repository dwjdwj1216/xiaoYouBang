//
//  TLMineInfoHelper.m
//  TLChat
//
//  Created by 李伯坤 on 16/2/10.
//  Copyright © 2016年 李伯坤. All rights reserved.
//

#import "TLMineInfoHelper.h"

@interface TLMineInfoHelper ()

@property (nonatomic, strong) NSMutableArray *mineInfoData;

@end

@implementation TLMineInfoHelper

- (id) init
{
    if (self = [super init]) {
        _mineInfoData = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSMutableArray *)mineInfoDataByUserInfo:(TLUser *)userInfo
{
    TLSettingItem *avatar = TLCreateSettingItem(@"头像");
    avatar.rightImageURL = userInfo.avatarURL;
    TLSettingItem *nikename = TLCreateSettingItem(@"昵称");
    nikename.subTitle = userInfo.nikeName.length > 0 ? userInfo.nikeName : @"未设置";
    TLSettingItem *sex = TLCreateSettingItem(@"性别");
    sex.subTitle = userInfo.detailInfo.sex;
    TLSettingItem *ID = TLCreateSettingItem(@"ID");
    ID.subTitle = @"timok";
    ID.showDisclosureIndicator = NO;
    TLSettingItem *qrCode = TLCreateSettingItem(@"二维码");
    qrCode.rightImagePath = @"mine_cell_myQR";
    TLSettingGroup *group1 = TLCreateSettingGroup(nil, nil, (@[avatar, nikename, sex,ID, qrCode]));
    
    TLSettingItem *jobState = TLCreateSettingItem(@"职业状态");
    jobState.subTitle = @"阿里巴巴";
    TLSettingItem *city = TLCreateSettingItem(@"地区");
    city.subTitle = userInfo.detailInfo.location;
    TLSettingItem *motto = TLCreateSettingItem(@"个性介绍");
    motto.subTitle = userInfo.detailInfo.motto.length > 0 ? userInfo.detailInfo.motto : @"未填写";
    TLSettingGroup *group2 = TLCreateSettingGroup(nil, nil, (@[jobState, motto, city]));
    
    TLSettingItem *more = TLCreateSettingItem(@"更多");
    TLSettingGroup *group3 = TLCreateSettingGroup(nil, nil, (@[more]));
    [_mineInfoData removeAllObjects];
    [_mineInfoData addObjectsFromArray:@[group1, group2,group3]];
    return _mineInfoData;
}

@end
