//
//  TLMomentImageView.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLMomentImageView.h"
#import "TLMomentDetailImagesView.h"

@interface TLMomentImageView ()

@property (nonatomic, strong) TLMomentDetailImagesView *detailView;

@end
@implementation TLMomentImageView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.detailContainerView addSubview:self.detailView];
        
        [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.detailContainerView);
        }];
    }
    return self;
}

- (void)setMoment:(TLMoment *)moment
{
    [super setMoment:moment];
    [self.detailView setDetail:moment.detail];
}

#pragma mark - # Getter -
- (TLMomentDetailImagesView *)detailView
{
    if (_detailView == nil) {
        _detailView = [[TLMomentDetailImagesView alloc] init];
    }
    return _detailView;
}
@end
