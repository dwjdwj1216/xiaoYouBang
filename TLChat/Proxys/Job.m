//
//  Job.m
//  TLChat
//
//  Created by 戴王炯 on 4/30/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "Job.h"
#import "NSString+PinYin.h"

@implementation Job
- (void)setName:(NSString *)name
{
    if ([name isEqualToString:_name]) {
        return;
    }
    _name = name;
    if (self.name.length > 0) {
        self.pinyin = name.pinyin;
        self.pinyinInitial = name.pinyinInitial;
    }
}
-(void)setIconPath:(NSString *)iconPath{
    if ([iconPath isEqualToString:_iconPath]) {
        return;
    }
    _iconPath = iconPath;
}

@end
