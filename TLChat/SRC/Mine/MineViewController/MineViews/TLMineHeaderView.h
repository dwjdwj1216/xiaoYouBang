//
//  TLMineHeaderView.h
//  TLChat
//
//  Created by 戴王炯 on 4/22/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLUser.h"
@interface TLMineHeaderView : UIView

@property (nonatomic, strong) TLUser *user;

-(TLMineHeaderView *)init;

@end
