//
//  TLMomentBaseCell.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLMomentBaseCell.h"

@implementation TLMomentBaseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBottomLineStyle:TLCellLineStyleFill];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

@end
