//
//  CompanyInfo.h
//  TLChat
//
//  Created by 戴王炯 on 4/26/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompanyInfo : NSObject

/**
 *  图标路径
 */
@property (nonatomic, strong) NSString *iconPath;

/**
 *  公司名字
 */
@property (nonatomic, strong) NSString *name;

/**
 *  公司简介
 */
@property (nonatomic, strong) NSString *info;

@property (nonatomic, readwrite) BOOL isAttention;

@property (nonatomic, strong) NSString *score;

+ (CompanyInfo *) createMenuWithIconPath:(NSString *)iconPath name:(NSString *)name info:(NSString *)info isAttention:(BOOL)isAttention score:(NSString *)score;


@end
