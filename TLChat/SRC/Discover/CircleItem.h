//
//  CircleItem.h
//  TLChat
//
//  Created by 戴王炯 on 4/30/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CircleItem : NSObject

@property (nonatomic, strong) NSString *iconPath;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *subTitle;

@property (nonatomic, strong) NSString *time;

@property (nonatomic, strong) NSString *comNum;
+ (CircleItem *) createMenuWithIconPath:(NSString *)iconPath name:(NSString *)name title:(NSString *)title subTitle:(NSString *)subTitle time:(NSString *)time comNum:(NSString *)comNum;

@end
