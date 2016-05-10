//
//  CompanyNew.h
//  TLChat
//
//  Created by 戴王炯 on 4/27/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompanyNew : NSObject

@property (nonatomic, strong) NSString *iconPath;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *time;

+ (CompanyNew *) createMenuWithIconPath:(NSString *)iconPath title:(NSString *)title time:(NSString *)time;

@end
