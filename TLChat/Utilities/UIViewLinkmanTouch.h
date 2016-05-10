//
//  UIViewLinkmanTouch.h
//  TLChat
//
//  Created by 戴王炯 on 4/29/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewLinkmanTouch : UIView
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
@end
