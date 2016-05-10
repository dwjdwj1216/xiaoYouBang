//
//  TLMomentBaseView.h
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLMoment.h"
@interface TLMomentBaseView : UIView

@property (nonatomic, strong) UIImageView *icon;

@property (nonatomic, strong) UILabel *name;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *detailContainerView;

@property (nonatomic, strong) UIView *extensionContainerView;

@property (nonatomic, strong) TLMoment *moment;
@end
