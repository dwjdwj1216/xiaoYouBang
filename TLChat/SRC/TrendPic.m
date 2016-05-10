//
//  TrendPic.m
//  TLChat
//
//  Created by 戴王炯 on 4/28/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TrendPic.h"

@implementation TrendPic

+ (TrendPic *) createMenuWithPicPath:(NSString *)picPath{
    TrendPic *trendPic = [[TrendPic alloc]init];
    trendPic.picPath = picPath;
    return trendPic;
}

@end
