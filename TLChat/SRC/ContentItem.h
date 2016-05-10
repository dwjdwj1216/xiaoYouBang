//
//  ContentItem.h
//  TLChat
//
//  Created by 戴王炯 on 4/28/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentItem : NSObject

@property (nonatomic, strong) NSString *iconPath;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *time;

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *content;

+ (ContentItem *) createMenuWithiconPath:(NSString *)iconPath name:(NSString *)name content:(NSString *)content time:(NSString *)time type:(NSString *)type;

@end
