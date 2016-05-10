//
//  ShareExperienceItem.h
//  TLChat
//
//  Created by 戴王炯 on 4/29/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareExperienceItem : NSObject

@property (nonatomic, strong) NSString *companyIcon;

@property (nonatomic, strong) NSString *iconPath;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *info;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *subtitle;

@property (nonatomic, strong) NSString *time;

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *readNumber;
+ (ShareExperienceItem *) createMenuWithCompanyIcon:(NSString *)companyIcon iconPath:(NSString *)iconPath name:(NSString *)name info:(NSString *)info title:(NSString *)title subtitle:(NSString *)subtitle time:(NSString *)time type:(NSString *)type readNumber:(NSString *)readNumber;

@end
