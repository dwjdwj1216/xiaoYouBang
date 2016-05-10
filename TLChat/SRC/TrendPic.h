//
//  TrendPic.h
//  TLChat
//
//  Created by 戴王炯 on 4/28/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrendPic : NSObject

@property (nonatomic, strong) NSString *picPath;

+ (TrendPic *) createMenuWithPicPath:(NSString *)picPath;

@end
