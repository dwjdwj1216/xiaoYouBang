//
//  ShareExperienceCell.h
//  TLChat
//
//  Created by 戴王炯 on 4/29/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareExperienceItem.h"
#import "UIViewLinkmanTouch.h"

@interface ShareExperienceCell : UITableViewCell

@property (nonatomic, strong) ShareExperienceItem *item;

@property (nonatomic, strong) UIViewLinkmanTouch *rightView;

@property (nonatomic, readwrite) NSInteger *section;

@property (nonatomic, readwrite) NSInteger *row;

@end
