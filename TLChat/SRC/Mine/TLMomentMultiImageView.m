//
//  TLMomentMultiImageView.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLMomentMultiImageView.h"
#import "UIView+Extensions.h"
#import <UIButton+WebCache.h>

#define     WIDTH_IMAGE_ONE     (WIDTH_SCREEN - 70) * 0.6
#define     WIDTH_IMAGE         (WIDTH_SCREEN - 70) * 0.31
#define     SPACE               4.0

@interface TLMomentMultiImageView ()

@property (nonatomic, strong) NSMutableArray *imageViews;

@end
@implementation TLMomentMultiImageView

- (void)setImages:(NSArray *)images
{
    _images = images;
    [self removeAllSubViews];
    
    if (images.count == 0) {
        return;
    }
    
    CGFloat imageWidth;
    CGFloat imageHeight;
    if (images.count == 1) {
        imageWidth = WIDTH_IMAGE_ONE;
        imageHeight = imageWidth * 0.8;
    }
    else {
        imageHeight = imageWidth = WIDTH_IMAGE;
    }
    
    
    CGFloat x = 0;
    CGFloat y = 0;
    for (int i = 0; i < images.count && i < 9; i++) {
        UIButton *imageView;
        if (i < self.imageViews.count) {
            imageView = self.imageViews[i];
        }
        else {
            imageView = [[UIButton alloc] init];
            [imageView setTag:i];
            [imageView addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.imageViews addObject:imageView];
        }
        [imageView sd_setImageWithURL:images[i] forState:UIControlStateNormal];
        [imageView setFrame:CGRectMake(x, y, imageWidth, imageHeight)];
        [self addSubview:imageView];
        
        if ((i != 0 && images.count != 4 && (i + 1) % 3 == 0) || (images.count == 4 && i == 1)) {
            y += (imageHeight + SPACE);
            x = 0;
        }
        else {
            x += (imageWidth + SPACE);
        }
    }
}

#pragma mark - # Event Response -
- (void)buttonClicked:(UIButton *)sender
{
    
}
@end
