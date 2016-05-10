//
//  UIViewLinkmanTouch.m
//  TLChat
//
//  Created by 戴王炯 on 4/29/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "UIViewLinkmanTouch.h"

@implementation UIViewLinkmanTouch

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    //[self setBackgroundColor:[UIColor colorWithRed:227/255.0 green:227/255.0 blue:227/255.0 alpha:1.0]];
    [self setAlpha:0.5];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    //[self setBackgroundColor:[UIColor colorDefaultBlack]];
    [self setAlpha:1.0];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    //[self setBackgroundColor:[UIColor colorDefaultBlack]];
    [self setAlpha:1.0];
}

@end
