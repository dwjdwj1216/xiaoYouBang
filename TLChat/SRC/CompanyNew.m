//
//  CompanyNew.m
//  TLChat
//
//  Created by 戴王炯 on 4/27/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "CompanyNew.h"

@implementation CompanyNew

+ (CompanyNew *) createMenuWithIconPath:(NSString *)iconPath title:(NSString *)title time:(NSString *)time
{
    CompanyNew *new = [[CompanyNew alloc] init];
    new.iconPath = iconPath;
    new.title = title;
    new.time = time;
    return new;
}

@end
