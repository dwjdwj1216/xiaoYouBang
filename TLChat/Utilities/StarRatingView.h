//
//  StarRatingView.h
//  TLChat
//
//  Created by 戴王炯 on 4/28/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBACKGROUND_STAR @"star_off"
#define kFOREGROUND_STAR @"star"
#define kNUMBER_OF_STAR  5

@class StarRatingView;

@protocol StarRatingViewDelegate <NSObject>

@optional
-(void)starRatingView:(StarRatingView *)view score:(float)score;

@end

@interface StarRatingView : UIView

@property (nonatomic, readwrite) int numberOfStar;

@property (nonatomic, weak) id <StarRatingViewDelegate> delegate;

/**
 *  初始化TQStarRatingView
 *
 *  @param frame  Rectangles
 *  @param number 星星个数
 *
 *  @return TQStarRatingViewObject
 */
- (id)initWithFrame:(CGRect)frame numberOfStar:(int)number;

/**
 *  设置控件分数
 *
 *  @param score     分数，必须在 0 － 1 之间
 *  @param isAnimate 是否启用动画
 */
- (void)setScore:(float)score withAnimation:(bool)isAnimate;

/**
 *  设置控件分数
 *
 *  @param score      分数，必须在 0 － 1 之间
 *  @param isAnimate  是否启用动画
 *  @param completion 动画完成block
 */
- (void)setScore:(float)score withAnimation:(bool)isAnimate completion:(void (^)(BOOL finished))completion;

@end


