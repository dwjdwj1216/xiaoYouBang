//
//  CompanyInfo.m
//  TLChat
//
//  Created by 戴王炯 on 4/26/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CompanyInfo.h"

@implementation CompanyInfo

+ (CompanyInfo *) createMenuWithIconPath:(NSString *)iconPath name:(NSString *)name info:(NSString *)info isAttention:(BOOL)isAttention score:(NSString *)score{
    CompanyInfo *compangInfo = [[CompanyInfo alloc]init];
    compangInfo.iconPath = iconPath;
    compangInfo.name = name;
    compangInfo.info = info;
    compangInfo.isAttention = isAttention;
    compangInfo.score = score;
    return compangInfo;
}
@end
