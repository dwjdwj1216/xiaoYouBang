//
//  CommentItem.h
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentItem : NSObject
@property (nonatomic, strong) NSString *iconPath;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *content;


@property (nonatomic, strong) NSString *time;

+ (CommentItem *) createMenuWithIconPath:(NSString *)iconPath name:(NSString *)name content:(NSString *)content time:(NSString *)time;
@end
