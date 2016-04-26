//
//  UserInfoItem.h
//  TLChat
//
//  Created by 戴王炯 on 4/24/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoItem : NSObject
/**
 *  左侧图标路径
 */
@property (nonatomic, strong) NSString *iconPath;

/**
 *  标题
 */
@property (nonatomic, strong) NSString *name;

/**
 *  副标题
 */
@property (nonatomic, strong) NSString *fromAndType;


+ (UserInfoItem *) createMenuWithIconPath:(NSString *)iconPath name:(NSString *)name fromAndType:(NSString *)fromAndType;

@end
